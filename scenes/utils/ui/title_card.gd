tool
extends Control

export(String) var title = "UNSET"
export(String) var sideTitle = null
export(Texture) var Icon = null

signal sideTitle_click()

# Called when the node enters the scene tree for the first time.
func _ready():
	$header/title.text = title
