-- Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
-- Plug 'ThePrimeagen/harpoon'
return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup()
	end,
}
