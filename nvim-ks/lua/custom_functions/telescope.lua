local M = {}

M.create_delete_buf = function(prompt_bufnr, actions, action_state)
	return function()
		local selection = action_state.get_selected_entry()
		actions.close(prompt_bufnr)
		vim.api.nvim_buf_delete(selection.bufnr, { force = true })
	end
end

return M
