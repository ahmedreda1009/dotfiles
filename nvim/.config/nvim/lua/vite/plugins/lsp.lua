return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "tsserver", -- this is the old name for ts server
          "ts_ls", -- this is the new name for ts server
          "lua_ls",
          "cssls",
          "graphql",
          "html",
          "jsonls",
          "tailwindcss",
          "eslint",
          "angularls",
          -- "Svelte",
          -- "nginx_language_server",
          -- "htmx",
          -- "dockerls",
          -- "sqls",
          -- "prismals",
          -- "emmet_language_server",
          "emmet_ls",
          -- "diagnosticls", -- general purpose server
          -- "solargraph", -- ruby
          "somesass_ls",   -- sass
          "cssmodules_ls", -- css modules lsp
        },
      })

      local keymap = vim.keymap -- for conciseness

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, silent = true }

          -- set keybinds
          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- ts_ls is the new name for tsserver
      lspconfig.ts_ls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.graphql.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.angularls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.somesass_ls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
      lspconfig.cssmodules_ls.setup({
        -- on_attach = attach
        capabilities = capabilities,
      })
    end,
  },
}
