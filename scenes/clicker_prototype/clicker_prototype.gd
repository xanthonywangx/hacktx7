class_name ClickerPrototype
extends Node

@onready var game : Game = null

func _ready() -> void:
	game = Game.ref

func _on_texture_button_1_pressed() -> void:
	if not game.showOptions:
		ManagerMoney.ref.click()  # Increase money
		print("Money Button pressed! Money:", game.data.money)

func _on_texture_button_2_pressed() -> void:
	if game.showOptions:
		game.handle_choice("Option 1")
		Game.ref.data.yesno = 1
	else:
		print("Option 1 pressed, but no options are shown")
	

func _on_texture_button_3_pressed() -> void:
	if game.showOptions:
		game.handle_choice("Option 2")
		Game.ref.data.yesno = -1
	else:
		print("Option 2 pressed, but no options are shown")
