schedule function shard_elytra:main 20t replace

tag @a remove beacon
execute as @a if data entity @s active_effects[{ambient:1b}] run tag @s add beacon

execute as @a if items entity @s[tag=!beacon, nbt={Dimension:"minecraft:overworld"}] armor.chest elytra run function shard_elytra:remove_elytra with entity @s Inventory[{Slot:102b}]
