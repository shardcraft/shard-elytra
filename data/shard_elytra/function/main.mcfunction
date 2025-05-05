# Tag players that are under the effect of a beacon.
tag @a remove beacon
execute as @a if data entity @s active_effects[{ambient:1b}] run tag @s add beacon

# Tag players that are going to be warned about elytra boosting outside beacon range.
execute as @a if items entity @s[tag=!beacon, scores={flying=1.., usedRocket=1..}, nbt={Dimension:"minecraft:overworld"}, gamemode=!creative] armor.chest elytra run scoreboard players add @s elytraWarning 1
execute at @a[scores={elytraWarning=1..}] run particle minecraft:campfire_cosy_smoke ^ ^ ^1 .2 .2 .2 .0 8
execute at @a[scores={elytraWarning=200..}] run particle minecraft:lava ^ ^ ^1 .2 .2 .2 .0 8

# Add warning text.
title @a[scores={elytraWarning=1}] subtitle {"text":"WARNING: Elytra malfunction. Land as soon as posible.","color":"red","bold":true}
title @a[scores={elytraWarning=1}] title ""
tellraw @a[scores={elytraWarning=1}] {"text":"Warning: You can only use rockets to boost your elytra in the overworld if under the effect of a beacon.", "color": "yellow"}

# Add some ambient noises.
execute at @a[scores={elytraWarning=1..}] run playsound minecraft:block.anvil.step ambient @a ~ ~ ~ 0.5 2
execute at @a[scores={elytraWarning=1}] run playsound minecraft:block.furnace.fire_crackle ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=100}] run playsound minecraft:block.furnace.fire_crackle ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=150}] run playsound minecraft:block.furnace.fire_crackle ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=200..}] run playsound minecraft:entity.bee.loop ambient @a ~ ~ ~ 1 0
execute at @a[scores={elytraWarning=300}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=320}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=340}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=360}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=380}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=400}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=420}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=440}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=460}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=480}] run playsound minecraft:block.fire.ambient ambient @a ~ ~ ~

# Damage and eventually remove the elytra.
execute at @a[scores={elytraWarning=1}] run playsound minecraft:item.totem.use ambient @a ~ ~ ~
execute as @a[scores={elytraWarning=1}] run damage @s 1
execute at @a[scores={elytraWarning=200}] run playsound minecraft:item.mace.smash_ground_heavy ambient @a ~ ~ ~
execute at @a[scores={elytraWarning=200}] run playsound minecraft:item.firecharge.use ambient @a ~ ~ ~
execute as @a[scores={elytraWarning=200}] run damage @s 1
execute at @a[scores={elytraWarning=300}] run playsound minecraft:item.mace.smash_ground ambient @a ~ ~ ~ 2 0
execute as @a[scores={elytraWarning=300}] run damage @s 1
execute at @a[scores={elytraWarning=400}] run playsound minecraft:item.mace.smash_ground ambient @a ~ ~ ~ 2 1
execute at @a[scores={elytraWarning=410}] run playsound minecraft:item.mace.smash_ground ambient @a ~ ~ ~ 2 1.5
execute as @a[scores={elytraWarning=400}] run damage @s 1
execute at @a[scores={elytraWarning=427}] run playsound minecraft:item.mace.smash_ground ambient @a ~ ~ ~ 2 0.5
execute as @a[scores={elytraWarning=427}] run damage @s 1
execute at @a[scores={elytraWarning=439}] run playsound minecraft:item.mace.smash_ground ambient @a ~ ~ ~
execute as @a[scores={elytraWarning=439}] run damage @s 1
execute at @a[scores={elytraWarning=478}] run playsound minecraft:entity.firework_rocket.large_blast ambient @a ~ ~ ~ 2 1
execute as @a[scores={elytraWarning=478}] run damage @s 1
execute at @a[scores={elytraWarning=500}] run summon minecraft:tnt ~ ~ ~ {Fuse:0,ExplosionPower:128}
execute at @a[scores={elytraWarning=520..}] run summon minecraft:tnt ~ ~ ~ {Fuse:0,ExplosionPower:128}
kill @a[scores={elytraWarning=540..}]

# Reset scoreboards if player lands.
scoreboard players set @a[scores={flying=0}] elytraWarning 0

# Reset the usedRocket and flying scoreboard for all players.
scoreboard players set @a usedRocket 0
scoreboard players set @a flying 0

# Count for how long the player has been warned for.
scoreboard players add @a[scores={elytraWarning=1..}] elytraWarning 1
