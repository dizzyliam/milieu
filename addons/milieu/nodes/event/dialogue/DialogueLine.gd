tool
extends DialogueEvent
class_name DialogueLine, "res://addons/milieu/icons/DialogueLine.svg"

export(String, MULTILINE) var text

func run():
	
	var c = get_character()
	if c == "":
		Milieu.add_dialogue_line(text)
	else:
		Milieu.add_dialogue_line("[i]" + c + "[/i]\n" + text)
	
	yield(get_tree().create_timer(_get("delay")), "timeout")
	if get_child_count() > 0:
		for child in get_children():
			child.call_deferred("run_if_able")
			yield(child, "finished")
	
	else:
		emit_signal("finished")

func update_text(t):
	if text == "":
		text = name
	else:
		text = t
		name = text
