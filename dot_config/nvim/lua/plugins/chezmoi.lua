return {
  {
    "xvzc/chezmoi.nvim",
    version = "*",
    lazy = true,
    cmd = {
      "ChezmoiEdit",
      "ChezmoiApply",
    },
    event = {
      -- Trigger when editing files in chezmoi source directory
      "BufReadPre "
        .. vim.fn.expand("~/.local/share/chezmoi")
        .. "/*",
      "BufNewFile " .. vim.fn.expand("~/.local/share/chezmoi") .. "/*",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      -- Setup chezmoi.nvim
      require("chezmoi").setup({
        edit = {
          watch = true, -- Automatically apply changes on save
          force = false,
        },
        notification = {
          on_open = true,
          on_apply = true,
          on_watch = true,
        },
      })

      -- Create which-key mappings for common commands
      local wk = require("which-key")
      local chezmoi_dir = vim.fn.expand("~/.local/share/chezmoi")

      -- Normal mode mappings
      wk.register({
        ["<leader>z"] = {
          name = "Chezmoi",
          f = {
            function()
              require("fzf-lua").files({
                cwd = chezmoi_dir,
                prompt = "Chezmoi Files> ",
                cmd = "cd " .. chezmoi_dir .. " && git ls-files --cached --others --exclude-standard",
                actions = {
                  ["default"] = function(selected)
                    vim.cmd("ChezmoiEdit " .. selected[1])
                  end,
                },
              })
            end,
            "Find Chezmoi Files",
          },
          a = { "<cmd>ChezmoiApply<cr>", "Apply Changes" },
          e = { "<cmd>ChezmoiEdit<cr>", "Edit Current in Chezmoi" },
          c = { "<cmd>!chezmoi add %<cr>", "Add Current to Chezmoi" },
          s = { "<cmd>!chezmoi status<cr>", "Chezmoi Status" },
          d = { "<cmd>!chezmoi diff<cr>", "Chezmoi Diff" },
        },
      })

      -- Set up autocommands for automatic application
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = vim.fn.expand("~/.local/share/chezmoi/*"),
        callback = function()
          vim.cmd("ChezmoiApply")
        end,
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
}
