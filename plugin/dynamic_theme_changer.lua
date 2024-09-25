if vim.g.loaded_dynamic_theme_changer == 1 then
	return
end
vim.g.loaded_dynamic_theme_changer = 1

vim.api.nvim_create_user_command("DynamicThemeChanger", function(opts)
	require("dynamic_theme_changer").setup(opts.args)
end, { nargs = "*" })
