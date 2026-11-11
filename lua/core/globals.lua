---
---Executes a Vim command using `vim.api.nvim_exec2` function.
---
---@param cmd string The Vim command to be executed.
---@param output boolean Whether the command has an output or not.
---@return string|nil result The output of the command if `output` is `true`, otherwise `nil`.
function EXEC(cmd, output)
    local result = vim.api.nvim_exec2(cmd, { output = output })
    if output then
        return result
    end
end

-- Compatibility shims for Neovim 0.12+ Tree-sitter changes:
-- In Neovim 0.12, query matches return table arrays of TSNode for each capture (e.g. { [1] = <TSNode> })
-- Legacy plugins or directives (like nvim-treesitter query_predicates) expect a single TSNode.
local function unwrap_node(node)
    if type(node) == "table" and not getmetatable(node) then
        return node[#node] or node[1]
    end
    return node
end

if vim.treesitter then
    local orig_get_node_text = vim.treesitter.get_node_text
    if orig_get_node_text then
        vim.treesitter.get_node_text = function(node, source, opts)
            node = unwrap_node(node)
            if not node then
                return ""
            end
            return orig_get_node_text(node, source, opts)
        end
    end

    local orig_get_range = vim.treesitter.get_range
    if orig_get_range then
        vim.treesitter.get_range = function(node, source, metadata)
            node = unwrap_node(node)
            if not node then
                return { 0, 0, 0, 0 }
            end
            return orig_get_range(node, source, metadata)
        end
    end

    if vim.treesitter.query then
        local orig_add_directive = vim.treesitter.query.add_directive
        if orig_add_directive then
            vim.treesitter.query.add_directive = function(name, handler, opts)
                local wrapped_handler = function(match, pattern, source, pred, metadata)
                    if type(match) == "table" then
                        local unwrapped_match = setmetatable({}, {
                            __index = function(_, k)
                                return unwrap_node(match[k])
                            end,
                            __pairs = function(_)
                                return pairs(match)
                            end,
                        })
                        return handler(unwrapped_match, pattern, source, pred, metadata)
                    end
                    return handler(match, pattern, source, pred, metadata)
                end
                return orig_add_directive(name, wrapped_handler, opts)
            end
        end

        local orig_add_predicate = vim.treesitter.query.add_predicate
        if orig_add_predicate then
            vim.treesitter.query.add_predicate = function(name, handler, opts)
                local wrapped_handler = function(match, pattern, bufnr, pred)
                    if type(match) == "table" then
                        local unwrapped_match = setmetatable({}, {
                            __index = function(_, k)
                                return unwrap_node(match[k])
                            end,
                            __pairs = function(_)
                                return pairs(match)
                            end,
                        })
                        return handler(unwrapped_match, pattern, bufnr, pred)
                    end
                    return handler(match, pattern, bufnr, pred)
                end
                return orig_add_predicate(name, wrapped_handler, opts)
            end
        end
    end
end

-- Compatibility shim for legacy vim.validate(spec_table) deprecated in Neovim 0.11/0.12+
local orig_validate = vim.validate
if orig_validate then
    vim.validate = function(name, value, validator, optional, message)
        if validator ~= nil or type(name) == "string" then
            return orig_validate(name, value, validator, optional, message)
        elseif type(name) == "table" then
            local keys = vim.tbl_keys(name)
            table.sort(keys)
            for _, k in ipairs(keys) do
                local item = name[k]
                if type(item) == "table" then
                    local val = item[1]
                    local v_validator = item[2]
                    local opt_or_msg = item[3]
                    local is_opt = opt_or_msg == true
                    local msg = type(opt_or_msg) == "string" and opt_or_msg or nil
                    orig_validate(k, val, v_validator, is_opt, msg)
                end
            end
            return
        end
        return orig_validate(name, value, validator, optional, message)
    end
end
