return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "[u]ndo tree" },
	},
	config = function()
		vim.g.undotree_DiffAutoOpen = 0
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
