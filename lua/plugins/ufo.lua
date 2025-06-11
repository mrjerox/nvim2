return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  config = function()
    local ufo = require('ufo')
    vim.o.foldcolumn = '0' -- '0' is not bad
    -- vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    -- vim.o.foldlevelstart = 99
    -- vim.o.foldenable = true

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    ufo.setup()

    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    vim.keymap.set('n', 'K', function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        -- choose one of coc.nvim and nvim lsp
        -- vim.fn.CocActionAsync('definitionHover')   -- coc.nvim
        vim.lsp.buf.hover()
      end
    end)
  end
}
