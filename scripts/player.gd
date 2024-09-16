extends CharacterBody2D
class_name Player

@export var SPEED = 100.0
@export var life = 100
@export var bullet_scene: PackedScene
var direction_player: Vector2
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		create_bullet()

func _ready() -> void:
	$ProgressBar.value = life

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction_x = Input.get_axis("ui_left", "ui_right")
		
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction.x > 0:
			$AnimatedSprite2D.flip_h = false	
				
		$AnimatedSprite2D.play("run")
		direction_player = direction
	else:
		velocity = Vector2(0,0)
		$AnimatedSprite2D.play("idle")
	

	move_and_slide()

func create_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	bullet.direction_player(direction_player)
	get_parent().add_child(bullet)


func decrease_life(value):
	life -= value
	$ProgressBar.value = life
	if life == 0:
		death()

func death():
	print("Muerto")
	
