/decl/hierarchy/outfit/job/science
	hierarchy_type = /decl/hierarchy/outfit/job/science
	l_ear = /obj/item/device/radio/headset/headset_sci
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/device/pda/science
	backpack = /obj/item/weapon/storage/backpack/toxins
	satchel_one = /obj/item/weapon/storage/backpack/satchel/tox
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/tox

/decl/hierarchy/outfit/job/science/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/rd
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/weapon/clipboard
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun = 1,
	/obj/item/weapon/card/department/research = 1)

/decl/hierarchy/outfit/job/science/rd/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/science/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	id_type = /obj/item/weapon/card/id/science/scientist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science

/decl/hierarchy/outfit/job/science/xenoarchaeologist
	name = OUTFIT_JOB_NAME("Xenoarchaeologist")
	uniform = /obj/item/clothing/under/rank/xenoarchaeologist
	id_type = /obj/item/weapon/card/id/science/scientist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science

/decl/hierarchy/outfit/job/science/xenobiologist
	name = OUTFIT_JOB_NAME("Xenobiologist")
	uniform = /obj/item/clothing/under/rank/scientist
	id_type = /obj/item/weapon/card/id/science/xenobiologist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science

/decl/hierarchy/outfit/job/science/roboticist
	name = OUTFIT_JOB_NAME("Roboticist")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	belt = /obj/item/weapon/storage/belt/utility/full
	id_type = /obj/item/weapon/card/id/science/roboticist
	pda_slot = slot_r_store
	pda_type = /obj/item/device/pda/roboticist
	backpack = /obj/item/weapon/storage/backpack
	satchel_one = /obj/item/weapon/storage/backpack/satchel/norm

/decl/hierarchy/outfit/job/science/intern
	name = OUTFIT_JOB_NAME("Science Intern")
	id_type = /obj/item/weapon/card/id/science/intern
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/science/rguard
	name = OUTFIT_JOB_NAME("Research Security")
//	id_type = /obj/item/weapon/card/id/science/rguard
	uniform = /obj/item/clothing/under/pcrc
	suit = /obj/item/clothing/suit/storage/vest/pcrc
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/tier_three = 1)
