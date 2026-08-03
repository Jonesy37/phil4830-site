# How to edit this site

Written for Logan and Riley. You do not need to know HTML.

---

## The short version

Each page of the website is one file ending in `.md`. Open it, type your
text, save. That's it.

| Page on the site | File to edit |
|---|---|
| Home | `index.md` |
| Geopolitical | `geopolitical.md` |
| Environment | `environment.md` |
| Cybersecurity | `cybersecurity.md` |
| Existential | `existential.md` |
| Social | `social.md` |
| Sources | `sources.md` |
| Purpose | `purpose.md` |
| About Us | `about.md` |

---

## Editing on GitHub (no software needed)

1. Go to the repository on github.com and click the file you want to change.
2. Click the pencil icon (top right of the file).
3. Type your changes.
4. Scroll down, click **Commit changes**.

Your edit is saved with a full history, so nothing can be permanently broken.
If something goes wrong, the previous version is always one click away under
the file's **History** tab.

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

### Links

To another page on our site:

```
[our cybersecurity page](cybersecurity.html)
```

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

Once the site is published, your edits appear on the live site about a minute
after you commit them.

To preview locally before committing, from inside this folder:

```bash
bundle exec jekyll serve
```

Then open <http://localhost:4000>. Press `Ctrl+C` in the terminal to stop it.
