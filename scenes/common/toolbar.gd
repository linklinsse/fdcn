extends Panel



var main = null


var fdcn_tex = load("res://images/fdcn_icon.png")
var cdsi_tex = load("res://images/cdsi_logo.png")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func register_main(main):
	self.main = main


func set_spoils():
	var b = AppParameters.are_spoils_ok()
	$SpoilButton.pressed = b


func set_sound():
	var b = AppParameters.is_sound_ok()
	$SoundButton.pressed = b
	

func _on_spoil_button_toggled(button_pressed):
	#TODO linklinsse
	#self.main.change_spoils(button_pressed)
	pass


func set_billy():
	var type_billy = AppParameters.get_billy_type()
	var billys = {'guerrier': $Billys/BlockGuerrier,
	'paysan':$Billys/BlockPaysan,
	'prudent':$Billys/BlockPrudent,
	'debrouillard':$Billys/BlockDebrouillard
	}
	
	for billy in billys.keys():
		var panel = billys[billy]
		var _style = panel.get('custom_styles/panel')
		#print('STYLE: %s' % _style)
		_style.set_bg_color(Color('e9eaec'))  # set to light grey
	if type_billy != 'pegu':
		billys[type_billy].get('custom_styles/panel').set_bg_color(Color('9ea8b4'))  # set to dark grey
	
	var billy_strings = {
		'guerrier': 'Guerrier',
		'paysan': 'Paysan',
		'prudent': 'Prudent',
		'debrouillard': 'Débrouillard',
		'pegu': 'Pegu!!'
	}
	$Billys/BillyTypeLabel.text = billy_strings[type_billy]


func set_page(page_name):
	var pages = {'main': $Pages/BlockMain,
	'chapitres':$Pages/BlockChapitres,
	'success':$Pages/BlockSuccess,
	'lore':$Pages/BlockLore
	}
	
	for page in pages.keys():
		var panel = pages[page]
		var _style = panel.get('custom_styles/panel')
		#print('STYLE: %s' % _style)
		_style.set_bg_color(Color('e9eaec'))  # set to light grey
	# NOTE: about is not an icon, only with swipe
	if page_name in pages:
		pages[page_name].get('custom_styles/panel').set_bg_color(Color('9ea8b4'))  # set to dark grey


func set_book_context():
	var book_number = AppParameters.get_book_number()
	var book_panels = {
		1: $BookSelection/BookDisplayFdcn,
		2: $BookSelection/BookDisplayCdsi,
	}
	if book_number == 1:
		book_panels[1].visible = true
		book_panels[2].visible = false
	else:
		book_panels[1].visible = false
		book_panels[2].visible = true


func focus_to_main():
	Swiper.focus_to_main()


func focus_to_chapitres():
	Swiper.focus_to_chapitres()
	
func focus_to_success():
	Swiper.focus_to_success()
	
func focus_to_lore():
	Swiper.focus_to_lore()
	
# NOTE: page about do NOT have a button


func _switch_to_guerrier():
	print('guerrier')
	self.main._switch_to_guerrier()


func _switch_to_paysan():
	print('paysan')
	self.main._switch_to_paysan()


func _switch_to_prudent():
	print('prudent')
	self.main._switch_to_prudent()


func _switch_to_debrouillard():
	print('debrouillard')
	self.main._switch_to_debrouillard()


func _on_button_options():
	print('SHOW OPTIONS')
	$Options.show()

func _on_sound_button_toggled(button_pressed):
	#self.main.change_sound(button_pressed)
	#TODO LINKLINSSE
	pass
