class_name ClickerPrototype
extends Control


func _on_texture_button_1_pressed() -> void:
	ManagerMoney.ref.click()  # Example command
	print("Button 1 pressed! Money:", Game.ref.data.money)

func _on_texture_button_2_pressed() -> void:
	ManagerMoney.ref.click()  # Example command
	print("Button 2 pressed! Money:", Game.ref.data.money)
	
func _on_texture_button_3_pressed() -> void:
	ManagerMoney.ref.click()  # Example command
	print("Button 3 pressed! Money:", Game.ref.data.money)
