-- Every mapping goes through this wrapper: silent by default, and `desc` is what
-- which-key displays, so it is required rather than optional.
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Deferred so that merely defining a keymap does not load telescope at startup.
local function pick(picker, args)
  return function()
    require("telescope.builtin")[picker](args)
  end
end

map('i', 'jk', '<Esc>', 'Escape insert mode')

-- [[ barbar ]] --
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', 'Previous buffer')
map('n', '<A-.>', '<Cmd>BufferNext<CR>', 'Next buffer')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', 'Move buffer left')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', 'Move buffer right')
-- Goto buffer in position...
for i = 1, 9 do
  map('n', ('<A-%d>'):format(i), ('<Cmd>BufferGoto %d<CR>'):format(i), ('Go to buffer %d'):format(i))
end
map('n', '<A-0>', '<Cmd>BufferLast<CR>', 'Go to last buffer')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', 'Pin buffer')
map('n', '<C-p>', '<Cmd>BufferPick<CR>', 'Pick buffer')
-- Close buffer
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', 'Close buffer')
map('n', '<leader>bC', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', 'Close others')
map('n', '<leader>br', '<Cmd>BufferRestore<CR>', 'Restore buffer')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', 'Order by number')
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', 'Order by directory')
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', 'Order by language')
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', 'Order by window')

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- [[ neo-tree ]]--
map('n', '<leader>e', '<Cmd>Neotree toggle<CR>', 'Toggle file tree')

-- [[ telescope ]]--
map('n', '<leader>ff', pick('find_files'), 'Open Files')
map('n', '<leader>fo', pick('git_files'), 'Open Tracked Files')
map('n', '<leader>fa', pick('live_grep'), 'Find All')
map('n', '<leader>fh', pick('oldfiles'), 'Open Recent Files')
map('n', '<leader>fd', pick('diagnostics', { bufnr = 0 }), 'Open Diagnostic on File')

-- [[ terminal ]]--
map('t', '<Esc>', [[<C-\><C-n>]], 'Exit terminal mode')
map('t', 'jk', [[<C-\><C-n>]], 'Exit terminal mode')
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], 'Window left')
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], 'Window down')
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], 'Window up')
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], 'Window right')
map('t', '<C-w>', [[<C-\><C-n><C-w>]], 'Window command')

-- [[ windows ]]--
map('n', '<A-Up>', '<C-w>k', 'Window up')
map('n', '<A-Down>', '<C-w>j', 'Window down')
map('n', '<A-Left>', '<C-w>h', 'Window left')
map('n', '<A-Right>', '<C-w>l', 'Window right')
