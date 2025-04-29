schedule function shard_elytra:main 1s replace

# Tag players that are under the effect of a beacon.
tag @a remove beacon
execute as @a if data entity @s active_effects[{ambient:1b}] run tag @s add beacon

# Tag players that used a rocket.
tag @a remove usedRocket
tag @a[scores={usedRocket=1..}] add usedRocket

# Tag players that are currently flying.
tag @a remove flying
tag @a[scores={flying=1..}] add flying

# Run remove_elytra function for players in the overworld not under the effect of a beacon that have used a rocket in the last 1s.
execute as @a if items entity @s[tag=!beacon, tag=usedRocket, tag=flying, nbt={Dimension:"minecraft:overworld"}] armor.chest elytra run function shard_elytra:remove_elytra with entity @s Inventory[{Slot:102b}]

# Reset the usedRocket and flying scoreboard for all players.
scoreboard players set @a usedRocket 0
scoreboard players set @a flying 0
