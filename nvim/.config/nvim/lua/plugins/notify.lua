return {
  -- stuff like cargo build prog
  {
    "j-hui/fidget.nvim",
    enabled = true,
    config = function()
      require("fidget").setup()
    end
  }
}
