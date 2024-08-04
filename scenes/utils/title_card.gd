extends Control

export(String) var title = "UNSET"


# Called when the node enters the scene tree for the first time.
func _ready():
	$header/title.text = title
