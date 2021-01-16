extends Spatial

onready var current_act = 1
onready var acts = [
	{
		"num": 1,
		"character":"oldman",
		"complete": false,
		"finishesAct":true,
		"dialogues": ["Howdy youngster. What brings you around here?","You were on your way to your car and you got lost? You ain't the brightest fella are you?","Well, while you're here, could you do me a favor before you go?","It's really simple, the power is acting a bit strange lately. Could you go up to the power panel and turn it off and on again?","My granddaughter works in IT and she tells me that's how she fixes all of her problems."," Let me know when it's done!"]
	},
	{
		"num": 2,
		"character":"oldman",
		"complete": false,
		"finishesAct":false,
		"dialogues": ["Is it done? No? Then shoo! You have to turn the power off and on again."]
	},
	{
		"num": 2,
		"character":"neighbour",
		"complete": false,
		"finishesAct":true,
		"dialogues": ["What exactly do you think you're doing?","Are you trying to shut the power down?","Didn't you see the sign? What the hell were you thinking? Give me that.","YOU LOSE THE KEY TO THE ELECTRICAL PANEL","Now get out of here."]
	},
	{
		"num": 3,
		"character":"neighbour",
		"complete": false,
		"finishesAct":false,
		"dialogues": ["Out."]
	},
	{
		"num": 3,
		"character":"oldman",
		"complete": false,
		"finishesAct":true,
		"dialogues": ["What? You couldn't do it? How come?","I see, you met the neighbour. Strange fella. He used to live with his wife and daughter but I haven't seen them in ages.","Definitely very strange. We are allowed to deal with the power around here.","Besides, my heating is out, so we really have to do it anyways.","Tell you what, at this time usually he is out to buy groceries.", "I think you could probably sneak into his house and grab that key that he stole off of ya.","Let's do this quickly while he is away. See if you can find a way inside of the house."]
	},
	{
		"num": 4,
		"character":"oldman",
		"complete": false,
		"finishesAct":false,
		"dialogues": ["Do it."]
	},
	{
		"num": 4,
		"character":"neighbour",
		"complete": false,
		"finishesAct":true,
		"dialogues": ["You shouldn't have come here.","You have seen too much and you wouldn't understand. You did this to yourself. I have warned you.", "This is the last time you will ever see the light of the sun.", "Good night"]
	},
	]
