class_name Game
extends Node

static var ref : Game
var timeElapsed : int  = 0
var age : int = 13

func _ready() -> void:
	print("ready")
	$EventTimer.start()

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
	
	
		

#func eventStarter() -> void:
#	if timeElapsed > 5:
#		if  Game.ref.data.money > 10:
#			print("EVENT")
			

		
		
func _process(_delta: float) -> void:
	timeElapsed = (Time.get_ticks_msec() / 10)
	#var timeElapsedSeconds = (Time.get_ticks_msec() / 1000)
	if (timeElapsed % 200) == 0:
		ManagerMoney.ref.subtract()

	
		




	

	

	
