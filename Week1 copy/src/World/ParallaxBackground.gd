extends ParallaxBackground

export (float) var scrolling_speed = 350.0

func _process(delta: float) -> void:
	scroll_offset.x -= scrolling_speed * delta
