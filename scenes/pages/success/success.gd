extends Panel

onready var all_success = get_node("page_frame/title_card/VScrollBar/success")
onready var Success = preload("res://scenes/pages/success/scenes/Success.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.insert_all_success()


func insert_all_success():
	Utils.delete_children(all_success)

	for success in BookData.get_all_success():
		var s = Success.instance()
		s.set_main(self)
		s.set_from_success_object(success)
		all_success.add_child(s)
