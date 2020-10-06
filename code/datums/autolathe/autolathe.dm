var/datum/category_collection/crafting/autolathe/autolathe_recipes


/datum/category_item/crafting/New()
	..()
	var/obj/item/I = new path()
	if(LAZYLEN(force_matter))
		resources = force_matter
	else
		if(I.matter && !resources)
			resources = list()
			for(var/material in I.matter)
				resources[material] = I.matter[material]*1.25 // More expensive to produce than they are to recycle.

	if(prefix || suffix)
		name = "[prefix ? "[prefix] " : ""][name][suffix ? " [suffix]" : ""]"

	if(is_stack && istype(I, /obj/item/stack))
		var/obj/item/stack/IS = I
		max_stack = IS.max_amount
	qdel(I)

/****************************
* Category Collection Setup *
****************************/

/datum/category_collection/crafting/autolathe
	category_group_type = /datum/category_group/crafting/autolathe

/*************
* Categories *
*************/

/datum/category_group/crafting/autolathe

/datum/category_group/crafting/autolathe/all
	name = "All"
	category_item_type = /datum/category_item/crafting/autolathe

///datum/category_group/crafting/autolathe/all/New()

/datum/category_group/crafting/autolathe/arms
	name = "Arms and Ammunition"
	category_item_type = /datum/category_item/crafting/autolathe/arms

/datum/category_group/crafting/autolathe/devices
	name = "Devices and Components"
	category_item_type = /datum/category_item/crafting/autolathe/devices

/datum/category_group/crafting/autolathe/engineering
	name = "Engineering"
	category_item_type = /datum/category_item/crafting/autolathe/engineering

/datum/category_group/crafting/autolathe/general
	name = "General"
	category_item_type = /datum/category_item/crafting/autolathe/general

/datum/category_group/crafting/autolathe/medical
	name = "Medical"
	category_item_type = /datum/category_item/crafting/autolathe/medical

/datum/category_group/crafting/autolathe/tools
	name = "Tools"
	category_item_type = /datum/category_item/crafting/autolathe/tools

/*******************
* Category entries *
*******************/

/datum/category_item/crafting
	var/path
	var/list/resources
	var/hidden
	var/power_use = 0
	var/is_stack
	var/max_stack

	var/prefix = ""
	var/suffix = ""

	var/force_matter = list()	// we're forcing how much this is going to be. an override

	var/override_color

/datum/category_item/crafting/dd_SortValue()
	return name