    -- installing treesitter for syntax highlighting and generating ASTs which are then used by parsers for syntax highlighting for various languages.
    -- Also helps in auto indenting code. It's also used by autocompleters I think.
return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        -- setting up treesitter
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "asm",
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "cpp",
                "css",
                "csv",
                "dockerfile",
                "doxygen",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "http",
                "html",
                "htmldjango",
                "java",
                "javadoc",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "jsonc",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "ocaml",
                "vim",
                "vimdoc",
                "printf",
                "python",
                "query",
                "rust",
                "sql",
                "typescript",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
