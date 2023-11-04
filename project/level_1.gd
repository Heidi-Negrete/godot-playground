extends StaticBody2D


@onready var collision_poly = $CollisionPolygon2D
@onready var polygon = $CollisionPolygon2D/Polygon2D


func _ready():
	polygon.polygon = collision_poly.polygon

func _process(_delta):
	pass
