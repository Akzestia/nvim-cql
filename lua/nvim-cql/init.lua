local M = {}

function M.setup(user_config)
    local config = vim.tbl_deep_extend("force", {
        treesitter = {
            enable = true,
            highlight = { enable = true },
        }
    }, user_config or {})

    vim.filetype.add({ extension = { cql = "cql" } })
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.cql",
        callback = function() vim.bo.filetype = "cql" end
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.cql = {
        install_info = {
            url = "https://github.com/Akzestia/tree-sitter-cql",
            files = { "src/parser.c" },
            -- Add compiled parser location
            location = vim.fn.stdpath("data") .. "/site/parser/cql.so",
            branch = "main",
        },
        filetype = "cql",
    }

    if config.treesitter.enable then
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "cql",
            callback = function()
                require("nvim-treesitter.configs").setup({
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },

                })
                vim.treesitter.start()
            end
        })
    end
end

return M
