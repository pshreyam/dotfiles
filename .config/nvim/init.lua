local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

require('user.plugins')
require('user.plugins.lualine-config')
require('user.plugins.nvim-tree-config')
require('user.plugins.lsp-config')
require('user.plugins.indent-blankline-config')
require('user.plugins.treesitter-config')

require('user.settings')

require('user.mappings')
