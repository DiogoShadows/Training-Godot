extends CharacterBody2D

signal player_shoot_laser(pos : Vector2, direction : Vector2)
signal player_throw_grenade(pos : Vector2, direction : Vector2)

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Movement Input
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	
	#Rotate Player
	look_at(get_global_mouse_position())
	
	#Shoot
	if Input.is_action_just_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		player_shoot_laser.emit(selected_laser.global_position, GetPlayerDirection())
		can_laser = false
		$Laser_timer.start()
		
	elif Input.is_action_just_pressed("secondary action") and can_grenade:
		var grenade_marker = $GrenadeStartPositions/Marker2D
		player_throw_grenade.emit(grenade_marker.global_position, GetPlayerDirection())
		can_grenade = false
		$Granade_timer.start()
		
	move_and_slide()

func GetPlayerDirection() -> Vector2:
	return (get_global_mouse_position() - position).normalized()
	
func _on_laser_timer_timeout():
	can_laser = true


func _on_granade_timer_timeout():
	can_grenade = true
