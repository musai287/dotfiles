-- =========================================================================
-- FIX: MONKEY PATCH PER NEOVIM 0.12.1 E TREESITTER (Errore 'range' nil value)
-- Intercetta le tabelle di nodi e le scarta, passando solo il primo nodo.
-- =========================================================================
local ts = vim.treesitter

-- Salviamo le funzioni originali di Neovim
local orig_get_node_text = ts.get_node_text
local orig_get_range = ts.get_range

-- Sovrascriviamo get_node_text
ts.get_node_text = function(node, source, opts)
    -- Se 'node' è una tabella senza il metodo range, estraiamo il primo elemento
    if type(node) == "table" and type(node.range) ~= "function" and node[1] then
        node = node[1]
    end
    return orig_get_node_text(node, source, opts)
end

-- Sovrascriviamo get_range (che è quella che causa l'errore in languagetree.lua)
if orig_get_range then
    ts.get_range = function(node, source, metadata)
        if type(node) == "table" and type(node.range) ~= "function" and node[1] then
            node = node[1]
        end
        return orig_get_range(node, source, metadata)
    end
end
-- =========================================================================

require("sethy.core")
require("sethy.lazy")
require("current-theme")
require("sethy.terminalpop")
