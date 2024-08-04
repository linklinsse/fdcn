extends Node

var _current_page: int = 0
var _pages_rotation = [
	"res://scenes/pages/about/about.tscn",
	"res://scenes/pages/adventure/adventure.tscn",
	"res://scenes/pages/chapiters/chapiters.tscn",
	"res://scenes/pages/lore/lore.tscn",
	"res://scenes/pages/success/success.tscn"
]

func next_page():
	self._current_page += 1
	if (self._current_page > len(self._pages_rotation) - 1):
		self._current_page = 0
	SceneSwitcher.switch_scene(self._pages_rotation[self._current_page])

func prev_page():
	self._current_page -= 1
	if (self._current_page < 0):
		self._current_page = len(self._pages_rotation) - 1
	SceneSwitcher.switch_scene(self._pages_rotation[self._current_page])

func _on_prev_arrow_on_navigation_arrow_pressed():
	self.next_page()

func _on_next_arrow_on_navigation_arrow_pressed():
	self.prev_page()
