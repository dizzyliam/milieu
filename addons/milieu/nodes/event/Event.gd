tool
extends Node
class_name Event, "res://addons/milieu/icons/Event.svg"

signal finished

var auto_start
var required_tag

func _get_property_list():
	return [
		{
			name = "Event",
			type = TYPE_NIL,
			usage = PROPERTY_USAGE_CATEGORY
		},
		{
			name = "auto_start",
			type = TYPE_BOOL,
			usage = PROPERTY_USAGE_DEFAULT
		},
		{
			name = "required_tag",
			type = TYPE_NIL,
			usage = PROPERTY_USAGE_GROUP
		},
		{
			name = "tag",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},
		{
			name = "value",
			type = TYPE_BOOL,
			usage = PROPERTY_USAGE_DEFAULT
		}
	]

func _ready():
	if _get("auto_start"):
		run()

func run():
	if not Engine.editor_hint:
		_run()
		for child in get_children():
			child.call_deferred("run_if_able")
			yield(child, "finished")

func run_if_able():
	if _get("tag"):
		var value = Milieu.get(_get("tag"))
		if _get("value") == value:
			run()
		else:
			emit_signal("finished")
	else:
		run()

func _run():
	pass
