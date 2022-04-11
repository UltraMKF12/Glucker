extends KinematicBody2D

export(int) var speed #Pixel/sec
export(int) var jump_strength
export(float, 0, 10, 0.1) var gravity

var direction: Vector2 = Vector2.ZERO

onready var animation: AnimatedSprite = $AnimatedSprite
onready var sword = get_node("Sword")


func _ready():
	sword.connect("knockback", self, "on_knockback_from_sword")


func _process(_delta):
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.x *= speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		direction.y = 0
		direction.y -= jump_strength


func _physics_process(delta):
	#Gravity
	direction.y += gravity
	
	direction = move_and_slide(direction, Vector2.UP)
	update_animation()


func update_animation():
	#Animation
	if direction.y != 0:
		animation.animation = "jumping"
		
	elif direction.x != 0:
		animation.animation = "walking"
	
	elif is_on_floor():
		animation.animation = "standing"
	
	#Direction
	if direction.x < 0:
		animation.flip_h = false
	
	elif direction.x > 0:
		animation.flip_h = true


func on_knockback_from_sword(sword_position):
	direction = (global_position - sword_position) * 10
