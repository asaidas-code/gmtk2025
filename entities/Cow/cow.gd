extends CharacterBody3D
class_name Cow

# ---

@onready
var mooer: AudioStreamPlayer3D = %Mooer

@onready
var body_collider: CollisionShape3D = %BodyCollider

@onready
var neck_collider: CollisionShape3D = %NeckCollider

@onready
var hear_area: Area3D = %HearArea

# ---

var can_hear_player: bool = false
var moove_direction: Vector3 = Vector3.ZERO

# ---

func _init() -> void:
    hear_area.body_entered.connect(self._on_hear)
    hear_area.body_exited.connect(self._on_stop_hearing)

func _process(delta: float) -> void:
    if self.can_hear_player:
        self.moove_direction = (
            self.position - GameService.get_player_position()
        ).normalized()

    self.moove(self.moove_direction * self.moove_speed * delta)

# ---

func _on_hear(body: Node3D):
    match GameService.identify_entity(body):
        GameService.EntityType.PLAYER:
            self.can_hear_player = true

func _on_stop_hearing(body: Node3D):
    match GameService.identify_entity(body):
        GameService.EntityType.PLAYER:
            self.can_hear_player = false

# ---

func moo():
    pass

func moove(amt: Vector3):
    if amt == Vector3.ZERO:
        return
    self.position += amt
