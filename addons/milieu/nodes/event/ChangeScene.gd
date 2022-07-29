extends Event
class_name ChangeScene, "res://addons/milieu/icons/ChangeScene.svg"

export var scene: String

func run():
	get_tree().change_scene(scene)
	emit_signal("finished")
