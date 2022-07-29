extends Node
class_name State


var playing


var tags = {}

func set(key, value):
	tags[key] = value

func get(key):
	if key in tags.keys():
		return tags[key]
	else:
		return false


var in_dialogue = false

signal new_dialogue_line(text)
func add_dialogue_line(text, color="#ebe5ce"):
	in_dialogue = true
	emit_signal("new_dialogue_line", text, color)

signal new_dialogue_option(option)
func add_dialogue_option(option):
	in_dialogue = true
	emit_signal("new_dialogue_option", option)
