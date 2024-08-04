extends Node

var _current_scene
var _current_page: int = 0
var _pages_rotation = [
	"res://scenes/pages/about/about.tscn",
	"res://scenes/pages/adventure/adventure.tscn",
	"res://scenes/pages/chapiters/chapiters.tscn",
	"res://scenes/pages/lore/lore.tscn",
	"res://scenes/pages/success/success.tscn"
]

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

func next_page():
	self._current_page += 1
	print(self._current_page, len(self._pages_rotation))
	if (self._current_page > len(self._pages_rotation) - 1):
		self._current_page = 0
	self.switch_scene(self._pages_rotation[self._current_page])
