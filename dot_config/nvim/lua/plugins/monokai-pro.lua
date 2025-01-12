return {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      filter = "spectrum", -- You can set the variant here: classic, octagon, pro, machine, ristretto, spectrum
    })
  end,
}
