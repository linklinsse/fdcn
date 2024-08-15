extends Panel

export(int) var value = 0

signal on_jump_block_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/label.text = str(self.value)

func _on_button_pressed():
	emit_signal("on_jump_block_pressed", value)
