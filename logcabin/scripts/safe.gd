extends Spatial

onready var main = self.get_owner().get_owner()
onready var door_opened = false

func open_door():
	if !main.player_inventory.safe_key:
		main.get_node("DialogueBox").talk(main.player_messages.safe_nokey,false)
	elif !door_opened:
		rotation.y = atan2(-0.5, 0)
		door_opened = true
		$CollisionShape.queue_free()
		$CollisionShape2.queue_free()
		$CollisionShape3.queue_free()
