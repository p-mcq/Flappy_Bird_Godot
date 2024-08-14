extends ParallaxBackground
@export var scrollingSpeed:float = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_base_offset.x -= scrollingSpeed * delta
