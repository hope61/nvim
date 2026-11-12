-- Renders markdown buffers in place: styled headings, bullets, checkboxes,
-- code blocks and tables, with the raw syntax concealed on inactive lines.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { 'markdown' },
  opts = {
    -- Conceal markup everywhere except the line the cursor is on, so the
    -- rendered view stays readable while remaining editable.
    render_modes = { 'n', 'c', 't' },
    heading = { position = 'inline' },
    code = { width = 'block', min_width = 60 },
  },
  keys = {
    { '<leader>tm', '<cmd>RenderMarkdown toggle<CR>', desc = '[T]oggle [M]arkdown rendering' },
  },
}
