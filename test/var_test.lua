package.path = "../src/?.lua;"..package.path

require("apinut.var")


assert(type(nil) == "nil")
assert(type(apinut.var.null) == "nil")

local t = apinut.var.null
assert(apinut.var.null == t)


assert(apinut.var.null ~= "null")
assert(apinut.var.null ~= nil)
assert(apinut.var.null ~= {})

local t = {"a", apinut.var.null, "c", apinut.var.null}
local a,b,c,d = unpack(t)
assert(a=="a")
assert(b==nil)
assert(c=="c")
assert(d==nil)
