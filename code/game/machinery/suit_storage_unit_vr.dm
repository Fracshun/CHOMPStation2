<<<<<<< HEAD
/obj/machinery/suit_cycler
	departments = list("Engineering","Mining","Medical","Security","Atmos","HAZMAT","Construction","Biohazard","Emergency Medical Response","Crowd Control","Exploration","Pilot Blue","Pilot","Manager","Prototype")
	species = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_VULPKANIN, /*yawngreyedit*/SPECIES_GREY_YW)

||||||| parent of 43822f5c50... Merge pull request #11080 from VOREStation/Arokha/bayport
/obj/machinery/suit_cycler
	departments = list("Engineering","Mining","Medical","Security","Atmos","HAZMAT","Construction","Biohazard","Emergency Medical Response","Crowd Control","Exploration","Pilot Blue","Pilot","Manager","Prototype","No Change")
	species = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_VULPKANIN)

=======
>>>>>>> 43822f5c50... Merge pull request #11080 from VOREStation/Arokha/bayport
// Old Exploration is too WIP to use right now
/obj/machinery/suit_cycler/exploration
	req_access = null
	req_one_access = list(access_explorer,access_medical_equip)

/obj/machinery/suit_cycler/pilot
	req_access = list(access_pilot)

/obj/machinery/suit_cycler/captain
	name = "Manager suit cycler"
	model_text = "Manager"
	req_access = list(access_captain)
	departments = list(/datum/suit_cycler_choice/department/captain)

/obj/machinery/suit_cycler/prototype
	name = "Prototype suit cycler"
	model_text = "Prototype"
	req_access = list(access_hos)
	departments = list(/datum/suit_cycler_choice/department/prototype)

/obj/machinery/suit_cycler/vintage/tcrew
	name = "Talon crew suit cycler"
	model_text = "Talon crew"
	req_access = list(access_talon)
	departments = list(/datum/suit_cycler_choice/department/talon/crew)

/obj/machinery/suit_cycler/vintage/tpilot
	name = "Talon pilot suit cycler"
	model_text = "Talon pilot"
	req_access = list(access_talon)
	departments = list(/datum/suit_cycler_choice/department/talon/pilot)

/obj/machinery/suit_cycler/vintage/tengi
	name = "Talon engineer suit cycler"
	model_text = "Talon engineer"
	req_access = list(access_talon)
	departments = list(/datum/suit_cycler_choice/department/talon/eng)

/obj/machinery/suit_cycler/vintage/tguard
	name = "Talon guard suit cycler"
	model_text = "Talon guard"
	req_access = list(access_talon)
	departments = list(/datum/suit_cycler_choice/department/talon/marine)

/obj/machinery/suit_cycler/vintage/tmedic
	name = "Talon doctor suit cycler"
	model_text = "Talon doctor"
	req_access = list(access_talon)
	departments = list(/datum/suit_cycler_choice/department/talon/med)

/obj/machinery/suit_cycler/vintage/tcaptain
	name = "Talon captain suit cycler"
	model_text = "Talon captain"
	req_access = list(access_talon)
<<<<<<< HEAD
	departments = list("Talon Officer","No Change")
||||||| parent of 43822f5c50... Merge pull request #11080 from VOREStation/Arokha/bayport
	departments = list("Talon Officer","No Change")
=======
	departments = list(/datum/suit_cycler_choice/department/talon/officer)
>>>>>>> 43822f5c50... Merge pull request #11080 from VOREStation/Arokha/bayport
