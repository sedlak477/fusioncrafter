# FusionCrafter
FusionCrafter is a [OpenComputers](https://www.curseforge.com/minecraft/mc-mods/opencomputers) program for [Draconic Evolution](https://www.curseforge.com/minecraft/mc-mods/draconic-evolution) Fusion Crafting automation!

![Example Setup](images/example.png)

# Quick start

Set up a **Transposer** with five inventories connected to it and set up some pipes as follows:

* One piping items from one chest into the *Crafting Injectors* (Make sure your injectors are in **Single Item Mode**).
* One piping items from another chest into the *Fusion Crafting Core*.
* One piping items from the *Fusion Crafting Core* into another unused chest.

Now download the program and a fitting config version for your modpack:

```shell
wget https://raw.githubusercontent.com/sedlak477/fusioncrafter/master/fusioncrafter.lua
wget https://raw.githubusercontent.com/sedlak477/fusioncrafter/master/<VERSION>-config.lua config.lua
```

Tweak the inventories which interface with the transposer in the config and start `fusioncrafter.lua`.

> You can add `fusioncrafter.lua` to the autostart so you don't have to start it everytime you reboot.

Done, Happy crafting!


# Requirements

## Minimum

* Computer Case (Tier 1)
* Screen (Tier 1)
* CPU (Tier 1)
* 2x Memory (Tier 1.5) (Max 10 recipes)
* Graphics Card (Tier 1)
* Hard Drive (Tier 1)
* EEPROM (Lua BIOS)

## Recommended

* Computer Case (Tier 2)
* Screen (Tier 1)
* CPU (Tier 1)
* 2x Memory (Tier 2.5) (Max 30 recipes)
* Graphics Card (Tier 1)
* Hard Drive (Tier 1)
* EEPROM (Lua BIOS)


# Tutorial

You'll need the following things:

* Computer (any tier)  - This will be the computer managing the crafting
  * CPU or APU (any tier)
  * Graphics Card (any tier, only if you are using a CPU)
  * Memory (at least two tier 1.5)
  * Hard Disk (any tier)
  * EEPROM (Lua BIOS)
* Second computer for setting up the crafting computer with a *internet card* and *keyboard*
* Transposer
* Screen (any tier)
* OpenOS Floppy
* Cables (optional)
* 5 Chests (or any similar inventory)
* Redstone clock (any will do, even vanilla)
* Fusion Crafting setup, obviously

## Building the system

First make sure your *Infusion Crafting* is set up and working correctly. Also make sure you have the upgraded *Crafting Injectors* if you want to craft more advanced recipes.

Before we get started make sure your *Crafting Injectors* are all in **Single Item Mode**. You can change modes by shift right clicking the *Crafting Injectors* with an empty hand.

> If this feature isn't available in your version you need the find a way to place only one item into each *Crafting Injector*. You could try Ender IO *Item Conduits* in round robin mode.

* Place down the **Computer**.
  * Add your components (CPU, Memory, ...).
  * Connect the **Screen**.
  * Supply it with power.
* Place down the **Transposer** keeping in mind that you'll need access to all six of its sides.
* Place a chest (or any inventory) on 5 of its sides.
* Connect the remaining side to the crafting computer.
* Set up the pipes, which chest you choose for the following steps is completly up to you.
  * One piping items from one chest into the *Crafting Injectors*.
  * One piping items from another chest into the *Fusion Crafting Core*.
  * One piping items from the *Fusion Crafting Core* into another unused chest.
* Connect the **Redstone clock** to the *Fusion Crafting Core*.

Once you're done it should look something like this:

![Setup](images/setup.png)

## Setting up the software

We're finished setting up the hardware, now it's time for the software!

First we will set up the **Hard Disk** for the crafting computer.

Insert it into another computer and install *OpenOS* onto it. You can do this by inserting an **OpenOS Floppy** and running:

```shell
install
```

> If you have multiple hard disks it will ask on which it should install. You can see which is which by hovering over the hard disk item, it will display the hard disks ID which you can select in the installation.

If you are done, reboot into the fresh *OpenOS* installation.

Now download the latest version of the program with this command:

```shell
wget https://raw.githubusercontent.com/sedlak477/fusioncrafter/master/fusioncrafter.lua
```

You'll also need a config file which contains all the crafting recipes and configuration. You can download a preset and change it to your liking:

> Replace `<VERSION>` with the version you want. You can see all the versions by browsing the files in the repository.

```shell
wget https://raw.githubusercontent.com/sedlak477/fusioncrafter/master/<VERSION>-config.lua config.lua
```

Depending on which version you downloaded, you only need the change the sides for the **Transposer** and you're done.

Open `config.lua` for editing:

```
edit config.lua
```

Now go to the part where it says `config.inventories = { ... }` and change the numbers according to your setup. Each number represents a direction the inventory is adjacent to the *Transposer*.

> Side numbers:
> * 0: down
> * 1: up
> * 2: north
> * 3: south
> * 4: west
> * 5: east

Save and quit with `Ctrl + S` and `Ctrl + W`.

Now we are nearly done, just add the `fusioncrafter.lua` to the autostart. We do this by editing `.shrc`:

```shell
edit .shrc
```

And add the following line to its end:

```shell
fusioncrafter.lua
```

Done! Pop the **Hard Disk** into the crafting computer and never worry about it again.


# Config versions
Currently there is only one version available but I will try to add more in the future, contributions are welcome as well! :smile:

* **atm3r**: Contains nearly all<sup>1</sup> crafting recipes for [All the Mods 3: Remix](https://www.curseforge.com/minecraft/modpacks/all-the-mods-3-remix) modpack.

<sup>1</sup> It doesn't contain the recipe for *Reactor Stabilizers*, *Chaotic Cores* and the *Energy Queen*.


# Troubleshooting

I'm getting `not enough memory` or `Out of memory` errors, what to do?
* Add more memory to your computer.

I already have the maximum amount of memory in my computer, is this it?
* You can increase the maximum amount of memory a computer can allocate in the *OpenComputers* configs.

The items aren't correctly inserted into the injectors.
* Make sure the **Single Item Mode** is **active**.
* Make sure your pipes don't accidentally connect to other inventories.
* Make sure your pipes push/pull config is correct and they are active.


# TODO

- [ ] Add automated system for upgrading armor and tools.
- [ ] Add support for item metadata. (Fix recipes like *Reactor Stabilizer*)
- [ ] Ore dictionary support.
- [x] Support same item in *Crafting Injectors* and *Fusion Core* for recipes.
- [ ] Add support for alternative input items.
