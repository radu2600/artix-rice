return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  keys = {
    {
      "<leader>pw",
      function()
        require("conform").format({ async = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  opts = {
    -- Formatter selection
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
    },

    -- Fallback to LSP formatting if no formatter exists
    default_format_opts = {
      lsp_format = "fallback",
    },

    -- Formatter customization
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },

      prettier = {
        -- Run Prettier from the nearest project root
        cwd = function(_, ctx)
          return vim.fs.root(ctx.dirname, {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            "prettier.config.js",
            "prettier.config.cjs",
            "package.json",
            ".git",
          }) or vim.fn.getcwd()
        end,
      },
    },
  },

  init = function()
    -- Enable conform as formatexpr provider
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}