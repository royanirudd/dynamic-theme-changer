if vim.g.loaded_dynamic_theme_changer == 1 then
	return
end
vim.g.loaded_dynamic_theme_changer = 1

vim.api.nvim_create_user_command("DynamicThemeChanger", function(opts)
	local config = {}
	if opts.args ~= "" then
		config = loadstring("return " .. opts.args)()
	end
	require("dynamic_theme_changer").setup(config)
end, { nargs = "?" })
