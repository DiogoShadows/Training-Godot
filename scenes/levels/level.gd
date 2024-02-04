extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/Grenade.tscn")

func _on_gate_player_entered_gate(body):
	print(body)


func _on_player_player_shoot_laser(pos : Vector2, direction : Vector2):
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.laserDirection = direction
	laser.rotation_degrees = rad_to_deg(direction.angle())
	$Projectiles.add_child(laser)

func _on_player_player_throw_grenade(pos : Vector2, direction : Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.SPEED
	$Projectiles.add_child(grenade)
