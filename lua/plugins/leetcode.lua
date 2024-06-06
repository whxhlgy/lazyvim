local leet_arg = "leetcode.nvim"
return {
  "kawre/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv()[1],
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- telescope 所需
    "MunifTanjim/nui.nvim",

    -- 可选
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    injector = {
      -- ["python3"] = {
      -- 	before = true,
      -- },
      -- ["cpp"] = {
      -- 	before = { "#include <bits/stdc++.h>", "using namespace std;" },
      -- 	after = "int main() {}",
      -- },
      ["java"] = {
        before = "import java.util.*;",
      },
    },
    cn = {
      enabled = true,
    },
    lang = "java",
  },
  keys = {
    { "<leader>lt", "<cmd>Leet run<cr>", desc = "Run leetcode" },
    { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit current Leetcode solution" },
  },
}
