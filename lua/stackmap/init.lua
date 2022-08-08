local M = {}

--M.setup = function (opts)
    --print("Options :", opts)
--end

local find_mapping = function (maps, lhs)

    for _, value in ipairs(maps) do

        local key = string.gsub(lhs, "<leader>", " ")

        if key == value.lhs then
            return value
        end
        --print(value.lhs .. "   " .. key .. "   " .. lhs)
        --P(value)
    end
end

M._stack = {}

M.push = function (name, mode, mappings)
    local maps = vim.api.nvim_get_keymap(mode)

    print('prout dE mamMouth')
    --P(maps)
    local existing_maps = {}
    for lhs, rhs in pairs(mappings) do
        local existing = find_mapping(maps, lhs)
        if existing then
            table.insert(existing_maps, existing)
        end

    end
    M._stack[name] = existing_maps

    for lhs, rhs in pairs(mappings) do
        
        vim.keymap.set("n", lhs, rhs)
    end
end


M.pop = function (name)
    
end


M.push("debug_mode", "n", {
    ["<leader>st"] = "echo 'Hello'",
    ["<leader>sz"] = "echo 'Goodbye'",
    ["<leader>ff"] = "echo 'Test déjà pris'",
})


return M


