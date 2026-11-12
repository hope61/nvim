-- ember palette — the 16 ANSI slots verbatim from ~/.config/ghostty/themes/ember,
-- plus the handful of surface tones a UI needs that a terminal palette has no
-- slot for. Do not tweak the ANSI values here in isolation: they are shared with
-- Ghostty and with the LS_COLORS/fzf/less settings in ~/.zshrc, so a change that
-- lives only in this file silently desyncs the three.
--
-- The ANSI ramp was built in OKLCH at an even apparent brightness (ground L .155
-- / hue 25, red accents hue 22-60, cool trio at ~1/3 the red family's chroma).
-- The surfaces below continue that ground: same hue, stepped up in lightness.

return {
  -- ── ground ─────────────────────────────────────────────────────────
  bg = '#150808', -- Ghostty `background`
  fg = '#e0cec7', -- Ghostty `foreground`

  -- Surfaces. Only reached by windows that must occlude what is behind
  -- them (floats, popup menus); the editor body itself stays transparent
  -- so Ghostty's 0.7 opacity + blur shows through.
  surface = '#1d0e0d', -- floats, popup menu
  overlay = '#261412', -- popup selection, tab bar
  line = '#1e0f0e', -- cursorline
  divider = '#311e1d', -- Ghostty `split-divider-color`

  sel_bg = '#401d1c', -- Ghostty `selection-background`
  sel_fg = '#f1e5df', -- Ghostty `selection-foreground`
  cursor = '#e66e68', -- Ghostty `cursor-color`

  -- ── normal ─────────────────────────────────────────────────────────
  black = '#412d2b',
  red = '#ce5456',
  green = '#758764',
  yellow = '#c18154',
  blue = '#6d7c9a',
  magenta = '#c06882',
  cyan = '#659193',
  white = '#cbbab2',

  -- ── bright ─────────────────────────────────────────────────────────
  br_black = '#886d6a',
  br_red = '#e36864',
  br_green = '#90a781',
  br_yellow = '#e4a26c',
  br_blue = '#899abd',
  br_magenta = '#d27a99',
  br_cyan = '#80afb1',
  br_white = '#f1e5df',

  -- ── derived ────────────────────────────────────────────────────────
  -- Punctuation sits between br_black and white: present enough to trace
  -- nesting, quiet enough not to compete with identifiers.
  punct = '#9c807a',

  -- ANSI slot 0 is a background tone (1.5:1 on this ground) and is unreadable
  -- as text, so anything that must be *read* while staying recessed -- line
  -- numbers, inlay hints, AI ghost text -- uses this instead, at 3.2:1.
  -- Purely decorative rules (indent guides, listchars) keep slot 0.
  dim = '#785a56',

  -- Diff washes. Tinted toward their signal hue but kept in the warm
  -- ground's lightness band so a diff does not flare against the body.
  diff_add = '#1b2117',
  diff_del = '#2a1213',
  diff_chg = '#221a14',
  diff_txt = '#3a2a1c',
}
