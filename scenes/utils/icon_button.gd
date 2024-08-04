tool
extends Button

export(String) var button_text = "UNSET"
export(Texture) var texture

func _ready():
	$label.text = button_text
	$CenterContainer/icon.texture = texture

