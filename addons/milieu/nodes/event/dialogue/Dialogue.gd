tool
extends Event
class_name DialogueEvent, "res://addons/milieu/icons/Dialogue.svg"

func _get_property_list():
	return [
		{
			name = "DialogueEvent",
			type = TYPE_NIL,
			usage = PROPERTY_USAGE_CATEGORY
		},
		{
			name = "character",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},
		{
			name = "delay",
			type = TYPE_REAL,
			usage = PROPERTY_USAGE_DEFAULT
		},
	]

func get_character():
	if _get("character") == "":
		if get_parent().has_method("get_character"):
			return get_parent().get_character()
		else:
			return ""
	else:
		return _get("character")
