-- Entry point for `:colorscheme ember` and `:Telescope colorscheme`.
-- The definitions live in lua/ember/; this only clears and applies them.
vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd.syntax 'reset'
end

-- Reloaded on every :colorscheme so edits to the palette take effect
-- without restarting Neovim.
package.loaded['ember'] = nil
package.loaded['ember.palette'] = nil

require('ember').load()
