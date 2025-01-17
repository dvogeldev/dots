-- In your LazyVim config (usually in ~/.config/nvim/lua/plugins/prettier.lua)
return {
  {
    "prettier/vim-prettier",
    ft = { "markdown" },
    config = function()
      vim.g["prettier#config#print_width"] = 80
      vim.g["prettier#config#prose_wrap"] = "always"
    end,
  },
}
