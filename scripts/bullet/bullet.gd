extends Area2D

@export var SPEED = 150 
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
var has_collided = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not has_collided:
		shot(delta)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_group"):
		area.queue_free() # Eliminar al enemigo
		animated_sprite_2d.play("fireball_hit") # Reproducir animación de impacto
		has_collided = true # Marcar que la bala ha colisionado
		collision_shape_2d.set_deferred("disabled", true) # Desactivar colisiones para evitar más impactos
		await animated_sprite_2d.animation_finished
		queue_free() # Eliminar la bala después de la animació

func shot(delta):
	position.x += SPEED * delta

func direction_player(direction_player):
	var direction_shot = direction_player
	print(direction_shot)
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
