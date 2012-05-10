
local base      = _G
local old_type  = type
local old_unpack = unpack 

module("apinut.var", package.seeall)

local mt = {
    __tostring = function(self)
        return "null"
    end
}

null = {}
setmetatable(null, mt)

local function new_type(...)
    local v = ...
    if v == null then
        return "nil"
    end
    return old_type(...)
end

local function new_unpack(t, i, j)
    i = i or 1
    j = j or table.maxn(t)
    if i<=j then
        local v = t[i]
        if t[i] == apinut.var.null then v = nil end
        return v, new_unpack(t, i+1, j)
    end
end

base.type = new_type
base.unpack = new_unpack


