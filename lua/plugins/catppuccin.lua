-- installing catppuccin for colorscheme
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- finally telling neovim to enable catppuccin colorscheme.
        vim.cmd.colorscheme "catppuccin"
    end
}
