extends RefCounted
class_name GameService

static func identify_entity(node: Node3D) -> EntityType:
    return EntityType.PLAYER

static func get_player_position() -> Vector3:
    return Vector3.ZERO

enum EntityType {
    COW,
    PLAYER
}
