-- This file contains configuration for the fusioncrafter

local config = {}

-- Specify the inventories here
--
-- Keys:
--   input:     Inventory where items are input into the autocraftin system
--   injectors: Inventory where items for the Fusion Crafting Injectors should be put
--   core:      Inventory where items for the Fusion Crafting Core should be put
--   output:    Inventory where items should be put after crafting is finished
--   result:    Inventory where items go after the fusion crafting finished
--
-- Values:
--   0: down
--   1: up
--   2: north
--   3: south
--   4: west
--   5: east
--
--   Hint: If you have waila just press Shift while 
--     looking at the side and it'll show the value
config.inventories = {
  input = 3,
  result = 2,
  injectors = 5,
  core = 4,
  output = 1
}

-- Specify recipes here
--
-- Foramt:
-- {
--   input = {  -- Items needed to craft; This includes the item put into the core
--     <item id> = <item amount>,
--     <item id> = <item amount>,
--     ...
--   },
--   core = <item id>,  -- Item to be put into the fusion crafting core
--   output = {  -- Items that result from the crafting
--     <item id> = <item amount>,
--     <item id> = <item amount>,
--     ...
--   }
-- }
--
-- Hint: To display item id's press F3+H
config.recipes = {
  {
    output = { ["draconicevolution:wyvern_core"] = 1 },
    input = {
      ["draconicevolution:draconic_core"] = 5,
      ["draconicevolution:draconium_block"] = 2,
      ["minecraft:nether_star"] = 2,
      ["minecraft:emerald_block"] = 1
    },
    core = "minecraft:emerald_block"
  },
  {
    output = { ["draconicevolution:draconic_block"] = 4 },
    input = {
      ["draconicevolution:wyvern_core"] = 6,
      ["draconicevolution:dragon_heart"] = 1,
      ["draconicevolution:draconium_block"] = 4
    },
    core = "draconicevolution:draconium_block"
  },
  {
    output = { ["draconicevolution:awakened_core"] = 1 },
    input = {
      ["draconicevolution:wyvern_core"] = 5,
      ["draconicevolution:draconic_block"] = 4,
      ["minecraft:nether_star"] = 1
    },
    core = "minecraft:nether_star"
  },
  {
    output = { ["draconicevolution:draconic_energy_core"] = 1 },
    input = {
      ["minecraft:redstone_block"] = 5,
      ["draconicevolution:draconic_ingot"] = 4,
      ["draconicevolution:wyvern_energy_core"] = 1,
      ["draconicevolution:awakened_core"] = 1
    },
    core = "draconicevolution:wyvern_energy_core"
  },
  {
    output = { ["draconicevolution:energy_crystal"] = 4 },  -- Draconic energy relay crystal
    input = {
      ["minecraft:diamond"] = 4,
      ["draconicevolution:wyvern_energy_core"] = 4,
      ["draconicevolution:draconic_energy_core"] = 1,
      ["draconicevolution:wyvern_core"] = 1,
      ["draconicevolution:energy_crystal"] = 4
    },
    core = "draconicevolution:energy_crystal"
  },
  {
    output = { ["draconicevolution:particle_generator"] = 1 },  -- Energy core stabilizer
    input = {
      ["minecraft:diamond"] = 4,
      ["draconicevolution:wyvern_core"] = 2,
      ["draconicevolution:particle_generator"] = 1
    },
    core = "draconicevolution:particle_generator"
  },
  {
    output = { ["draconicevolution:infused_obsidian"] = 1 },
    input = {
      ["minecraft:diamond"] = 2,
      ["draconicevolution:draconium_dust"] = 4,
      ["draconicevolution:draconium_ingot"] = 2,
      ["minecraft:blaze_powder"] = 2,
      ["minecraft:obsidian"] = 1
    },
    core = "minecraft:obsidian"
  },
  {
    output = { ["draconicevolution:crafting_injector"] = 1 },  -- Wyvern crafting injector
    input = {
      ["draconicevolution:wyvern_core"] = 1,
      ["minecraft:nether_star"] = 4,
      ["draconicevolution:draconium_block"] = 1,
      ["draconicevolution:draconic_core"] = 2,
      ["draconicevolution:crafting_injector"] = 1
    },
    core = "draconicevolution:crafting_injector"
  },
  {
    output = { ["draconicevolution:crafting_injector"] = 1 },  -- Draconic crafting injector
    input = {
      ["draconicevolution:wyvern_core"] = 2,
      ["minecraft:nether_star"] = 4,
      ["draconicevolution:draconic_block"] = 1,
      ["minecraft:dragon_egg"] = 1,
      ["draconicevolution:crafting_injector"] = 1
    },
    core = "draconicevolution:crafting_injector"
  },
  {
    output = { ["draconicevolution:crafting_injector"] = 1 },  -- Chaotic crafting injector
    input = {
      ["draconicevolution:chaotic_core"] = 2,
      ["minecraft:nether_star"] = 4,
      ["draconicevolution:chaos_shard"] = 1,
      ["minecraft:dragon_egg"] = 1,
      ["draconicevolution:crafting_injector"] = 1
    },
    core = "draconicevolution:crafting_injector"
  },
  {
    output = { ["draconicevolution:reactor_core"] = 1 },
    input = {
      ["draconicevolution:draconic_ingot"] = 2,
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:chaos_shard"] = 1,
      ["draconicevolution:draconium_ingot"] = 3
    },
    core = "draconicevolution:chaos_shard"
  },
  {
    output = { ["draconicevolution:reactor_component"] = 1 },  -- Reactor energy injector
    input = {
      ["draconicevolution:draconic_ingot"] = 4,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:reactor_part"] = 4,
      ["minecraft:iron_ingot"] = 1
    },
    core = "draconicevolution:awakened_core"
  },
  {
    output = { ["draconicevolution:draconium_chest"] = 1 },
    input = {
      ["minecraft:furnace"] = 5,
      ["draconicevolution:draconic_core"] = 2,
      ["draconicevolution:draconium_block"] = 1,
      ["minecraft:chest"] = 1,
      ["minecraft:crafting_table"] = 2
    },
    core = "minecraft:chest"
  },
  {
    output = { ["draconicevolution:ender_energy_manipulator"] = 1 },
    input = {
      ["minecraft:skull"] = 1,
      ["draconicevolution:draconic_core"] = 4,
      ["draconicevolution:wyvern_core"] = 3,
      ["minecraft:ender_eye"] = 3
    },
    core = "minecraft:skull"
  },
  {
    output = { ["draconicevolution:draconic_pick"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:wyvern_pick"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "draconicevolution:wyvern_pick"
  },
  {
    output = { ["draconicevolution:draconic_shovel"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:wyvern_shovel"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "draconicevolution:wyvern_shovel"
  },
  {
    output = { ["draconicevolution:draconic_axe"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:wyvern_axe"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "draconicevolution:wyvern_axe"
  },
  {
    output = { ["draconicevolution:draconic_bow"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:wyvern_bow"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "draconicevolution:wyvern_bow"
  },
  {
    output = { ["draconicevolution:draconic_sword"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:wyvern_sword"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "draconicevolution:wyvern_sword"
  },
  {
    output = { ["draconicevolution:draconic_hoe"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 2,
      ["draconicevolution:awakened_core"] = 1,
      ["minecraft:diamond_hoe"] = 1,
      ["draconicevolution:draconic_energy_Core"] = 1
    },
    core = "minecraft:diamond_hoe"
  },
  {
    output = { ["draconicevolution:draconic_staff_of_power"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 5,
      ["draconicevolution:awakened_core"] = 1,
      ["draconicevolution:draconic_pick"] = 1,
      ["draconicevolution:draconic_shovel"] = 1,
      ["draconicevolution:draconic_sword"] = 1
    },
    core = "draconicevolution:draconic_pick"
  },
  {
    output = { ["draconicevolution:dislocator_advanced"] = 1 },
    input = {
      ["minecraft:ender_pearl"] = 3,
      ["minecraft:dragon_egg"] = 1,
      ["draconicevolution:draconium_ingot"] = 4,
      ["draconicevolution:dislocator"] = 1
    },
    core = "draconicevolution:dislocator"
  },
  {
    output = { ["draconicevolution:draconic_helm"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:draconic_pick"] = 1,
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:wyvern_helm"] = 1
    },
    core = "draconicevolution:wyvern_helm"
  },
  {
    output = { ["draconicevolution:draconic_legs"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:draconic_pick"] = 1,
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:wyvern_legs"] = 1
    },
    core = "draconicevolution:wyvern_legs"
  },
  {
    output = { ["draconicevolution:draconic_boots"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:draconic_pick"] = 1,
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:wyvern_boots"] = 1
    },
    core = "draconicevolution:wyvern_boots"
  },
  {
    output = { ["draconicevolution:draconic_chest"] = 1 },
    input = {
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:draconic_pick"] = 1,
      ["draconicevolution:draconic_block"] = 1,
      ["draconicevolution:wyvern_chest"] = 1,
      ["extrautils2:angelring"] = 1
    },
    core = "draconicevolution:wyvern_chest"
  },
  {
    output = { ["atmtweaks:item_material"] = 1 },  -- Growth essence
    input = {
      ["forestry:royal_jelly"] = 1,
      ["actuallyadditions:item_fertilizer"] = 1,
      ["thermalfoundation:fertilizer"] = 1,
      ["minecraft:dye"] = 1,
      ["botania:manaresource"] = 1
    },
    core = "forestry:royal_jelly"
  }
}

return config