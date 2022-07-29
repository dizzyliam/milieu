extends Event
class_name WaitForTag, "res://addons/milieu/icons/WaitForTag.svg"

export var tag: String

var waiting = false

func run():
	waiting = true

func _process(delta):
	if waiting:
		var value = Milieu.get(tag)
		if value:
			waiting = false
			emit_signal("finished")
