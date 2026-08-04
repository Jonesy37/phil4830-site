#!/bin/sh
#
# Double-click this file in Finder to put your changes on the live site.
#
# It asks what you changed, shows you which files it's about to publish,
# and waits for you to confirm. Nothing goes live until you say yes.

cd "$(dirname "$0")"

# --- nothing to do? -------------------------------------------------------

if [ -z "$(git status --porcelain)" ]; then
  osascript -e 'display dialog "Nothing has changed since your last publish, so there is nothing to send." with title "Publish site" buttons {"OK"} default button "OK" with icon note' >/dev/null 2>&1
  exit 0
fi

# --- what changed? --------------------------------------------------------

changed=$(git status --porcelain | sed 's/^...//' | sed 's/^/  /')

message=$(osascript <<END 2>/dev/null
tell application "System Events"
  activate
  set theResult to display dialog "What did you change?

This is just a note to your future self, so you can find or undo this later.

Files about to be published:
$changed" default answer "" with title "Publish site" buttons {"Cancel", "Publish"} default button "Publish" with icon note
  return text returned of theResult
end tell
END
)

# Cancel button, or the dialog was dismissed.
if [ $? -ne 0 ]; then
  exit 0
fi

if [ -z "$message" ]; then
  message="Updated the site"
fi

# --- publish --------------------------------------------------------------

echo "Publishing..."

if ! git add -A 2>&1; then
  osascript -e 'display dialog "Could not stage your changes. Ask Claude to take a look." with title "Publish failed" buttons {"OK"} with icon stop' >/dev/null 2>&1
  exit 1
fi

if ! git commit -q -m "$message" 2>&1; then
  osascript -e 'display dialog "Could not save your changes. Ask Claude to take a look." with title "Publish failed" buttons {"OK"} with icon stop' >/dev/null 2>&1
  exit 1
fi

if ! git push -q origin main 2>&1; then
  osascript -e 'display dialog "Your changes were saved on this computer, but could not be sent to GitHub. Check your internet connection, or ask Claude to take a look." with title "Publish failed" buttons {"OK"} with icon stop' >/dev/null 2>&1
  exit 1
fi

osascript -e 'display dialog "Sent. Your changes appear on the live site in about a minute.

https://jonesy37.github.io/phil4830-site/" with title "Published" buttons {"OK"} default button "OK" with icon note' >/dev/null 2>&1

echo "Done. You can close this window."
