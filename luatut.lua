--single comments

--[[
multi line comments
multi line comments
multi line comments
multi line comments
multi line comments
--]]

print("hello world")
local name = "Diego"
io.write("my name is ", name, #name, "\n")
print("my name is ", #name)
print(type(name))

local longString = [[ 
  all work and no play make jake a dull dull boy
  all work and no play make jake a dull dull boy
  all work and no play make jake a dull dull boy
  all work and no play make jake a dull dull boy
  all work and no play make jake a dull dull boy
]]

print(longString)

-- concat strings
concatString = longString .. name
print(concatString)

-- if statements

age = 13
if age < 16 then
  print("too young")
elseif (age == 16) and (age < 18) then
  print("a little older")
else
  print("you okay")
end

-- while
i = 1
while (i < 10) do
  print(i)
  i = i + 1
  if i == 8 then break end
end

--repeat
repeat
  io.write("guess number: ")
  num = io.read()
until tonumber(num) == 8

--for
for i = 1, 10, 1 do
  print(i)
end

months = { "jan", "feb", "mar", "april", "june" }
for k, v in pairs(months) do
  io.write(k, v, "\n")
end


--tables:
--take the place of arrays, dics, tuples

aTable = {}
for i = 1, 10 do
  aTable[i] = i
end

print(aTable[1])
print(table.concat(aTable, ", "))
print("show size of table: ", #aTable)

arr = { 1, 3, 5, 8, 13 }
for i = 1, #arr do
  print("#arr: ", i)
end


t = { key1 = "keyyyy", key2 = false }

print("table keys: ", t.key1,t.key2)

local crazy = {['@!#'] = 'qbert', [{}] = 1729, [6.28] = 'tau'}
print("crazy['@!#'] ", crazy['@!#'])

--_G is a special table for all globals
_G.foobar = "this is a global"

-- functions
local function getSum(num1, num2)
  return num1 + num2
end

print(getSum(1, 2))

local function getTuple()
  return "terset", 777
end

str, int = getTuple()
print(str, int)

function sumMore(...)
  local sum = 0
  io.write("sumMore:  ")
  print(...)
  for _, v in pairs({ ... }) do
    sum = sum + v
  end
  for i = 1, #{ ... } do
    print("#{...} ", i)
  end
  return sum
end

print(sumMore(1, 2, 3, 4, 5))

doubleIt = function(x)
  return x * 2
end

print(doubleIt(2))

-- coroutine
-- similar to a thread
co = coroutine.create(function()
  for i = 1, 10 do
    print(i)
    print(coroutine.status(co))
    if i == 5 then
      coroutine.yield()
    end
  end
end)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))


co2 = coroutine.create(function()
  for i = 100, 110 do
    print(i)
    print(coroutine.status(co2))
  end
end)

coroutine.resume(co2)
coroutine.resume(co)

-- modules
convert = require('convert')
print(convert.testMe())

-- oop
-- lua is not a oop language but you can fake it with tables and metatables

Animal = { height = 0, weight = 0, name = "non name", sound = "no sound" }

function Animal:new(height, weight, name, sound)
  setmetatable({}, Animal)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound

  return self
end

function Animal:toString()
  return string.format("%s,%f,%f", self.name, self.height, self.weight)
end

oynx = Animal:new(23, 44, "oynx", "bark")
print(oynx.name)
print(oynx.sound)

Cat = Animal:new()

function Cat:new(height, weight, name, sound)
  setmetatable({}, Cat)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound

  return self
end

puss = Cat:new(2, 3, "puss", "meaww")
print(puss.sound)


-- metatables 
-- how you want to override methods for tables
