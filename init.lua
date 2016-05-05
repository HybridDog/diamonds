local t1 = os.clock()


--
--Aliases for the old diamonds mod
--

local diamond_alias_list = {
	{"diamond_in_ground", "stone_with_diamond"},
	{"block", "diamondblock"},
	{"diamond", "diamond"},
	{"pick", "pick_diamond"},
	{"axe", "axe_diamond"},
	{"shovel", "shovel_diamond"},
	{"sword", "sword_diamond"},
}

for _,i in pairs(diamond_alias_list) do
	minetest.register_alias("diamonds:"..i[1], "default:"..i[2])
end


--
--Change default textures
--

local function change_textures(node, imgs, typ)
	local tmp = {}
	if typ == 0 then
		tmp.tiles = imgs
	else
		tmp.inventory_image = imgs[1]
	end
	minetest.override_item(node, tmp)
end

for _,i in pairs({
	{"stone_with_diamond", {"default_stone.png^diamond_in_ground.png"}, 0},
	{"diamondblock", {"diamond_block.png"}, 0},
	{"diamond", {"diamonds_diamond.png"}, 1},
	{"pick_diamond", {"diamond_pick.png"}, 2},
	{"axe_diamond", {"diamond_axe.png"}, 2},
	{"shovel_diamond", {"diamond_shovel.png"}, 2},
	{"sword_diamond", {"diamond_sword.png"}, 2},
}) do
	change_textures("default:"..i[1], i[2], i[3])
end


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
	tiles = { "diamond_steel_block.png" },
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


--
--Stairs and slabs
--

local add_stair_and_slab
if stairs.register_stair_and_slab then
	function add_stair_and_slab(name)
		local nd = "diamonds:"..name
		if not string.find(name, "diamonds") then
			name = "diamonds_"..name
		end
		local data = minetest.registered_nodes[nd]
		stairs.register_stair_and_slab(name, nd,
				data.groups,
				data.tiles,
				data.description.." Stair",
				data.description.." Slab",
				data.sounds
		)
	end
else
	add_stair_and_slab = function()end
end

add_stair_and_slab("steelblock")


--
--Diamond and Steel Tools
--

local tool_multipliers = {
	sword = {
		full_punch_interval = 6/7,
		groupcaps={
			snappy={times={[2]=7/9, [3]=0.5}, uses=65/4},
		}
	}
}

local tool_additions = {
	sword = {
		groupcaps={
			choppy={times={[3]=0.7}, uses=500, maxlevel=0}
		}
	}
}

local function modify_tabs(a,b,func)
	for i in pairs(b) do
		local b = b[i]

		if type(b) == "table" then
			local a = a[i]
			for i in pairs(b) do
				local b = b[i]

				if type(b) == "table" then
					local a = a[i]
					for i in pairs(b) do
						local b = b[i]

						if type(b) == "table" then
							local a = a[i]
							for i in pairs(b) do
								local b = b[i]

								if type(b) == "table" then
									local a = a[i]
									for i in pairs(b) do
										local b = b[i]

										if type(b) == "table" then
											local a = a[i]
											for i in pairs(b) do
												local b = b[i]

												func(a,b,i)
											end
										else
											func(a,b,i)
										end
									end
								else
									func(a,b,i)
								end
							end
						else
							func(a,b,i)
						end
					end
				else
					func(a,b,i)
				end
			end
		else
			func(a,b,i)
		end
	end
end

local function multiply_caps(a,b)
	modify_tabs(a,b,function(a,b,i)
		a[i] = a[i]*b
	end)
end


local function get_capabilities(typ, default)
	local caps = table.copy(minetest.registered_tools[default].tool_capabilities)
	multiply_caps(caps, tool_multipliers[typ])
	--tool_multipliers
end


