tool

extends Node

onready var _polygone = $polygone
onready var _title = $polygone/title

export(String) var title = "Undefined"
var _color: Color = Color('e0e2e5')
export(Color) var color = "Annuler" setget setColor, getColor

func setColor(newValue: Color):
	_color = newValue
	if _polygone:
		_polygone.color = _color

func getColor() -> Color:
	return _color

func _ready():
	self._title.text = self.title
	self._polygone.color = _color
