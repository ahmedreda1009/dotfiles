return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.cpptools,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.djlint,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Apply Formatting" })
  end,
}
