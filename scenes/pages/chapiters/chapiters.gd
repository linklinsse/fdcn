extends Panel

onready var all_choices = get_node("page_frame/title_card/VScrollBar/choices")
onready var Choice = preload("res://scenes/common/chapiter_choice/chapter_choice.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.insert_all_chapters()

# We need to compare integer, not strings
static func _sort_all_chapters(nb1, nb2):
	if int(nb1) < int(nb2):
		return true
	return false

func insert_all_chapters():
	Utils.delete_children(all_choices)
	var chapter_ids = BookData.get_all_nodes().keys()
	chapter_ids.sort_custom(self, '_sort_all_chapters')

	for chapter_id in chapter_ids:
		var chapter_data = BookData.get_node(chapter_id)

		var choice = Choice.instance()
		choice.set_main(self)
		choice.set_chapitre(chapter_data.get_id())
		choice.set_label(chapter_data.get_chapter())
		all_choices.add_child(choice)

#TODO FIXME
func jump_to_chapter_100aine(centaine):
	var scroll_bar = $page_frame/title_card/VScrollBar
	# Get chapter until we find the good one
	for choice in all_choices.get_children():
		var chapter_id = choice.get_chapter_id()
		# We are not sure the choice is visible, so take the first one that match "at least
		if chapter_id >= centaine:
			print('found chapter: %s ' % chapter_id, '%s' % choice)
			print('Jump to :%s' % choice.rect_position.y)
			scroll_bar.scroll_vertical = choice.rect_position.y
			return

func _on_jump_bar_on_jump_pressed(value: int):
	self.jump_to_chapter_100aine(value)	
