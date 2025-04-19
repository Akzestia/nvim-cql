# Nvim CQL

[🇺🇸 English](README.md) | [🇯🇵 日本語](README_jap.md)

---------------------------

**オープンソース** **CQL** (Cassandra クエリ言語) 用の tree-sitter 文法 ^_^。

![image](https://github.com/user-attachments/assets/7498a6e6-d517-43fb-aee4-634779ac9954)

## インストール

```sh
touch ~/.config/nvim/lua/plugins/nvim-cql.lua;
cat > ~/.config/nvim/lua/plugins/nvim-cql.lua <<EOF
return {
    "Akzestia/nvim-cql",
    config = true,
    ft = "cql",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
EOF
```
