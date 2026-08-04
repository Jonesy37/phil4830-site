# How to edit this site

You do not need to know HTML.

**Live site:** <https://jonesy37.github.io/phil4830-site/>

---

## The everyday routine

1. Write in **Obsidian** (setup below — one time only).
2. **Double-click `Publish.command`** in this folder.
3. Type what you changed, click Publish. Done.

The site updates about a minute later.

That's the whole loop. Everything below is detail.

---

## The short version

Each page of the website is one file ending in `.md`. Open it, type your
text, save. That's it.

| Page on the site | File to edit |
|---|---|
| Home | `index.md` |
| Environmental | `environmental.md` |
| Social | `social.md` |
| Geopolitical | `geopolitical.md` |
| Safety | `safety.md` |
| Long Term | `long-term.md` |
| Sources | `sources.md` |
| Purpose | `purpose.md` |
| About Us | `about.md` |

---

## Writing in Obsidian

This folder is already set up as an Obsidian vault. To open it the first time:

1. Open Obsidian.
2. **Open folder as vault**.
3. Choose this `site` folder.
4. Say **Trust author and enable plugins** if it asks.

After that it appears in your vault list and you just pick it.

**Don't make a separate vault for the site.** This folder *is* the vault, so
the file you edit is the page that publishes. A separate vault would mean
copying text across every time, and the two would drift apart.

The sidebar shows exactly ten files: this guide, plus the nine pages. The
site's machinery — stylesheet, layout, build files — is in formats Obsidian
doesn't display, so it stays out of your way.

If you want a vault for research notes as well, keep it separate from this
one. Notes living in here would be at risk of getting published.

Obsidian shows the settings block at the top of each file as a tidy
**Properties** panel rather than raw text, which makes it hard to break by
accident.

### Two settings already configured for you

- **Links use standard Markdown**, not Obsidian's `[[double brackets]]`.
  The website can't read double brackets; standard links work in both.
- **Line breaks behave like the website does**, so what you see while
  writing matches what gets published.

Don't change either of those in Obsidian's settings, or pages may come out
looking different from how they did while you were writing them.

---

## Editing on GitHub instead (no software needed)

Occasionally useful — fixing a typo from a computer that isn't yours:

1. Go to the repository on github.com and click the file you want to change.
2. Click the pencil icon (top right of the file).
3. Type your changes.
4. Scroll down, click **Commit changes**.

This publishes immediately, with no preview. Fine for a small fix; use
Obsidian for real writing.

Either way, every version is kept. If something goes wrong, the previous
version is one click away under the file's **History** tab.

---

## The one part not to touch

Every file starts with a few lines between two rows of dashes:

```
---
layout: default
title: Cybersecurity
---
```

Leave that block alone. It tells the site which page this is. Everything
**below** the second row of dashes is yours to write.

Changing `title:` changes the big heading on the page — but the name in the
menu comes from `_config.yml`, so change it in both places or they won't match.

---

## Writing text

Just type normally. A blank line starts a new paragraph.

### Don't indent your paragraphs

This one bites. **Never start a line with a Tab or four spaces.** Doing that
turns the paragraph into a computer-code box — grey monospace type that runs
off the side of the page instead of wrapping.

```
This paragraph is fine.

	This one starts with a Tab, and will come out looking like code.
```

Paragraphs are separated by blank lines here, not by indenting the first
line the way you would in an essay. If a paragraph shows up in typewriter
text on the site, this is why.

```
This is one paragraph.

This is a second paragraph.
```

### Bold and italic

```
**bold text**
*italic text*
```

### Headings inside a page

```
## A section heading
### A smaller heading
```

These render in the same serif font as the big page heading, just smaller,
so a page reads as one piece.

### Links

To another page on our site — use Obsidian's link autocomplete, or type it:

```
[our safety page](safety.md)
```

The `.md` gets turned into the right web address automatically when the site
is built, so you never have to think about it.

