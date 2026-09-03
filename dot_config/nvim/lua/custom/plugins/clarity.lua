local function gh(repo) return 'https://github.com/' .. repo end
  vim.pack.add { gh 'ezpieco/clarity.nvim' }
  -- require('clarity').setup {
  --   as = "clarity",
  --   config = function()
        -- vim.cmd("colorscheme clarity")
  --   end
  -- }
