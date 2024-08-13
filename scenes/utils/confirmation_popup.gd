tool
extends Node

export(String, MULTILINE) var content = ""
export(String) var accept_button = "Accepter"
export(String) var cancel_button = "Annuler"

signal generic_popup_accept()

func _ready():
	$popup_frame/MarginContainer/VBoxContainer/RichTextLabel.text = content
	$popup_frame/MarginContainer/VBoxContainer/HBoxContainer/PopupButtonAccept.text = accept_button
	$popup_frame/MarginContainer/VBoxContainer/HBoxContainer/PopupButtonCancel.text = cancel_button
	$popup_frame.hide()

func open():
	$popup_frame.show()

func _on_PopupButtonAccept_pressed():
	print("hero")
	emit_signal("generic_popup_accept")
	$popup_frame.hide()

func _on_PopupButtonCancel_pressed():
	print("Failed")
	$popup_frame.hide()
