extends ColorRect

signal fade_finished

func fade_in():
	$AnimationPlayer.play("fade_in")

# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")
