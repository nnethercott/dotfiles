return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    priority = 2,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 32,
            }
        })


        vim.keymap.set({ "n", "x" }, "<leader>e", ":Neotree toggle<CR>")
        vim.keymap.set({ "n", "x" }, "<leader>ef", ":Neotree reveal<CR>")
    end,

}