minetest.register_tool("diamonds:steelsword", {
	description = "Diamond and Steel Sword",
	inventory_image = "diamond_steel_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.9, [2]=0.7, [3]=0.15}, uses=650, maxlevel=1},
			choppy={times={[3]=0.7}, uses=500, maxlevel=0}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("diamonds:steelaxe", {
	description = "Diamond and Steel Axe",
	inventory_image = "diamond_steel_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2, [2]=0.7, [3]=0.4}, uses=700, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
})

minetest.register_tool("diamonds:steelshovel", {
	description = "Diamond and Steel Shovel",
	inventory_image = "diamond_steel_shovel.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=0.9, [2]=0.4, [3]=0.2}, uses=700, maxlevel=3}
		}
	},
})

minetest.register_tool("diamonds:steelpick", {
	description = "Diamond and Steel Pickaxe",
	inventory_image = "diamond_steel_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=1.5, [2]=0.7, [3]=0.3}, uses=700, maxlevel=3},
			crumbly={times={[1]=1, [2]=0.8, [3]=0.5}, uses=800, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})


--
--Diamond Showcase
--
--This is still registered as diamonds:garden. I will change it and probably add an abm to replace
--all old blocks soon?
--

minetest.register_node( "diamonds:garden_block", {
	description = "Diamond Showcase",
	tiles = { "diamond_showcase_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		pos.y = pos.y+1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos, {name="diamonds:garden"})
		end
	end,
	after_destruct = function(pos)
		pos.y = pos.y+1
		if minetest.get_node(pos).name == "diamonds:garden" then
			minetest.remove_node(pos)
		end
	end
})

minetest.register_node("diamonds:garden", {
	drawtype = "plantlike",
	description = "Diamond Showcase",
	tiles = {"diamond_showcase.png^diamonds_diamond.png"},
	paramtype = "light",
	drop = "",
	diggable = false,
	pointable = false,
	groups = {immortal=1,not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"diamonds:garden"},
	interval = 10,
	chance = 1,
	action = function(pos)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(p).name ~= "diamonds:garden_block" then
			minetest.remove_node(pos)
		end
	end
})


--
--Crafting
--

if minetest.global_exists(technic)
and technic.register_alloy_recipe then
	technic.register_alloy_recipe({
		input = {"default:diamond 2", "default:steel_ingot"},
		output = "diamonds:ingot 2",
	})
else
	minetest.register_craft({
		output = "diamonds:ingot 2",
		recipe = {
			{"default:diamond"},
			{"default:steel_ingot"},
			{"default:diamond"},
		}
	})
end

minetest.register_craft({
	output = "diamonds:steelsword",
	recipe = {
		{"", "diamonds:ingot", ""},
		{"", "diamonds:ingot", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "diamonds:steelpick",
	recipe = {
		{"diamonds:ingot", "diamonds:ingot", "diamonds:ingot"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "diamonds:steelaxe",
	recipe = {
		{"diamonds:ingot", "diamonds:ingot"},
		{"diamonds:ingot", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "diamonds:steelshovel",
	recipe = {
		{"", "diamonds:ingot", ""},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "diamonds:steelblock",
	recipe = {
		{"diamonds:ingot", "diamonds:ingot", "diamonds:ingot"},
		{"diamonds:ingot", "diamonds:ingot", "diamonds:ingot"},
		{"diamonds:ingot", "diamonds:ingot", "diamonds:ingot"},
	}
})

minetest.register_craft({
	output = "diamonds:garden_block",
	recipe = {
		{"", "default:diamond", ""},
		{"default:diamond", "default:diamondblock", "default:diamond"},
		{"", "default:diamond", ""},
	}
})

minetest.register_craft({
	output = "default:diamond 13",
	recipe = {
		{"diamonds:garden_block"},
	}
})

minetest.register_craft({
	output = "diamonds:ingot 9",
	recipe = {
		{"", "diamonds:steelblock", ""},
	}
})


--generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, heightmin, heightmax)
--generate_ore("ddiamond_in_ground", "default:stone", minp, maxp, seed+20,   1/13/13/13,    2, -31000,  -300)

minetest.log("info", string.format("[diamonds] loaded after ca. %.2fs", os.clock() - t1))
