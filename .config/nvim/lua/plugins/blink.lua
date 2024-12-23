return {
	"saghen/blink.cmp",
	version = "v0.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		sources = {
			default = { "lsp", "path", "buffer", "markdown" },
			providers = {
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
				},
			},
			cmdline = {
				min_keyword_length = 2,
			},
		},
		keymap = { preset = "enter" },
		signature = { enabled = true },
	},
}
