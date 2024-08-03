extends Control

export(String) var text = "UNSET"
var disabled: bool = false
export(bool) var is_disabled = false setget setFunction, getFunction
export(bool) var mirror = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$text.text = text
	if mirror:
		set_rotation(PI)

func setFunction(newValue: bool):
	disabled = newValue
	if (newValue == true):
		$poly.color = Color('313b47')
	else:
		$poly.color = Color('9ea8b4')

func getFunction() -> bool:
	return disabled

func _on_button_pressed():
	Swiper.go_to_page(self.dest)
