/**
 * # Server
 *
 * Immobile (but not dense) shells that can interact with
 * world.
 */
/obj/structure/server
	name = "server"
	icon = 'icons/obj/wiremod.dmi'
	icon_state = "setup_stationary"

	density = TRUE
	light_system = MOVABLE_LIGHT
	light_range = 0

/obj/structure/server/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/shell, null, SHELL_CAPACITY_VERY_LARGE, SHELL_FLAG_REQUIRE_ANCHOR|SHELL_FLAG_USB_PORT)

/obj/structure/server/wrench_act(mob/living/user, obj/item/tool)
	anchored = !anchored
	tool.play_tool_sound(src)
	balloon_alert(user, "You [anchored ? "secure" : "unsecure"] [src].")
	return TRUE
