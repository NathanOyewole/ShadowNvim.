local lspconfig = require("lspconfig")

-- Replace deprecated tsserver with ts_ls
local servers = { "lua_ls", "ts_ls", "html", "cssls", "jsonls", "pyright" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({})
end
