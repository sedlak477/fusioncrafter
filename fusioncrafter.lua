-- fusioncrafter.lua
-- Author: sedlak477
-- This program automates Draconic Evolution Fusion Crafting

local transposer = require("component").transposer
local config = require("config")


-- Load side mappings from config
local input = config.inventories.input
local core = config.inventories.core
local injectors = config.inventories.injectors
local output = config.inventories.output
local result = config.inventories.result

-- Load recipes from config
local recipes = config.recipes


-- Greet user with a friendly message
local function printHello()
  print("FusionCrafter v1.0 by sedlak477")
  print()
end


-- Retrun amount of item in inventory
local function getItemAmount(id, side)
  -- Look through all items to see if the requested exists
  for stack in transposer.getAllStacks(side) do
    if stack.name == id then
      return stack.size
    end
  end
  return 0
end


-- Check if recipe is craftable with
-- current items
local function canCraft(recipe)
  for id, neededAmount in pairs(recipe.input) do
    local availableAmount = getItemAmount(id, input)

    if availableAmount < neededAmount then
      return false
    end
  end
  return true
end


-- Find item slot in inventory
-- Pass nil for item to find empty slot
-- Returns nil if no slot is found
local function find(inventory, item)
  for slot = 1, transposer.getInventorySize(inventory), 1 do
    if item == nil then
      if transposer.getSlotStackSize(inventory, slot) == 0 then
        return slot
      end
    else
      local stack = transposer.getStackInSlot(inventory, slot)
      if stack ~= nil and stack.name == item then
        return slot
      end
    end
  end
end


-- Transfer 'amount' of item 'id' from 'from' to a free slot in 'to'
local function transfer(id, amount, from, to)
  -- Get slots with items
  local slotFrom = find(from, id)
  local slotTo = find(to, nil)
  
  -- Do some error checking
  if slotFrom == nil then
    print("Error: transfer: No item '" .. id .. "' in source inventory")
    return
  end

  if slotTo == nil then
    print("Error: transfer: No free slot in target inventory")
    return
  end

  transposer.transferItem(from, to, amount, slotFrom, slotTo)
end


-- Wait until items are in inventory
local function waitItems(inventory, items)
  while true do
    local itemsExist = true
    for item, amount in pairs(items) do
      local slot = find(inventory, item)
      if slot == nil then
        itemsExist = false
        break
      end
      if transposer.getSlotStackSize(inventory, slot) < amount then
        itemsExist = false
        break
      end
    end
    if itemsExist then
      return
    end
    os.sleep(1)
  end
end


-- Craft provided recipe
local function craft(recipe)

  -- Tell the user what we are doing
  local resultString = ""
  for item, amount in pairs(recipe.output) do
    resultString = resultString .. item .. " "
  end
  io.write("Crafting " .. resultString .. "...")

  -- Put input items into their places
  for item, amount in pairs(recipe.input) do

    -- If item is the core item transfer it to the core inventory
    if item == recipe.core then
      transfer(item, amount, input, core)
    else  -- Else put it into the injectors
      transfer(item, amount, input, injectors)
    end

  end

  -- Wait for output
  waitItems(result, recipe.output)

  -- Transfer items to output inventory
  for item, amount in pairs(recipe.output) do
    transfer(item, amount, result, output)
  end

  print(" Done")
end


-- Check if a valid recipe is in the input
local function checkCrafting()  

  -- Check all recipes if one is craftable
  for i, recipe in pairs(recipes) do

    -- If we can craft it, we craft it
    if canCraft(recipe) then
      craft(recipe)
      return
    end

  end

  os.sleep(2)
end


-- The fun starts here
local function main()
  printHello()

  print("Ready! Waiting for craftable recipes")
  while true do
    checkCrafting()
  end  
end

main()