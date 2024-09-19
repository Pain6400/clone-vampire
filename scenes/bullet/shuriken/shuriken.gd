extends Area2D

const SPEED = 150.0
const ROTATION_SPEED = 10.00
var direction_player: Vector2
var target_direction: Vector2
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
var has_collided = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Buscar el enemigo más cercano al comenzar
	target_direction = get_direction_to_nearest_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not has_collided and target_direction:
		# Moverse en la dirección del enemigo más cercano
		position += SPEED * delta * target_direction.normalized()
		rotation += ROTATION_SPEED * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_group"):
		area.queue_free() # Eliminar al enemigo
		#animated_sprite_2d.play("fireball_hit") # Reproducir animación de impacto
		has_collided = true # Marcar que la bala ha colisionado
		collision_shape_2d.set_deferred("disabled", true) # Desactivar colisiones para evitar más impactos
		#await animated_sprite_2d.animation_finished
		queue_free() # Eliminar la bala después de la animació

# Función para obtener la dirección hacia el enemigo más cercano		
func get_direction_to_nearest_enemy() -> Vector2:
	var nearest_enemy: Area2D = null
	var shortest_distance: float = INF
	# Buscar en el grupo de enemigos
	for enemy in get_tree().get_nodes_in_group("enemy_group"):
		var distance = position.distance_to(enemy.position)
		if distance < shortest_distance:
			shortest_distance = distance
			nearest_enemy = enemy

	# Si se encontró un enemigo, devolver la dirección hacia él
	if nearest_enemy:
		return (nearest_enemy.position - position).normalized()

	# Si no hay enemigos, devolver una dirección nula
	return Vector2.ZERO
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
