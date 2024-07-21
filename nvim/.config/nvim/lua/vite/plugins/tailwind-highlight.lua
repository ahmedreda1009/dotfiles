return {
  'princejoogie/tailwind-highlight.nvim',
  dependencies = {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig'
  },
  config = function()
    local tw_highlight = require('tailwind-highlight')

    require('nvim-lsp-installer').on_server_ready(function(server)
      local opts = {
        on_attach = function(client, bufnr)
          -- rest of you config
          tw_highlight.setup(client, bufnr, {
            single_column = false,
            mode = 'background',
            debounce = 200,
          })
        end
      }

      server:setup(opts)
    end)
  end
}
