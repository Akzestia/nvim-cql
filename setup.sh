touch ~/.config/nvim/lua/plugins/nvim-cql.lua;
cat > ~/.config/nvim/lua/plugins/nvim-cql.lua <<EOF
return {
    "Akzestia/nvim-cql",
    config = true,
    ft = "cql",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
EOF
