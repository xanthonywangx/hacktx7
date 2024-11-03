class_name Game
extends Node

static var ref : Game
var timeElapsed : int  = 0
var age : int = 13

func _ready() -> void:
	print("ready")
	$EventTimer.start()
	$ExpenseTimer.start()

func _enter_tree() -> void:
	if ref: 
		queue_free()
		return
	
	ref = self


var data : Data = Data.new()


func _on_timer_timeout() -> void:
	if age < 32:
		age += 1
		$ageLabel.text = "Age : %s" %age
		$EventTimer.start(6)
	elif age >= 32:
		age += 1
		$ageLabel.text = "Age : %s" %age
		$EventTimer.start(4)
	
	
func _on_expense_timer_timeout() -> void:
	ManagerMoney.ref.subtract()
	$ExpenseTimer.start()

#func eventStarter() -> void:
#	if timeElapsed > 5:
#		if  Game.ref.data.money > 10:
#			print("EVENT")
			

		
		
func _process(_delta: float) -> void:
	Game.ref.data.yesno = 0	
	
	if age == 14:
		Game.ref.data.gain = 2
		$popups14.show()
		$ItemList14.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.money -= 10
		elif Game.ref.data.yesno == -1:
			Game.ref.data.money -= 2
	$popups14.hide()
	$ItemList14.hide()
	Game.ref.data.yesno = 0
			
	if age == 16:
		Game.ref.data.gain = 13
		$popups16.show()
		$ItemList16.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.money -= 200
		elif Game.ref.data.yesno == -1:
			Game.ref.data.money -= 400
	$popups16.hide()
	$ItemList16.hide()
	Game.ref.data.yesno = 0
			
	if age == 18:
		$popups18.show()
		$ItemList18.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain = 18
		elif Game.ref.data.yesno == -1:
			Game.ref.data.gain = 8
	$popups18.hide()
	$ItemList18.hide()
	Game.ref.data.yesno = 0
	
	if age == 22:
		$popups22.show()
		$ItemList22.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain = 40
			Game.ref.data.money -= 1000
			Game.ref.data.expense += 700
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense = 500
			Game.ref.data.money -= 5000
	$popups22.hide()
	$ItemList22.hide()
	Game.ref.data.yesno = 0
	
	if age == 26:
		$popups26.show()
		$ItemList26.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain += 80
			Game.ref.data.money -= 20000
			Game.ref.data.expense *=2
		elif Game.ref.data.yesno == -1:
			Game.ref.data.money -= 2
	$popups26.hide()
	$ItemList26.hide()
	Game.ref.data.yesno = 0
	
	if age == 32:
		$popups32.show()
		$ItemList32.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.expense += 10000
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense += 10000
	$popups32.hide()
	$ItemList32.hide()
	Game.ref.data.yesno = 0
	
	if age == 36:
		$popups36.show()
		$ItemList36.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.money -= 80000
			Game.ref.data.expense += 400
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense += 1200
	$popups36.hide()
	$ItemList36.hide()
	Game.ref.data.yesno = 0
	
	if age == 40:
		$popups40.show()
		$ItemList40.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain += 65
			Game.ref.data.expense += 500
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense += 200
	$popups40.hide()
	$ItemList40.hide()
	Game.ref.data.yesno = 0

	if age == 50:
		$popups50.show()
		$ItemList50.show()
		if Game.ref.data.yesno == 1:
			Game.ref.data.expense += 1000
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense += 100
	$popups50.hide()
	$ItemList50.hide()
	Game.ref.data.yesno = 0
