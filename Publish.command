#!/bin/sh
#
# Double-click this file in Finder to put your changes on the live site.
#
# It asks what you changed, shows which files it's about to publish, warns
# about unfinished notes, and waits for you to confirm.
#
# If the pop-up box can't be shown for any reason, it asks in this window
# instead — it should never just quit without telling you why.

cd "$(dirname "$0")" || exit 1

echo "Checking for changes..."
echo

# --- nothing to do? -------------------------------------------------------

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing has changed since your last publish."
  echo "Nothing to send. You can close this window."
  exit 0
fi

# --- what changed ---------------------------------------------------------

changed=$(git status --porcelain | sed 's/^...//' | sed 's/^/  /')

# Notes-to-self that would be published as visible text: [Source],
# [Definition], [Link to ...], a bare URL in brackets, {a note}.
# Real markdown links end in "](" and are filtered out below.
notes=$(grep -noE "\[[^]^(]*([Ss]ource|Definition|Link to)[^](]*\]\(?|\[https?://[^]]*\]|\{[^}]{2,}\}" ./*.md 2>/dev/null \
  | grep -v "README.md" \
  | grep -vE '\($' \
  | sed 's|^\./||' \
  | cut -c1-70)

warning=""
if [ -n "$notes" ]; then
  count=$(printf '%s\n' "$notes" | wc -l | tr -d ' ')
  shown=$(printf '%s\n' "$notes" | head -6 | sed 's/^/  /')
  warning="

$count unfinished note(s) would appear on the page as written:
$shown"
  if [ "$count" -gt 6 ]; then
    warning="$warning
  ...and $((count - 6)) more"
  fi
fi

echo "About to publish:"
printf '%s\n' "$changed"
if [ -n "$warning" ]; then
  printf '%s\n' "$warning"
fi
echo

# --- ask what changed -----------------------------------------------------
#
# Plain "display dialog" runs in osascript's own context. Using
# 'tell application "System Events"' here would need macOS Automation
# permission, which Terminal may not have been granted — and that failed
# silently, which is why this script previously appeared to do nothing.

prompt="What did you change?

This is a note to your future self, so you can find or undo it later.$warning"

dialog_out=$(osascript 2>&1 <<END
display dialog "$(printf '%s' "$prompt" | sed 's/\\\\/\\\\\\\\/g; s/"/\\\\"/g')" default answer "" with title "Publish site" buttons {"Cancel", "Publish"} default button "Publish"
return text returned of result
END
)
dialog_code=$?

if [ $dialog_code -eq 0 ]; then
  message="$dialog_out"
else
  case "$dialog_out" in
    *"User canceled"*|*-128*)
      echo "Cancelled. Nothing was published."
      echo "You can close this window."
      exit 0
      ;;
    *)
      echo "Couldn't show the pop-up box. Reason:"
      echo "  $dialog_out"
      echo
      echo "Asking here instead."
      printf "What did you change? (or press Return to cancel) "
      read -r message
      if [ -z "$message" ]; then
        echo "Cancelled. Nothing was published."
        exit 0
      fi
      ;;
  esac
fi

if [ -z "$message" ]; then
  message="Updated the site"
fi

# --- publish --------------------------------------------------------------

echo
echo "Publishing..."

if ! git add -A; then
  echo
  echo "FAILED while collecting your changes. Nothing was published."
  echo "Show this window to Claude."
  exit 1
fi

if ! git commit -q -m "$message"; then
  echo
  echo "FAILED while saving your changes. Nothing was published."
  echo "Show this window to Claude."
  exit 1
fi

if ! git push -q origin main; then
  echo
  echo "Your changes were SAVED on this computer but could NOT be sent."
  echo "Check your internet connection and run this again, or show this"
  echo "window to Claude."
  exit 1
fi

echo
echo "Sent. The live site updates in about a minute:"
echo "  https://jonesy37.github.io/phil4830-site/"
echo
echo "You can close this window."
