class_name Game
extends Node

static var ref : Game
var timeElapsed : int = 0
var age : int = 13
var showOptions : bool = false

@onready var option1_button : Button = null
@onready var option2_button : Button = null
@onready var money_button : Button = null
@onready var popup : Popup = null
@onready var popup_label : Label = null

func _ready() -> void:
	ref = self
	option1_button = get_node("Option1Button")
	option2_button = get_node("Option2Button")
	money_button = get_node("MoneyButton")
	popup = get_node("Popup")
	popup_label = popup.get_node("PopupLabel")

	print("Ready function called")
	print("Option1Button:", option1_button)
	print("Option2Button:", option2_button)
	print("MoneyButton:", money_button)
	print("Popup:", popup)
	print("PopupLabel:", popup_label)

	if option1_button and option2_button and money_button and popup and popup_label:
		option1_button.connect("pressed", Callable(self, "_on_option1_button_pressed"))
		option2_button.connect("pressed", Callable(self, "_on_option2_button_pressed"))
		money_button.connect("pressed", Callable(self, "_on_money_button_pressed"))
		hide_options()
	else:
		print("One or more nodes not found")
	
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
		$ageLabel.text = "Age : %s" % age
		$EventTimer.start(6)
	elif age >= 32:
		age += 1
		$ageLabel.text = "Age : %s" % age
		$EventTimer.start(4)

	show_options_based_on_age()

func _process(_delta: float) -> void:
	timeElapsed = (Time.get_ticks_msec() / 10)
	if (timeElapsed % 200) == 0:
		ManagerMoney.ref.subtract()

func _on_option1_button_pressed():
	if showOptions:
		handle_choice("Option 1")

func _on_option2_button_pressed():
	if showOptions:
		handle_choice("Option 2")

func _on_money_button_pressed():
	if not showOptions:
		print("Money Button pressed: Increasing money counter")
		ManagerMoney.ref.add()

func handle_choice(choice: String) -> void:
	print("User chose: %s" % choice)
	hide_options()
	popup.hide()

func show_options_based_on_age() -> void:
	if age == 14:
		show_options()
		popup_label.text = "Option 1: Buy VBucks for $5! \n Option 2: Store in a piggy bank (-$2)"
		popup.popup_centered()
		if Game.ref.data.yesno == 1:
			Game.ref.data.money -= 5
		elif Game.ref.data.yesno == -1:
			Game.ref.data.money -= 2
		
	if age == 16:
		show_options()
		popup_label.text = "Option 1: Eat out w Friends (-$200) \n Option 2: Donuts in a parking lot"
		popup.popup_centered()
		Game.ref.data.gain = 13
		if Game.ref.data.yesno == 1:
			Game.ref.data.money -= 200
		elif Game.ref.data.yesno == -1:
			Game.ref.data.money -= 400
		
	if age == 18:
		show_options()
		popup_label.text = "Option 1: Continue with job \n but you get promotion ($18/click)
		 \n Option 2: College ($8/click, but better pay later)"
		popup.popup_centered()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain = 18
		elif Game.ref.data.yesno == -1:
			Game.ref.data.gain = 8
		
	if age == 22:
		show_options()
		popup_label.text = "Option 1: Cancun with friends! (-1000): 
		\n 			BUT $40/click \n Option 2: New Car (-$5,000) (-$500/month)"
		popup.popup_centered()
		if Game.ref.data.yesno == 1:
			Game.ref.data.gain = 40
			Game.ref.data.expense += 700
			Game.ref.data.money -= 1000
		elif Game.ref.data.yesno == -1:
			Game.ref.data.expense += 500
			Game.ref.data.money -= 5000
		
	if age == 26:
		show_options()
		popup_label.text = "Option 1: Wedding Ring and Marriage 
		\n (-$20,000) ($80/click) (Doule expenses) 
		\n Option 2: Ring pop for your lonely self (-$1)"
		popup.popup_centered()

		
	if age == 32:
		show_options()
		popup_label.text = "Option 1: Avoiding Kids \n Option 2: 2 Kids (-$1,000/month)"
		popup.popup_centered()
		
	if age == 36:
		show_options()
		popup_label.text = "Option 1: New House 
		\n (-$400,000) (-$80,000 down payment) (-$1,000/month loan) 
		\n Option 2: New Apartment (-$1,200)"
		popup.popup_centered()
		
	if age == 40:
		show_options()
		popup_label.text = "Option 1: Alcoholic (-$500/month) ($65/click) 
		\n Option 2: Pilates (-$200/month)"
		popup.popup_centered()
		
	if age == 50:
		show_options()
		popup_label.text = "Option 1: New Pet! (-$1,000/month) 
		\n Option 2: Pickleball Obession (-$100)"
		popup.popup_centered()

func show_options() -> void:
	showOptions = true
	if option1_button and option2_button:
		option1_button.show()
		option2_button.show()
		print("Options shown")
	else:
		print("Cannot show buttons, nodes not found")

func hide_options() -> void:
	showOptions = false
	if option1_button and option2_button:
		option1_button.hide()
		option2_button.hide()
		print("Options hidden")
	else:
		print("Cannot hide buttons, nodes not found")
