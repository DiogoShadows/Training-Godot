extends CharacterBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Movement Input
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	
	#Shoot
	if Input.is_action_just_pressed("primary action"):
		print("Shoot")
		
	elif Input.is_action_just_pressed("secondary action"):
		print("Shoot granade")
		
	move_and_slide()
