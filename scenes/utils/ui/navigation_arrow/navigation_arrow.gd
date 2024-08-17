tool
extends Control

export(String) var text = "UNSET"
var _disabled: bool = false
export(bool) var is_disabled = false setget setDisabled, getDisabled
var _mirror: bool = false
export(bool) var is_mirror = false setget setMirror, getMirror

signal on_navigation_arrow_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	$text.text = text
	if is_mirror:
		setMirror(true)
	if is_disabled:
		setDisabled(true)

func setDisabled(newValue: bool):
	_disabled = newValue
	if (newValue == true):
		$poly.color = Color('9ea8b4')
	else:
		$poly.color = Color('313b47')

func getDisabled() -> bool:
	return _disabled

func setMirror(newValue: bool):
	_mirror = newValue
	if (newValue == true):
		set_rotation(PI)
	else:
		set_rotation(0)

func getMirror() -> bool:
	return _mirror

func _on_button_pressed():
	emit_signal("on_navigation_arrow_pressed")
