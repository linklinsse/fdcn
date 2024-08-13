extends Node

var _current_scene
var _racine

func _ready():
	self._racine = get_tree().get_root().get_node("main")
	if not self._racine:
		self._racine = self
	self.switch_scene("res://scenes/pages/adventure/adventure.tscn")

func switch_scene(new_scene: String):
	print("Load scene ", new_scene)

	if self._current_scene:
		self._racine.remove_child(_current_scene)
		_current_scene.call_deferred("free")

	var next_level_resource = load(new_scene)
	self._current_scene = next_level_resource.instance()
	self._racine.add_child(self._current_scene)
