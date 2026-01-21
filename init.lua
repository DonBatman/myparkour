local 	nbox = {
		type = "fixed",
		fixed = {
			{-0.5, 0.25, -0.3125, 0.5, 0.375, 0.3125},
			{-0.3125, 0.25, -0.5, 0.3125, 0.375, 0.5},
			{-0.4375, 0.25, -0.375, 0.4375, 0.375, 0.375},
			{-0.375, 0.25, -0.4375, 0.375, 0.375, 0.4375},
			{-0.25, 0.375, -0.375, 0.25, 0.4375, 0.375},
			{-0.375, 0.375, -0.25, 0.375, 0.4375, 0.25},
			{-0.3125, 0.375, -0.3125, 0.3125, 0.4375, 0.3125},
			{-0.25, 0.1875, -0.375, 0.25, 0.25, 0.375},
			{-0.375, 0.1875, -0.25, 0.375, 0.25, 0.25},
			{-0.3125, 0.1875, -0.3125, 0.3125, 0.25, 0.3125},
		}
	}
local nbox2 = {
		type = "fixed",
		fixed = {
			{-0.125, -0.1875, -0.125, 0.125, -0.125, 0.125},
			{-0.1875, -0.125, -0.125, 0.1875, 0, 0.125},
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875},
			{-0.375, 0.4375, -0.375, 0.375, 0.5, 0.375},
			{-0.4375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{-0.5, 0.25, -0.5, 0.5, 0.375, 0.5},
			{-0.4375, 0.1875, -0.4375, 0.4375, 0.25, 0.4375},
			{-0.375, 0.125, -0.375, 0.375, 0.1875, 0.375},
			{-0.3125, 0.0625, -0.3125, 0.3125, 0.125, 0.3125},
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
		}
	}

--Red Parkour Block
core.register_node("myparkour:pk_red", {
	description = "Red Parkour Block",
	tiles = {
		"pk_top_red.png",
		"pk_top_red.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 10,
	node_box = nbox
})

--Green Parkour Block
core.register_node("myparkour:pk_green", {
	description = "Green Parkour Block",
	tiles = {
		"pk_top_green.png",
		"pk_top_green.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 10,
	node_box = nbox
})

--Yellow Parkour Block
core.register_node("myparkour:pk_yellow", {
	description = "Yellow Parkour Block",
	tiles = {
		"pk_top_yellow.png",
		"pk_top_yellow.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 10,
	node_box = nbox
})

--Red Drop Parkour Block
core.register_node("myparkour:pk_red_drop", {
	tiles = {
		"pk_top_red_drop.png",
		"pk_top_red_drop.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	walkable = false,
	sunlight_propagates = true,
	light_source = 10,
	node_box = nbox
})

--Green Drop Parkour Block
core.register_node("myparkour:pk_green_drop", {
	description = "Green Drop Parkour Block",
	tiles = {
		"pk_top_green_drop.png",
		"pk_top_green_drop.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png",
		"pk_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 10,
	node_box = nbox
})


core.register_abm({
	nodenames = {"myparkour:pk_green_drop","myparkour:pk_red_drop"},
	interval = 3,
	chance = 2,
	action = function(pos, node)

		if node.name == "myparkour:pk_green_drop" then
			core.set_node(pos, {name="myparkour:pk_red_drop"})
		elseif node.name == "myparkour:pk_red_drop" then
			core.set_node(pos, {name="myparkour:pk_green_drop"})
		end
	end,
})

--Green Block
core.register_node("myparkour:pk_green_block", {
	description = "Green Block",
	tiles = {"pk_green_block.png"},
	groups = {cracky=2},
	drawtype = "normal",
	paramtype = "light",
})

--Red Block
core.register_node("myparkour:pk_red_block", {
	description = "Red Block",
	tiles = {"pk_red_block.png"},
	groups = {cracky=2},
	drawtype = "normal",
	paramtype = "light",
	damage_per_second = 20
})

--Crafts-----------------------------------------------------------------------

--Green Block

core.register_craft({
	output = "myparkour:pk_green 3",
	recipe = {
		{'', 'wool:black', ''},
		{'wool:black', 'wool:green', 'wool:black'},
		{'', 'wool:black', ''}
	}
})

--Red Block

core.register_craft({
	output = "myparkour:pk_red 3",
	recipe = {
		{'', 'wool:black', ''},
		{'wool:black', 'wool:red', 'wool:black'},
		{'', 'wool:black', ''}
	}
})

--Yellow Block

core.register_craft({
	output = "myparkour:pk_yellow 3",
	recipe = {
		{'', 'wool:black', ''},
		{'wool:black', 'wool:yellow', 'wool:black'},
		{'', 'wool:black', ''}
	}
})

--Green Drop Block

core.register_craft({
	output = "myparkour:pk_green_drop 5",
	recipe = {
		{'default:mese_crystal', 'wool:black', 'default:mese_crystal'},
		{'wool:black', 'wool:green', 'wool:black'},
		{'default:mese_crystal', 'wool:black', 'default:mese_crystal'}
	}
})
core.register_node("myparkour:parkour", {
	description = "Parkour Block Green",
	tiles = {
		"myparkour_top.png",
		"myparkour_bottom.png",
		"myparkour_side.png",
		"myparkour_side.png",
		"myparkour_side.png",
		"myparkour_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 2},
	node_box = nbox2
})
core.register_node("myparkour:parkour2", {
	description = "Parkour Block Yellow",
	tiles = {
		"myparkour_top2.png",
		"myparkour_bottom.png",
		"myparkour_side2.png",
		"myparkour_side2.png",
		"myparkour_side2.png",
		"myparkour_side2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 2},
	node_box = nbox2
})
core.register_node("myparkour:parkour3", {
	description = "Parkour Block Red",
	tiles = {
		"myparkour_top3.png",
		"myparkour_bottom.png",
		"myparkour_side3.png",
		"myparkour_side3.png",
		"myparkour_side3.png",
		"myparkour_side3.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 2},
	node_box = nbox2
})
if core.get_modpath("lucky_block") then
	lucky_block:add_blocks({
		{"dro", {"myparkour:pk_red"}, 10},
		{"dro", {"myparkour:pk_green"}, 10},
		{"dro", {"myparkour:pk_yellow"}, 10},
		{"dro", {"myparkour:pk_red_drop"}, 10},
		{"dro", {"myparkour:pk_green_drop"}, 10},
		{"dro", {"myparkour:pk_green_block"}, 10},
		{"dro", {"myparkour:pk_red_block"}, 10},
		{"dro", {"myparkour:parkour"}, 10},
		{"dro", {"myparkour:parkour2"}, 10},
		{"dro", {"myparkour:parkour3"}, 10},
	})
end
