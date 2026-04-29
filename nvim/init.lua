-- FIX TEMPORANEO PER NEOVIM 0.12.x (Nightly)
-- Simula il metodo 'range' rimosso per evitare crash dei plugin
local ts = vim.treesitter
if ts.language and not ts.language.node_range then
    -- Questo blocco tenta di mappare le vecchie chiamate alle nuove API
    -- È un tentativo disperato di compatibilità
    local mt = getmetatable(vim.treesitter.query.parse("lua", ""))
    if mt and mt.__index and not mt.__index.range then
        mt.__index.range = function(node)
            local r = { node:range() }
            return r[1], r[2], r[3], r[4]
        end
    end
end
require("sethy.core")
require("sethy.lazy")
require("current-theme")
require("sethy.terminalpop")
