extends Event
class_name Sleep, "res://addons/milieu/icons/Sleep.svg"

export var time = 0.0

func run():
	yield(get_tree().create_timer(time), "timeout")
	emit_signal("finished")
