return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/playground",
    },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate", --
    opts = {
        ensure_installed = {"lua","php","rust","python"},
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    }
}
