return {
  -- stuff like cargo build prog
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  }
}
