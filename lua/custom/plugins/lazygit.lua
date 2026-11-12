return {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitCurrentFile', 'LazyGitLog' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
    { '<leader>gl', '<cmd>LazyGitLog<cr>', desc = '[G]it [L]og' },
  },
}
