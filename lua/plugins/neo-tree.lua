-- installing neotree for a nice filesystem.  
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
    },
    config = function ()
        -- configuring neo-tree default behavior
        require('neo-tree').setup({
            window = {
                position = "right",
            },
        })

        -- setting up neo-tree remaps
        vim.keymap.set('n', '-', ':Neotree toggle <CR>', {})
    end
}
