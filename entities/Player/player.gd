extends CharacterBody3D
class_name Player

@export
var dir_change_factor: float = 100.

# ---

var move_direction: Vector3

# ---

func _process(delta: float) -> void:
    var input_dir = self._get_input_direction()
    if input_dir != Vector3.ZERO:
        self.move_direction = lerp(
            self.move_direction,
            input_dir,
            min(self.dir_change_factor * delta, 1)
        ).normalized()

func _physics_process(delta: float) -> void:
    if self.move_direction == Vector3.ZERO:
        return

    self.position += (
        self.move_direction *
        delta
    )

# ---

func _get_input_direction():
    return (
        Vector3.BACK * Input.get_axis("move_up", "move_down") +
        Vector3.RIGHT * Input.get_axis("move_left", "move_right")
    ).normalized()
