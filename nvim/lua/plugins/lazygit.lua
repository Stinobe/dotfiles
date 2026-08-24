-- Lazygit
-- @link https://github.com/kdheepak/lazygit.nvim
return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>tl", "<cmd>LazyGit<CR>", desc = "[T]oggle [L]azyGit" }
    },
    language = { "en" }
}

