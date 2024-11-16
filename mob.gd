extends CharacterBody2D

const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")

var health = 3

@onready var player = get_node("/root/Game/Player")


func _ready() -> void:
    %Slime.play_walk()


func _physics_process(_delta: float) -> void:
    var direction = global_position.direction_to(player.global_position)
    velocity = direction * 300
    move_and_slide()


func take_damage():
    health -= 1
    %Slime.play_hurt()

    if health <= 0:
        var smoke = SMOKE_EXPLOSION.instantiate()
        smoke.global_position = global_position
        get_parent().add_child(smoke)
        queue_free()
