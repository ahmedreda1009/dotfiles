return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 500,
		stages = "slide",
		-- background_colour = "#000000",
		render = "compact",
	},

	-- vim.keymap.set("n", "<leader>ms", "<cmd>Telescope notify<CR><esc>", { desc = "Show notifications history" })

	vim.keymap.set("n", "<leader>ms", function()
		require("mini.files").close()
		require("telescope").extensions.notify.notify()

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	end, { desc = "Show notifications history" }),
}
