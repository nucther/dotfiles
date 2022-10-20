--
-- Auto Pair
--
require('nvim-autopairs').setup{}
require "lsp_signature".setup()


--CMP-LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{
    capabilities = capabilities
}
require'lspconfig'.tsserver.setup{}

-- Golang LSP ( Google )
--
require'lspconfig'.gopls.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    }
}

-- Ansible 
--
require'lspconfig'.ansiblels.setup{
    filetypes = { "yaml" }
}

