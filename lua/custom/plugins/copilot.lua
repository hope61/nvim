return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true, -- ghost text appears as you type, no menu needed
      keymap = {
        accept = '<C-l>', -- Ctrl-l to accept (Option key isn't Alt on macOS)
        next = '<C-j>',
        prev = '<C-k>',
        dismiss = '<C-]>',
      },
    },
    panel = { enabled = false },
  },
  config = function(_, opts)
    require('copilot').setup(opts)
    -- Ghost text and the blink menu never overlap: while the menu is open the
    -- suggestion hides, and it returns the moment the menu closes.
    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuOpen',
      callback = function()
        vim.b.copilot_suggestion_hidden = true
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuClose',
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })
  end,
}
