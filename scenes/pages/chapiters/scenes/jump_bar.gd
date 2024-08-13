extends Node

var values: PoolIntArray = [
	1, 100, 200, 300, 400, 500, 600
]

var jump_block = preload("res://scenes/pages/chapiters/scenes/jump_block.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for value in self.values:
		var new_block = jump_block.instance()
		new_block.value = value
		connect("on_jump_block_pressed", new_block, "on_jump_block_pressed")
		self.add_child(new_block)
		
func on_jump_block_pressed(value: int):
	print("Need to jump")
	print(value)
