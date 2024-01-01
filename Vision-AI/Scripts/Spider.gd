extends CharacterBody3D

@onready var SPIDER_EYES = $Eyes
var TARGET: Node3D
var PLAY_SEEN_ANIMATION_ONCE = true

func _ready():
	TARGET = get_tree().get_nodes_in_group("target")[0]
	$AnimationPlayer.play("IdleSpider", 0.1)

func _process(delta):
	var wasp_position = TARGET.global_transform.origin
	if SPIDER_EYES.in_vision_cone(wasp_position) and SPIDER_EYES.has_los(wasp_position):
		if PLAY_SEEN_ANIMATION_ONCE:
			$AnimationPlayer.play("GetDamageSpider", 0.05)
			PLAY_SEEN_ANIMATION_ONCE = false
	else:
		$AnimationPlayer.play("IdleSpider", 0.08)
		PLAY_SEEN_ANIMATION_ONCE = true
	pass
