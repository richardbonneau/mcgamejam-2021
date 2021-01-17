extends Spatial

onready var player_inventory = {
	"electricbox_key":false,
	"electricbox_key_2":false,
	"neighbour_house_key":false,
	"safe_key":false,
	"power_restored": false
}
onready var current_act = 1
onready var player_messages = {
	"trying_to_leave":["Something doesn't sit right with this place. I want to make sure there's nothing I should report to the police."],
	"safe_nokey":["I need some kind of electronic key to open it"],
	"electricbox_nokey": ["It requires some sort of key before I can operate it."],
	"found_electricbox_key": ["You found the key to the Electric Box"],
	"found_electricbox_key_2": ["You found the key to the Electric Box... Again."],
	"found_electronic_key": ["You've found an Electronic Key"],
	"found_neighbour_house_key":["You found the neighbour's emergency key"],
	"door_locked":["The door is locked"],
	"check_on_girl":["She is asleep. There is a tube attached to her arm, she is probably sedated."],
	"its_a_human_doll":["It's an oddly realistic looking human doll"],
	"power_not_restored": ["There is an electrical problem with the NumPad Lock"]
}

onready var acts = [
	{
		"num": 1,
		"character":"oldman",
		"complete": false,
		"finishesAct":true,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["Howdy youngster. What brings you around here?","You were on your way to your car and you got lost? You ain't the brightest fella are you?","Well, while you're here, could you do me a favor before you go?","It's really simple, the power is acting a bit strange lately. Could you go up to the power panel and turn it off and on again?","My granddaughter works in IT and she tells me that's how she fixes all of her problems."," Let me know when it's done."]
	},
	{
		"num": 2,
		"character":"oldman",
		"complete": false,
		"finishesAct":false,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["Is it done? No? Then shoo! You have to turn the power off and on again."]
	},
	{
		"num": 2,
		"character":"neighbour",
		"complete": false,
		"finishesAct":true,
		"new_oldman_coordinates":Vector3(-65.3,-0.3,56.8),
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["What exactly do you think you're doing?","Are you trying to shut the power down?","Didn't you see the sign? What the hell were you thinking? Give me that.","YOU LOSE THE KEY TO THE ELECTRICAL PANEL","Now get out of here."]
	},
	{
		"num": 3,
		"character":"neighbour",
		"complete": false,
		"finishesAct":false,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["Out."]
	},
	{
		"num": 3,
		"character":"oldman",
		"complete": false,
		"finishesAct":true,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":Vector3(100,0,0),
		"neighbour_rotate": true,
		"ending":false,
		"dialogues": ["What? You couldn't do it? How come?","I see, you met the neighbour. Strange fella. He used to live with his wife and daughter but I haven't seen them in ages.","Definitely very strange. We are allowed to deal with the power around here.","Besides, my heating is out, so we really have to do it anyways.","Tell you what, at this time usually he is out to buy groceries.", "I think you could probably sneak into his house and grab that key that he stole off of ya.","Let's do this quickly while he is away. See if you can find a way inside of the house."]
	},
	{
		"num": 4,
		"character":"oldman",
		"complete": false,
		"finishesAct":false,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["Do it."]
	},
	{
		"num": 5,
		"character":"oldman",
		"complete": false,
		"finishesAct":false,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":false,
		"dialogues": ["My heater works again. Thank you! You can be on your way now ..."]
	},
	{
		"num": 6,
		"character":"neighbour",
		"complete": false,
		"finishesAct":true,
		"new_oldman_coordinates":null,
		"new_neighbour_coordinates":null,
		"neighbour_rotate": false,
		"ending":true,
		"dialogues": ["You shouldn't have come here.","You have seen too much and you wouldn't understand. They would kill her if they knew what she has become.", "I owed her a new doll, it's been a while. I think you will be perfect."]
	},
	]

func _on_Button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
	
