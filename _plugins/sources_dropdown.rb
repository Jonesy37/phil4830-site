# Turns each page's footnotes into a collapsed "Sources" dropdown, and makes
# every source a working link.
#
# Two problems this solves:
#
#   1. A footnote written as   [^1]: https://example.com/article
#      renders as plain text. Markdown does not turn a bare web address into
#      a link on its own, so the sources were unclickable.
#
#   2. The footnote list sat inside the reading box at the bottom of the
#      page, adding a long tail of addresses to every page.
#
# So: the list is lifted out of the reading box, its addresses are turned
# into real links, and the whole thing is folded into a dropdown that sits
# below the box, closed until someone opens it.
#
# This runs while the site is being built. Nothing changes about how you
# write footnotes — keep pasting the address after [^1]: as you do now.

# ---------------------------------------------------------------------------
# Guard against a footnote disappearing because its title contains a pipe.
#
# A footnote written like
#
#   [^2]: [Better language models and their implications | OpenAI](https://…)
#
# is dropped from the page entirely — no error, no gap, the source simply
# never appears. The pipe is the cause: Markdown reads it as table syntax.
# News headlines contain pipes constantly ("Headline | The Guardian"), so
# this is a trap that would keep catching sources silently.
#
# Escaping the pipe fixes it, so that is done automatically here, only on
# footnote definition lines, before the page is converted. Tables elsewhere
# are untouched.
# ---------------------------------------------------------------------------
module FootnotePipeGuard
  FOOTNOTE_LINE = %r{^(\[\^[^\]]+\]:.*)$}

  def self.apply(markdown)
    markdown.gsub(FOOTNOTE_LINE) do
      line = Regexp.last_match(1)
      # Escape only pipes that are not already escaped.
      line.gsub(/(?<!\\)\|/, '\\\\|')
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :pre_render do |item|
  next unless item.respond_to?(:content) && item.content.is_a?(String)
  next unless item.respond_to?(:extname) && [".md", ".markdown"].include?(item.extname)

  item.content = FootnotePipeGuard.apply(item.content)
end

module SourcesDropdown
  # The footnote list kramdown produces, as a whole.
  FOOTNOTES = %r{<div class="footnotes"[^>]*>\s*<ol>.*?</ol>\s*</div>}m

  # A bare web address that is not already part of a tag.
  #
  # [[:space:]] rather than \s on purpose. Markdown puts a non-breaking
  # space (U+00A0) between a footnote's text and its back-arrow, and Ruby's
  # \s does not match that character — so \s here swallowed the invisible
  # space into the end of every address and broke every link.
  BARE_URL = %r{(?<![="])(https?://[^[:space:]<>"']+?)(?=[).,;]?(?:[[:space:]]|<|$))}

  def self.linkify(fragment)
    fragment.gsub(BARE_URL) do |url|
      %(<a href="#{url}" target="_blank" rel="noopener noreferrer">#{url}</a>)
    end
  end

  def self.apply(html)
    return html unless html.include?('class="footnotes"')

    list = html[FOOTNOTES]
    return html if list.nil?

    # Lift the list out of the reading box.
    html = html.sub(FOOTNOTES, "")

    count = list.scan(%r{<li id="fn:}).length
    label = count == 1 ? "1 source" : "#{count} sources"

    dropdown = <<~HTML
      <details class="sources">
        <summary><span class="sources-label">Sources</span><span class="sources-count">#{label}</span></summary>
        #{linkify(list)}
      </details>
    HTML

    # Sits between the reading box and the menu at the foot of the page.
    if html.include?('<nav class="nav nav-bottom">')
      html.sub('<nav class="nav nav-bottom">', dropdown + '<nav class="nav nav-bottom">')
    else
      html
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  next unless item.respond_to?(:output) && item.output
  next unless item.respond_to?(:output_ext) && item.output_ext == ".html"

  item.output = SourcesDropdown.apply(item.output)
end
