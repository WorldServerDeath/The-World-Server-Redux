/turf/simulated/floor
	name = "plating"
	desc = "Unfinished flooring."
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

	// Damage to flooring.
	var/broken
	var/burnt

	// Plating data.
	var/base_name = "plating"
	var/base_desc = "The naked hull."
	var/base_icon = 'icons/turf/flooring/plating.dmi'
	var/base_icon_state = "plating"
	var/static/list/base_footstep_sounds = list("human" = list(
		'sound/effects/footstep/plating1.ogg',
		'sound/effects/footstep/plating2.ogg',
		'sound/effects/footstep/plating3.ogg',
		'sound/effects/footstep/plating4.ogg',
		'sound/effects/footstep/plating5.ogg'))

	// Flooring data.
	var/flooring_override
	var/initial_flooring
	var/decl/flooring/flooring
	var/mineral = DEFAULT_WALL_MATERIAL

	var/material/material

	thermal_conductivity = 0.040
	heat_capacity = 10000
	var/lava = 0

	unique_save_vars = list("broken", "burnt")

/turf/simulated/floor/get_persistent_metadata()
	if(flooring)
		return flooring.type
	else
		return "no floor"

/turf/simulated/floor/load_persistent_metadata(floortype)
	if(floortype)
		if(floortype != "no floor")
			set_flooring(get_flooring_data(floortype))
		else
			make_plating()

/turf/simulated/floor/is_plating()
	return !flooring

/turf/simulated/floor/New(var/newloc, var/floortype)
	..(newloc)
	if(!floortype && initial_flooring)
		floortype = initial_flooring
	if(floortype)
		set_flooring(get_flooring_data(floortype))
	else
		footstep_sounds = base_footstep_sounds

/turf/simulated/floor/proc/set_flooring(var/decl/flooring/newflooring)
	make_plating(defer_icon_update = 1)
	flooring = newflooring
	footstep_sounds = newflooring.footstep_sounds
	update_icon(1)
	levelupdate()

//This proc will set floor_type to null and the update_icon() proc will then change the icon_state of the turf
//This proc auto corrects the grass tiles' siding.
/turf/simulated/floor/proc/make_plating(var/place_product, var/defer_icon_update)

	cut_overlays()

	for(var/obj/effect/decal/writing/W in src)
		qdel(W)

	if(islist(decals))
		decals.Cut()
		decals = list()

	name = base_name
	desc = base_desc
	icon = base_icon
	icon_state = base_icon_state
	footstep_sounds = base_footstep_sounds
	color = null

	if(flooring)
		if(flooring.build_type && place_product)
			new flooring.build_type(src)
		flooring = null

	set_light(0)
	broken = null
	burnt = null
	flooring_override = null
	levelupdate()

	if(!defer_icon_update)
		update_icon(1)

/turf/simulated/floor/levelupdate()
	for(var/obj/O in src)
		O.hide(O.hides_under_flooring() && src.flooring)

/turf/simulated/floor/can_engrave()
	return (!flooring || flooring.can_engrave)

/turf/simulated/floor/is_floor()
	return TRUE