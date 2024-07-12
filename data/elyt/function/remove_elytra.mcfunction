# remove elytra
item replace entity @s armor.chest with air
$loot give @s loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"$(id)"}],"functions":[{"function":"minecraft:set_count","count":$(count)},{"function":"minecraft:set_components","components":$(components)}]}]}

# equip chestplate (always returns 1 due to 'if items' statement and clear always picks the hotbar and inventory first, so it is impossible to have the chest plate in the armor slot cleared)
execute if items entity @s hotbar.* #chest_armor if function elyt:replace_chest_plate run return run clear @s #chest_armor 1
execute if items entity @s inventory.* #chest_armor if function elyt:replace_chest_plate run return run clear @s #chest_armor 1
