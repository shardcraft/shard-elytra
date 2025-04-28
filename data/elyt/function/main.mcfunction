schedule function elyt:main 20t replace

execute as @a if items entity @s armor.chest elytra unless data entity @s active_effects[{ambient:1b}] run function elyt:remove_elytra with entity @s Inventory[{Slot:102b}]
