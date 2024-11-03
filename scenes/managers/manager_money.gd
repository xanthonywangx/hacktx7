class_name ManagerMoney
extends Node

static var ref : ManagerMoney

func _ready() -> void:
	update_label()

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

func update_label() -> void:
	$Label.text = "$%s" %Game.ref.data.money

func click() -> void:
	Game.ref.data.money += Game.ref.data.gain
	update_label()

func subtract() -> void:
	Game.ref.data.money -= Game.ref.data.expense
	update_label()
