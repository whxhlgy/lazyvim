return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      cmd = {
        "jdtls",
        "--jvm-arg="
          .. string.format("-javaagent:%s", vim.fn.expand("$HOME/.local/share/lazyvim/mason/share/jdtls/lombok.jar")),
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    enabled = true,
  },
}
