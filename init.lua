require("config.lazy")
require("config.mappings")
require("config.options")

require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.emmet_ls.setup{}
