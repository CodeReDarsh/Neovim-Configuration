-- none-ls to help integrate commandline tools like linters and codeformatters into
-- a generalised LSP in-order to help it interact generally with neovim:
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    -- lazy = true,
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,           -- Lua
                null_ls.builtins.completion.spell,            -- spelling
                null_ls.builtins.formatting.shfmt,            -- Bash/Zsh
                -- require("none-ls.diagnostics.ruff"),            -- Python linter
                require("none-ls.formatting.ruff"),             -- Python formatter
                -- null_ls.builtins.diagnostics.pylint.with({     -- extra Python rules
                --     extra_args = { "--errors-only" },
                -- }),
                -- require("none-ls.diagnostics.eslint_d"),
                null_ls.builtins.formatting.prettierd,        -- JS/TS/HTML/CSS
                -- require("none-ls.diagnostics.cpplint"),         -- C/C++ style linter
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.sql_formatter,
                null_ls.builtins.formatting.asmfmt,
                -- null_ls.builtins.diagnostics.hadolint,
                null_ls.builtins.formatting.ocamlformat,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.diagnostics.sqlfluff,      -- richer SQL linting
                null_ls.builtins.formatting.djlint,
                null_ls.builtins.diagnostics.djlint,

                -- Diagnostics with markdownlint-cli2
                null_ls.builtins.diagnostics.markdownlint.with({
                    command = "markdownlint-cli2",
                    args = {
                        "--stdin",            -- read from stdin
                        "--config", vim.fn.getcwd() .. "/.markdownlint-cli2.json",
                    },
                    -- only run on markdown filetypes
                    filetypes = { "markdown", "markdown_inline" },
                }),

                -- (Optional) Formatting / auto-fix with markdownlint-cli2
                null_ls.builtins.formatting.markdownlint.with({
                    command = "markdownlint-cli2",
                    args = {
                        "--stdin",
                        "--fix",              -- apply fixes
                        "--config", vim.fn.getcwd() .. "/.markdownlint-cli2.json",
                    },
                    filetypes = { "markdown" },
                }),
            },
            automatic_installation = true,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
