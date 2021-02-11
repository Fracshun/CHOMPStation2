//TESHARI FACE MASK //Defning all the procs in one go
/obj/item/clothing/mask/synthfacemask
	name = "Synth Face"
	desc = "A round dark muzzle made of LEDs."
	body_parts_covered = FACE|EYES
	icon = 'icons/mob/species/seromi/synth_facemask.dmi'
	icon_override = 'icons/mob/species/seromi/synth_facemask.dmi'
	icon_state = "synth_facemask"
	origin_tech = list(TECH_ILLEGAL = 1)
	var/lstat
	var/mob/living/carbon/maskmaster

	equipped()
		..()
		var/mob/living/carbon/human/H = loc
		if(istype(H) && H.wear_mask == src)
			canremove = 0
			maskmaster = H
			START_PROCESSING(SSprocessing, src)

	dropped()
		canremove = 1
		maskmaster = null
		STOP_PROCESSING(SSprocessing, src)
		return ..()

	Destroy()
		. = ..()
		STOP_PROCESSING(SSprocessing, src)

	mob_can_equip(var/mob/living/carbon/human/user, var/slot)
		if (!..())
			return 0
		if(istype(user))
			var/obj/item/organ/external/E = user.organs_by_name[BP_HEAD]
			if(istype(E) && (E.robotic >= ORGAN_ROBOT))
				return 1
			user << "<span class='warning'>You must have a compatible robotic head to install this upgrade.</span>"
		return 0
	update_icon()
		var/mob/living/carbon/human/H = loc
		if (maskmaster && maskmaster.stat == DEAD) icon_state = "synth_facemask_dead"
		if(istype(H)) H.update_inv_wear_mask()

	process()
		if(maskmaster && lstat != maskmaster.stat)
			lstat = maskmaster.stat
			update_icon()
		lstat = maskmaster.stat


//LOADOUT ITEM
/datum/gear/mask/synthface/
	display_name = "Synth Facemask (Teshari)"
	path = /obj/item/clothing/mask/synthfacemask
	sort_category = "Xenowear"
	whitelisted = SPECIES_TESHARI
	cost = 1

/datum/gear/mask/synthface/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)