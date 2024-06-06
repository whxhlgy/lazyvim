return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_language_server = {
        filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        init_options = {
          ---@type table<string, string>
          includeLanguages = {
            javascript = "javascriptreact",
          },
        },
      },

      tsserver = {
        settings = {
          -- log = { level = "verbose" },
        },
      },
    },
  },
}
