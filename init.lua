
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Diamonds by InfinityProject                                                         +
--                                                                                    +
--LICENSE: WTFPL DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE; applies to all parts.   +
--                                                                                    +
--Please give any ideas on ways to improve this mod!                                  +
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

minetest.register_node( "diamonds:diamond_in_ground", {
	description = "Diamond Ore",
	tile_images = { "default_stone.png^diamond_in_ground.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "diamonds:diamond" 1',
})

minetest.register_node( "diamonds:block", {
	description = "Diamond Block",
	tile_images = { "diamond_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem( "diamonds:diamond", {
	description = "Diamond",
	inventory_image = "diamonds_diamond.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

--
--Tools
--

minetest.register_tool("diamonds:sword", {
	description = "Diamond Sword",
	inventory_image = "diamond_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=500, maxlevel=2},
			snappy={times={[2]=0.70, [3]=0.30}, uses=450, maxlevel=1},
			choppy={times={[3]=0.70}, uses=400, maxlevel=0}
		}
	}
})

minetest.register_tool("diamonds:axe", {
	description = "Diamond Axe",
	inventory_image = "diamond_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.60, [3]=1.00}, uses=500, maxlevel=2},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=600, maxlevel=1}
		}
	},
})

minetest.register_tool("diamonds:shovel", {
	description = "Diamond Shovel",
	inventory_image = "diamond_shovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.70, [3]=0.60}, uses=500, maxlevel=2}
		}
	},
})

minetest.register_tool("diamonds:pick", {
	description = "Diamond Pickaxe",
	inventory_image = "diamond_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=500, maxlevel=3},
			crumbly={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=600, maxlevel=3},
			snappy={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=550, maxlevel=3}
		}
	},
})


--
--Diamonds in steel
--Awesome idea by SegFault22
--

minetest.register_craftitem( "diamonds:ingot", {
	description = "Diamond and Steel Ingot",
	inventory_image = "diamonds_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_node( "diamonds:steelblock", {
	description = "Diamond and Steel Block",
	tile_images = { "diamond_steel_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

--
--Diamond and Steel Tools
--

minetest.register_tool("diamonds:steelsword", {
	description = "Diamond and Steel Sword",
	inventory_image = "diamond_steel_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=700, maxlevel=2},
			snappy={times={[2]=0.70, [3]=0.30}, uses=650, maxlevel=1},
			choppy={times={[3]=0.70}, uses=600, maxlevel=0}
		}
	}
})

minetest.register_tool("diamonds:steelaxe", {
	description = "Diamond and Steel Axe",
	inventory_image = "diamond_steel_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.60, [3]=1.00}, uses=700, maxlevel=2},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=800, maxlevel=1}
		}
	},
})

minetest.register_tool("diamonds:steelshovel", {
	description = "Diamond and Steel Shovel",
	inventory_image = "diamond_steel_shovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.70, [3]=0.60}, uses=700, maxlevel=2}
		}
	},
})

minetest.register_tool("diamonds:steelpick", {
	description = "Diamond and Steel Pickaxe",
	inventory_image = "diamond_steel_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=700, maxlevel=3},
			crumbly={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=800, maxlevel=3},
			snappy={times={[1]=2.0, [2]=1.0, [3]=0.5}, uses=750, maxlevel=3}
		}
	},
})

--
--Diamond Showcase
--
--This is still registered as diamonds:garden. I will change it and probably add an abm to replace
--all old blocks soon.
-- 

minetest.register_node( "diamonds:garden_block", {
	description = "Diamond Showcase",
	tile_images = { "diamond_showcase_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "diamonds:garden", {
	drawtype = "plantlike",
	description = "Diamond Showcase",
	tile_images = { "diamond_showcase.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.0,
	pointable = false,
	groups = {immortal=1,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
})

function add_garden(pos, node, active_object_count, active_object_count_wider)
	if 
	  node.name == "diamonds:garden_block"
	then
	  pos.y = pos.y + 1
	  minetest.env:add_node(pos, {name="diamonds:garden"})
  end
end
minetest.register_on_placenode(add_garden)

function remove_garden(pos, node, active_object_count, active_object_count_wider)
	if 
	  node.name == "diamonds:garden_block"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="diamonds:garden"})
  end
end
minetest.register_on_dignode(remove_garden)






--
--Crafting
--

minetest.register_craft({
	output = 'diamonds:pick',
	recipe = {
		{'diamonds:diamond', 'diamonds:diamond', 'diamonds:diamond'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:axe',
	recipe = {
		{'diamonds:diamond', 'diamonds:diamond', ''},
		{'diamonds:diamond', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:shovel',
	recipe = {
		{'', 'diamonds:diamond', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:sword',
	recipe = {
		{'', 'diamonds:diamond', ''},
		{'', 'diamonds:diamond', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:block',
	recipe = {
		{'diamonds:diamond', 'diamonds:diamond', 'diamonds:diamond'},
		{'diamonds:diamond', 'diamonds:diamond', 'diamonds:diamond'},
		{'diamonds:diamond', 'diamonds:diamond', 'diamonds:diamond'},
	}
})

minetest.register_craft({
	output = 'diamonds:diamond 9',
	recipe = {
		{'', 'diamonds:block', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:ingot 2',
	recipe = {
		{'diamonds:diamond'},
		{'default:steel_ingot'},
		{'diamonds:diamond'},
	}
})

minetest.register_craft({
	output = 'diamonds:steelsword',
	recipe = {
		{'', 'diamonds:ingot', ''},
		{'', 'diamonds:ingot', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:steelpick',
	recipe = {
		{'diamonds:ingot', 'diamonds:ingot', 'diamonds:ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:steelaxe',
	recipe = {
		{'diamonds:ingot', 'diamonds:ingot'},
		{'diamonds:ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'diamonds:steelshovel',
	recipe = {
		{'', 'diamonds:ingot', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:steelblock',
	recipe = {
		{'diamonds:ingot', 'diamonds:ingot', 'diamonds:ingot'},
		{'diamonds:ingot', 'diamonds:ingot', 'diamonds:ingot'},
		{'diamonds:ingot', 'diamonds:ingot', 'diamonds:ingot'},
	}
})

minetest.register_craft({
	output = 'diamonds:garden_block',
	recipe = {
		{'', 'diamonds:diamond', ''},
		{'diamonds:diamond', 'diamonds:block', 'diamonds:diamond'},
		{'', 'diamonds:diamond', ''},
	}
})

minetest.register_craft({
	output = 'diamonds:ingot 9',
	recipe = {
		{'', 'diamonds:steelblock', ''},
	}
})







--
--Generation
--


local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("diamonds:diamond_in_ground", "default:stone", minp, maxp, seed+20,   1/13/13/13,    2, -31000,  -300)
end)

print("Diamonds mod loaded!")