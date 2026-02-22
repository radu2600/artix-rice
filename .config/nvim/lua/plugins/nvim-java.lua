return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
  -- JDTLS configuration
  spring_boot_tools = {
    enable = false,
  },

  -- Logging
  log = {
    use_console = true,
    use_file = true,
    level = 'info',
    log_file = vim.fn.stdpath('state') .. '/nvim-java.log',
    max_lines = 1000,
    show_location = false,
  },
})
    -- Configure jdtls via vim.lsp.config (nvim-lspconfig v0.11+)
    -- Enable the server
    vim.lsp.enable('jdtls')

  end
}
