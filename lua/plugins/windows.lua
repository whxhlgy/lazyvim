local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end
return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  keys = {
    { "<C-w>z", cmd("WindowsMaximize"), desc = "Maximize the windows" },
    { "<C-w>_", cmd("WindowsMaximizeVertically"), desc = "Maximize the windows Vertically" },
    { "<C-w>|", cmd("WindowsMaximizeHorizontally"), desc = "Maximize the windows Horizontally" },
    { "<C-w>=", cmd("WindowsEqualize"), desc = "Maximize the windows Equalize" },
  },
  config = function()
    require("windows").setup()
  end,
}
