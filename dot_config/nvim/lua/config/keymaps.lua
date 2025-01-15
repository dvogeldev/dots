-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap configuration for LazyVim
local function setup_obsidian_keymaps()
  local obsidian = {
    -- Map keys for Obsidian.nvim
    ["<leader>oo"] = { ":ObsidianOpen<CR>", "Open Obsidian Vault" },
    ["<leader>on"] = { ":ObsidianNew<CR>", "New Obsidian Note" },
    ["<leader>ob"] = { ":ObsidianBacklinks<CR>", "View Backlinks" },
    ["<leader>ol"] = { ":ObsidianLink<CR>", "Insert Obsidian Link" },
    ["<leader>os"] = { "<cmd>lua require('fzf-lua').files({ cwd = '~/path/to/vault' })<CR>", "Search Notes" },
  }

  -- Add these to LazyVim's keymap setup
  for key, value in pairs(obsidian) do
    vim.keymap.set("n", key, value[1], { desc = value[2] })
  end
end

setup_obsidian_keymaps()
