local M = {}

local default_config = {
    treesitter = {
        enable = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = { enable = true },
        textobjects = { enable = true }
    }
}

function M.setup(user_config)
    local config = vim.tbl_deep_extend("force", default_config, user_config or {})

    vim.filetype.add({
        extension = {
            cql = "cql"
        }
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.cql = {
        install_info = {
            url = "https://github.com/Akzestia/tree-sitter-cql",
            files = { "src/parser.c" },
            branch = "main",
            generate_requires_npm = false,
            requires_generate_from_grammar = false,
        },
        filetype = "cql",
    }

    if config.treesitter.enable then
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "cql" },
            highlight = config.treesitter.highlight,
            incremental_selection = config.treesitter.incremental_selection,
            textobjects = config.treesitter.textobjects,
        })
    end
end

return M
