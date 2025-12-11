return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "cssls",
          "graphql",
          "html",
          "jsonls",
          "tailwindcss",
          "eslint",
          "angularls",
          "clangd",
          "glint",
          "emmet_ls",
          "somesass_ls",
          "cssmodules_ls",
        },
      })

      -- Shortcut
      local keymap = vim.keymap

      -- LSP keymaps on attach
      local on_attach = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        local mappings = {
          { "n",          "gr",         "<cmd>Telescope lsp_references<CR>",       "Show LSP references" },
          { "n",          "gD",         vim.lsp.buf.declaration,                   "Go to declaration" },
          { "n",          "gd",         "<cmd>Telescope lsp_definitions<CR>",      "Show LSP definitions" },
          { "n",          "gi",         "<cmd>Telescope lsp_implementations<CR>",  "Show LSP implementations" },
          { "n",          "gt",         "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
          { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,                   "See available code actions" },
          { "n",          "<leader>rn", vim.lsp.buf.rename,                        "Smart rename" },
          { "n",          "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>",  "Show buffer diagnostics" },
          { "n",          "<leader>d",  vim.diagnostic.open_float,                 "Show line diagnostics" },
          { "n",          "[d",         vim.diagnostic.goto_prev,                  "Go to previous diagnostic" },
          { "n",          "]d",         vim.diagnostic.goto_next,                  "Go to next diagnostic" },
          { "n",          "K",          vim.lsp.buf.hover,                         "Show documentation under cursor" },
          { "n",          "<leader>rs", ":LspRestart<CR>",                         "Restart LSP" },
        }

        for _, map in ipairs(mappings) do
          local modes, lhs, rhs, desc = unpack(map)
          keymap.set(modes, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end
      end

      -- Capabilities for autocompletion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- List of LSP servers
      local servers = {
        "ts_ls",
        "tsserver",
        "lua_ls",
        "cssls",
        "graphql",
        "html",
        "jsonls",
        "tailwindcss",
        "eslint",
        "angularls",
        "clangd",
        "glint",
        "emmet_ls",
        "somesass_ls",
        "cssmodules_ls",
      }

      -- Modern LSP setup using vim.lsp.config and vim.lsp.enable
      for _, server in ipairs(servers) do
        -- Optionally customize settings per server here
        vim.lsp.config(server, {})

        -- Enable the LSP
        vim.lsp.enable(server, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
}
