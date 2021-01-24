#!/usr/local/bin/env lua
local a = {}
for i = 1, 1e7 do
  a[#a +1] = i
end
print(#a)
