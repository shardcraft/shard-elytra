# Remove elytra.
item replace entity @s armor.chest with air

# Give elytra back.
$loot give @s loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"$(id)"}],"functions":[{"function":"minecraft:set_count","count":$(count)},{"function":"minecraft:set_components","components":$(components)}]}]}

# Give player slow falling effect.
effect give @s slow_falling 10 0 true

# Explain the rules to the player.
tellraw @s {"text":"Warning: You can only use rocket boosting in the overworld if under the effect of a beacon.", "color": "yellow"}