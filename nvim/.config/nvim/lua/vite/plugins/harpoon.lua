return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        save_on_change = true,
        enter_on_sendcmd = true,
        mark_branch = true,
        save_file = true,
      },
    })
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to Harpoon" })
    vim.keymap.set("n", ",", function()
      -- close mini files before opening harpoon
      require('mini.files').close()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    -- vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
    -- vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
    -- vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
    -- vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
    -- vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
    -- vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end)

    -- close mini files to prevent harpoon file from opening inside mini files
    local closeMiniFiles = function()
      require('mini.files').close()
    end

    vim.keymap.set("n", "<A-1>", function()
      closeMiniFiles()
      harpoon:list():select(1)
    end, { desc = "Go to Harpoon file 1" })
    vim.keymap.set("n", "<A-2>", function()
      closeMiniFiles()
      harpoon:list():select(2)
    end, { desc = "Go to Harpoon file 2" })
    vim.keymap.set("n", "<A-3>", function()
      closeMiniFiles()
      harpoon:list():select(3)
    end, { desc = "Go to Harpoon file 3" })
    vim.keymap.set("n", "<A-4>", function()
      closeMiniFiles()
      harpoon:list():select(4)
    end, { desc = "Go to Harpoon file 4" })
    vim.keymap.set("n", "<A-5>", function()
      closeMiniFiles()
      harpoon:list():select(5)
    end, { desc = "Go to Harpoon file 5" })
    vim.keymap.set("n", "<A-6>", function()
      closeMiniFiles()
      harpoon:list():select(6)
    end, { desc = "Go to Harpoon file 6" })
    vim.keymap.set("n", "<A-7>", function()
      closeMiniFiles()
      harpoon:list():select(7)
    end, { desc = "Go to Harpoon file 7" })
    vim.keymap.set("n", "<A-8>", function()
      closeMiniFiles()
      harpoon:list():select(8)
    end, { desc = "Go to Harpoon file 8" })
    vim.keymap.set("n", "<A-9>", function()
      closeMiniFiles()
      harpoon:list():select(9)
    end, { desc = "Go to Harpoon file 9" })
    vim.keymap.set("n", "<A-0>", function()
      closeMiniFiles()
      harpoon:list():select(10)
    end, { desc = "Go to Harpoon file 10" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
  end,
}
