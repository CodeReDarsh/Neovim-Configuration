-- everything to do with language server protocol configuration and installation in neovim
return {
    {
        -- installing mason to manage and install LSPs
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        -- installing lsp-config to enable
        "neovim/nvim-lspconfig",
        config = function()
            -- local lspconfig = require("lspconfig")

            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- require("lspconfig").clangd.setup({
            --     capabilities = capabilities,
            --     -- other lspconfig configs
            -- })
            -- lspconfig.lua_ls.setup({})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.lsp.enable("bashls")
        end,
    },
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                {"nvim-dap-ui"}
            },
        },
        config = function ()
            require("lazydev").setup()
        end
    },
}
