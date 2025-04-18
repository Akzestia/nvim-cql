local M = {}

function M.setup()
  -- Register filetype (alternative to ftdetect)
  vim.filetype.add({
    extension = {
      cql = "cql"
    }
  })

  -- Ensure treesitter parser is available
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

return M
