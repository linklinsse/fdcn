extends Node

var _current_scene

func _ready():
	self.switch_scene("res://scenes/pages/adventure/adventure.tscn")

func switch_scene(new_scene: String):
	print("Load scene ", new_scene)

	if self._current_scene:
		self.remove_child(_current_scene)
		_current_scene.call_deferred("free")

	var next_level_resource = load(new_scene)
	self._current_scene = next_level_resource.instance()
	self.add_child(self._current_scene)
