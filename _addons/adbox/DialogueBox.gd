"""
 _______ 
|   _   |
|  |_|  |
|       |
|       |
|   _   |
|__| |__|
 ______   ___   _______  ___      _______  _______  __   __  _______ 
|      | |   | |   _   ||   |    |       ||       ||  | |  ||       |
|  _    ||   | |  |_|  ||   |    |   _   ||    ___||  | |  ||    ___|
| | |   ||   | |       ||   |    |  | |  ||   | __ |  |_|  ||   |___ 
| |_|   ||   | |       ||   |___ |  |_|  ||   ||  ||       ||    ___|
|       ||   | |   _   ||       ||       ||   |_| ||       ||   |___ 
|______| |___| |__| |__||_______||_______||_______||_______||_______|
 _______  _______  __   __ 
|  _    ||       ||  |_|  |
| |_|   ||   _   ||       |
|       ||  | |  ||       |
|  _   | |  |_|  | |     | 
| |_|   ||       ||   _   |
|_______||_______||__| |__|

Easy to use dialogue box for all kind of games with not many features
Follow the tutorial in README.md to implement

v. 0.1

Author: Max Schmitt 
		from
		Divirad - Kepper, Lösing, Schmitt GbR
"""

extends NinePatchRect
class_name DialogueBox, "icon.png"

export var message_sound : AudioStreamSample
export var font : Font
export var action_name : String
export var wait_time = 0.2
export var block_time = 0.3
#export var frames : SpriteFrames
export var margin_top_bottom = 15
export var margin_left_right = 15
var time : float

var text = []
var num : int
var wait : bool = false
var block_walk : bool
var hidden : bool = true

var audio : AudioStreamPlayer
var audioShouldPlay : bool = true

var TextBox : RichTextLabel
var InputBlocker : Timer
var ShowTimer : Timer

var block_box_timer : bool

var percent_addition : float

onready var main = self.get_owner()
onready var exit_label = main.get_node("DialogueBox").get_node("Label")
onready var player = main.get_node("Player")
onready var end_game = false

signal dialogue_exit()

func _enter_tree():
	TextBox = load("res://_addons/adbox/textbox.tscn").instance()
	TextBox.add_font_override("normal_font", font)
	
	var container = Container.new()
	container.anchor_right = 1
	container.anchor_bottom = 1
	container.margin_left = margin_left_right
	container.margin_top = margin_top_bottom
	container.margin_right = -margin_left_right
	container.margin_bottom = -margin_top_bottom
	
	InputBlocker = Timer.new()
	
	InputBlocker.autostart = true
	InputBlocker.one_shot = true
	InputBlocker.wait_time = block_time

	ShowTimer = Timer.new()
	ShowTimer.autostart = true
	ShowTimer.wait_time = wait_time
	
	add_child(container)
	container.add_child(TextBox)
	
	TextBox = container.get_node(TextBox.name)
	container.add_child(InputBlocker)
	container.add_child(ShowTimer)
	
	InputBlocker.connect("timeout", self, "_on_InputBlocker_timeout")
	ShowTimer.connect("timeout", self, "_on_Timer_timeout")
	hide()

func _ready():
	main.get_node("Map/buildings/containment-cell/celldoor")
	message_sound.loop_mode = message_sound.LOOP_DISABLED
	message_sound.loop_begin = 0
	message_sound.loop_end = 0
	
	audio = AudioStreamPlayer.new()
	audio.stream = message_sound
	add_child(audio)

func _process(delta):
	if hidden:
		return

func _input(event):
	if Input.is_action_just_pressed(action_name):
		if wait == true:
			if TextBox.percent_visible != 1:
				TextBox.percent_visible = 1
				return
			if num < len(text) - 1:
				num += 1
				TextBox.text = text[num]
				to_beginning()
			elif TextBox.percent_visible == 1:
				player.player_can_move = true
				num = 0
				TextBox.percent_visible = .05
				hide()
				InputBlocker.wait_time = block_time
				InputBlocker.start()
				if end_game:
					main.get_node("Map/buildings/containment-cell/celldoor").game_over()

func talk(textarray : Array, is_ending : bool):
	"""
	Use this function to activate the DialogueBox
	"""
	end_game = is_ending
	text = textarray
	block_walk = true
	num = 0
	TextBox.text = text[num]
	show()
	to_beginning()

func to_beginning():
	exit_label.visible = false
	percent_addition = 1 / float(TextBox.text.length())
	
	ShowTimer.wait_time = wait_time
	TextBox.percent_visible = 0.01
	
	wait = false
	hidden = false
	audioShouldPlay = true
	
	ShowTimer.start()

func _on_Timer_timeout():
	if TextBox.percent_visible < 1:
		exit_label.visible = false
		TextBox.percent_visible += percent_addition 
		audio.play(0)
	else:
		exit_label.visible = true
		audioShouldPlay = false
		audio.stop()
		ShowTimer.stop()
	wait = true

func _on_InputBlocker_timeout():
	hidden = true
	block_walk = false
	InputBlocker.stop()
	audio.stop()
	emit_signal("dialogue_exit")
