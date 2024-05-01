return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>ff", builtin.find_files, desc = "Fuzzy find files in cwd" },
      { "<leader>fr", builtin.oldfiles, desc = "Fuzzy find recent files" },
      { "<leader>fs", builtin.live_grep, desc = "Find string in cwd" },
      { "<leader>fc", builtin.grep_string, desc = "Find string under cursor in cwd" },
      { "<leader>fb", builtin.buffers, desc = "Find opened buffers" },
    }
  end,
}
