extends Node2D

signal knockback(sword_position)

onready var animation: AnimationPlayer = $AnimationPlayer
onready var rb: RigidBody2D = $RigidBody2D

func _physics_process(delta):
	if(rb.get_colliding_bodies().size() == 0):
		look_at(get_global_mouse_position())
	
	#If there is collision with something the player need to be knocked back
	else:
		emit_signal("knockback", rb.global_position)
	
	
	
	if Input.is_action_pressed("attack"):
		animation.play("attack")
