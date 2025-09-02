vim.g.mapleader = " "

-- open the config file
vim.cmd('nmap <leader>c :e ~/.config/nvim/init-vscode.lua<CR>')

-- save
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- search
vim.keymap.set("n", "<leader>sf", function()
  vim.fn.VSCodeNotify("workbench.action.quickOpen")
end, { noremap = true, silent = true }) 

-- show commands
vim.keymap.set("n", "<leader>sp", function()
  vim.fn.VSCodeNotify("workbench.action.showCommands")
end, { noremap = true, silent = true })

-- VSCode split: right = vertical, down = horizontal
vim.keymap.set("n", "<leader>sv", function()
  vim.fn.VSCodeNotify("workbench.action.splitEditorRight")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>sh", function()
  vim.fn.VSCodeNotify("workbench.action.splitEditorDown")
end, { noremap = true, silent = true })

-- Split navigation
vim.keymap.set("n", "<C-h>", function()
  vim.fn.VSCodeNotify("workbench.action.focusLeftGroup")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", function()
  vim.fn.VSCodeNotify("workbench.action.focusRightGroup")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-k>", function()
  vim.fn.VSCodeNotify("workbench.action.focusAboveGroup")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function()
  vim.fn.VSCodeNotify("workbench.action.focusBelowGroup")
end, { noremap = true, silent = true })

-- tabs navigation
vim.keymap.set("n", "<leader>l", function()
  vim.fn.VSCodeNotify("workbench.action.nextEditor")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", function()
  vim.fn.VSCodeNotify("workbench.action.previousEditor")
end, { noremap = true, silent = true })

-- sync system clipboard
vim.opt.clipboard = "unnamedplus"

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- explorer
vim.keymap.set("n", "<leader>ee", function()
  -- open explorer
  vim.fn.VSCodeNotify("workbench.view.explorer")
  -- reveal current file then give VSCode a moment to update/focus the tree
  vim.defer_fn(function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    -- nudge list focus so the explorer list actually has keyboard focus
    -- we call focusDown once; adjust or repeat if needed
    vim.fn.VSCodeNotify("list.focusDown")
  end, 80)
end, { noremap = true, silent = true })

local notify = function(cmd) vim.fn.VSCodeNotify(cmd) end
-- source control
vim.keymap.set("n", "<leader>es", function() notify("workbench.view.scm") end,
  { noremap = true, silent = true })
  
-- extensions
vim.keymap.set("n", "<leader>ex", function() notify("workbench.view.extensions") end,
  { noremap = true, silent = true })

-- secondary side bar(Postman)
vim.keymap.set("n", "<leader>ep", function()
  pcall(vim.fn.VSCodeNotify, "workbench.action.toggleAuxiliaryBar")
end, { noremap = true, silent = true })

-- go to definition
vim.keymap.set("n", "<leader>sd", function()
  pcall(vim.fn.VSCodeNotify, "editor.action.goToDeclaration")
end, { noremap = true, silent = true })

-- quit (close active editor)
vim.keymap.set("n", "<leader>q", function()
  pcall(vim.fn.VSCodeNotify, "workbench.action.closeActiveEditor")
end, { noremap = true, silent = true })

-- show error
vim.o.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if vim.api.nvim_get_mode().mode ~= "n" then return end
    pcall(vim.fn.VSCodeNotify, "editor.action.showHover")
  end,
})