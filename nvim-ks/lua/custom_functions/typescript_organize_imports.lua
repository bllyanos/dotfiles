local M = {}

-- setup organize_imports for tsserver
M.organize_imports = function()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "Organize Typescript Imports",
	}
	vim.lsp.buf.execute_command(params)
end

return M
