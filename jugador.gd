extends KinematicBody2D

export (float) var Speed = 150
export (float) var Gravity = 20      
export (float) var fuerza_de_salto = 410 #Las decenas no puede acabar en par xd
var Motion = Vector2()
var Arriba = Vector2(0, -1)

func _physics_process(delta):
	print(Motion)
	Motion.y += Gravity
	if Input.is_action_pressed("ui_left"):
		Motion.x = -Speed
		$slime.flip_h = true
		#Cambiar animationplayers por un animation tree
		$AnimationPlayer.play("Correr")
	elif Input.is_action_pressed("ui_right"):
		Motion.x = Speed
		$slime.flip_h = false
		#Cambiar animationplayers por un animation tree
		$AnimationPlayer.play("Correr")
	else:
		Motion.x = 0
		$AnimationPlayer.play("Idle")
	if is_on_floor() == true: 
		if Input.is_action_just_pressed("ui_accept"):
		 Motion.y = -fuerza_de_salto
	else: 
		if Motion.y != 0:
			#Cambiar animationplayers por un animation tree
			$AnimationPlayer.play("caer")


	Motion = move_and_slide(Motion,Arriba)
