local M = {}

local function install_parser()
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
end

function M.setup()
    vim.filetype.add({ extension = { cql = "cql" } })
    install_parser()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "cql" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
    })
end

return M
