
local base      = _G
local old_type  = type

module("apinut.var", package.seeall)

local mt = {
    __tostring = function(self)
        return "null"
    end
}

null = {}
setmetatable(null, mt)

local new_type = function(...)
    local v = ...
    if v == null then
        return "nil"
    end
    return old_type(...)
end


base.type = new_type


