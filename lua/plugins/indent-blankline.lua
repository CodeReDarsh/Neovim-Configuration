-- add indentation lines to make my life sane
return {
    "lukas-reineke/indent-blankline.nvim",
    -- lazy = true,
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function ()
        require("ibl").setup()
    end
}
