extends Event
class_name SetTag, "res://addons/milieu/icons/SetTag.svg"

export var tag: String
export var value: bool

func run():
	Milieu.set(tag, value)
	emit_signal("finished")