To an outside source:

```
[Bostrom, 2014](https://example.com/the-article)
```

### Bulleted list

```
- First point
- Second point
- Third point
```

### Numbered list

```
1. First point
2. Second point
```

### Block quote

```
> A quoted passage from a source.
```

### Footnotes for citations

Put a marker where the claim is, and the source at the bottom of the page:

```
...approved for construction in Box Elder County, Utah.[^1]

[^1]: https://thestratosproject.com
```

The marker becomes a small numbered link. All the sources collect themselves
into a tidy list at the very bottom of the page, under a dividing line, and
each one links back to where it was cited. Numbering is automatic — use
`[^2]`, `[^3]` and so on, and they'll sort themselves out even if you add
one in the middle later.

---

## Starting a new white box

The text on each page sits inside a white box with a soft shadow. To break
your text into **two or more boxes**, put three dashes on their own line:

```
This text is in the first box.

---

This text is in a second box.
```

**Important:** leave a blank line above and below the three dashes. Without
the blank line above, the dashes turn the line before them into a heading
instead of starting a new box.

The home page already uses this — the mission statement is one box, the
longer introduction is the second.

---

## Changing the site title, tagline, or menu names

These live in `_config.yml`, and changing them updates every page at once:

- `title:` — the big title at the top of the home page
- `tagline:` — the line under it
- `nav_topics:` / `nav_site:` — the names in the two menu rows

To rename a menu tab, edit its `name:`. If you also want to rename the file
behind it, change the `url:` and rename the `.md` file to match.

---

## Changing colors, fonts, or spacing

All of it lives in `styles.css`, and the colors are grouped at the very top:

```css
--page-bg:    #F7F7F5;   /* off-white page background */
--block-bg:   #FFFFFF;   /* the white boxes */
--text:       #1C1C1C;   /* body text */
--text-muted: #5A5A5A;   /* tagline and menu links */
--accent:     #3D6098;   /* slate blue — menu tab and text link underlines */
```

Change a value there and it updates everywhere on the site.

---

## Previewing your changes

To see the styled site on your own computer before anyone else does, open
Terminal, go to this folder, and run:

```bash
./preview
```

Then open <http://localhost:4000>. Leave it running while you work — saving a
`.md` file rebuilds the site, so you just refresh the browser to see changes.
Press `Ctrl+C` in the Terminal to stop it.

The first run takes a minute while it downloads what it needs. After that it
starts in a couple of seconds. It needs Ruby 3 or newer; if it's missing, the
script tells you the one command to install it.

---

## Publishing your changes

**Double-click `Publish.command`** in this folder (Finder → the `site`
folder → the file with the little terminal icon).

A box appears asking what you changed, and listing the files it's about to
publish. Type a short note, click **Publish**. Click **Cancel** and nothing
happens.

That's it. The live site updates about a minute later:

<https://jonesy37.github.io/phil4830-site/>

The note you type is just for your future self — it's how you find or undo
a specific change later. Nobody else reads it.

**Tip:** drag `Publish.command` to your Dock, or right-click it → *Make
Alias* and put the alias on your Desktop, so you don't have to dig for it.

### The same thing from Terminal

If you'd rather not use the double-click version:

```bash
./publish "wrote the first half of the Safety page"
```

If you want to watch it happen, run `gh run watch`.

**The site is public.** Anything you publish is visible to anyone with the
link, and search engines can find it. The script warns you if pages still
have placeholder text on them, but it can't tell finished writing from a
rough draft — that part's on you.

---

## If something breaks

Nothing is ever permanently lost. Every version of every page is saved.

- **A page looks wrong after an edit** — open the file on github.com, click
  **History**, and view or restore the previous version.
- **The site didn't update** — check the **Actions** tab on github.com. A red
  X means the build failed; click it to see why.
- **You want an older version of something** — same **History** tab. Every
  save is there, with the note you wrote.
