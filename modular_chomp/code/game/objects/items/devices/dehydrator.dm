// Creates cubes!
/obj/item/device/dehydrator
	name = "\improper Dehydrator"
	desc = "A portable device that compresses and packages small creatures into dehydrated cubes. This one seems to be illegally modified to accept more humanoid creatures too."
	icon = 'icons/obj/device_alt.dmi'
	icon_state = "sleevemate" //Give this a fancier sprite later.
	item_state = "healthanalyzer"
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 200)
	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2, TECH_ILLEGAL = 1)

/obj/item/device/dehydrator/New()
	..()
	flags |= NOBLUDGEON //So borgs don't spark.

/obj/item/device/dehydrator/attack(mob/living/M, mob/living/user)
	usr.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(M.stat == DEAD)
		to_chat(user,"<span class='warning'>A warning pops up on the device informing you that dead creatures aren't accepted.</span>")
		return
	if(istype(M,/mob/living/simple_mob/animal/passive))
		if(do_after(usr,2 SECONDS,M))
			var/obj/item/weapon/reagent_containers/food/snacks/mobcube/wrapped/C = new(get_turf(M))
			C.Compress(M)
			to_chat(usr,"<span class='notice'>The device rumbles as it compresses its contents and spits out a wrapped cube!</span>")
		return
	if(istype(M,/mob/living/carbon))
		if(user == M)
			var/choice = tgui_alert(user,"This will turn you into a cube... Are you really sure?","Confirmation",list("Continue","Cancel"))
			if(choice == "Continue" && user.get_active_hand() == src)
				user.visible_message("<span class='warning'>[user] points \the [src] at themselves as it begins to slowly whir and start up!</span>","<span class='notice'>The device starts to buzz as you point it at yourself...</span>")
				if(do_after(usr,20 SECONDS,M))
					var/obj/item/weapon/reagent_containers/food/snacks/mobcube/wrapped/C = new(get_turf(M))
					C.Compress(M)
				return
		var/choice = tgui_alert(user,"This will turn try to turn [M] into a cube. Make sure their prefs align before doing so!","Confirmation",list("Continue","Cancel"))
		if(choice == "Continue" && user.get_active_hand() == src && user.Adjacent(M))
			usr.visible_message("<span class='warning'>[user] points \the [src] at [M] as it begins to slowly whir and start up!</span>","<span class='notice'>You begin to suck [M] into the device!</span>")
			if(do_after(usr,20 SECONDS,M))
				var/obj/item/weapon/reagent_containers/food/snacks/mobcube/wrapped/C = new(get_turf(M))
				C.Compress(M)
				to_chat(usr,"<span class='notice'>The device rumbles as it compresses its contents and spits out a wrapped cube!</span>")
		return