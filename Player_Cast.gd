extends RayCast2D
var PCastCollision=false
func _physics_process(_delta):
	set_cast_to(Vector2(0,.5))
	if is_colliding()==true:
		PCastCollision=true
	if is_colliding()==false:
		PCastCollision=false
