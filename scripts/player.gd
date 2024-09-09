extends CharacterBody2D


const SPEED = 100.0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction_x = Input.get_axis("ui_left", "ui_right")
		
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = true
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = false	
				
		$AnimatedSprite2D.play("run")
	else:
		velocity = Vector2(0,0)
		$AnimatedSprite2D.play("idle")
	

	move_and_slide()
