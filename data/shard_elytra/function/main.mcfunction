schedule function shard_elytra:main 20t replace

execute as @a if items entity @s armor.chest elytra unless data entity @s active_effects[{ambient:1b}] run function shard_elytra:remove_elytra with entity @s Inventory[{Slot:102b}]
