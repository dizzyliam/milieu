tool
extends DialogueEvent
class_name DialogueOption, "res://addons/milieu/icons/DialogueOption.svg"

export(String, MULTILINE) var text setget update_text

func run():
	Milieu.add_dialogue_option(self)
	emit_signal("finished")
	
func _selected():
	Milieu.add_dialogue_line("[i]You[/i]\n" + text, "#ca4452")
	
	yield(get_tree().create_timer(_get("delay")), "timeout")
	if get_child_count() > 0:
		for child in get_children():
			child.call_deferred("run_if_able")
			yield(child, "finished")
	
	get_parent().emit_signal("finished")

func update_text(t):
	if text == "":
		text = name
	else:
		text = t
		name = text
