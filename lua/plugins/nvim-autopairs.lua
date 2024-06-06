return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local Rule = require("nvim-autopairs.rule")
    autopairs.add_rule(Rule("$$", "$$", "tex"))
    -- you can use some built-in conditions
    local cond = require("nvim-autopairs.conds")
    -- autopairs.add_rules({
    --   Rule("<", ">", { "java" })
    --     -- disable adding a newline when you press <cr>
    --     :with_cr(cond.none())
    --     :with_move(cond.after_regex(">")),
    -- })

    -- Add a rule for adding a space between brackets
    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
    autopairs.add_rules({
      -- Rule for a pair with left-side ' ' and right side ' '
      Rule(" ", " ")
        -- Pair will only occur if the conditional function returns true
        :with_pair(function(opts)
          -- We are checking if we are inserting a space in (), [], or {}
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
        :with_del(function(opts)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local context = opts.line:sub(col - 1, col + 2)
          return vim.tbl_contains({
            brackets[1][1] .. "  " .. brackets[1][2],
            brackets[2][1] .. "  " .. brackets[2][2],
            brackets[3][1] .. "  " .. brackets[3][2],
          }, context)
        end),
    })
    -- For each pair of brackets we will add another rule
    for _, bracket in pairs(brackets) do
      autopairs.add_rules({
        -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
        Rule(bracket[1] .. " ", " " .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(opts)
            return opts.char == bracket[2]
          end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(function(_)
            return "<C-c>2xi<CR><C-c>O"
          end),
      })
    end
  end,
}
