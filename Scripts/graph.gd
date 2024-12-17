extends TextureRect

var data: Array[float] = [0.2, 0.1, 0.1, 0.3, 0.2, 0.6, 0.9, 0.8]

func _draw() -> void:
	const FONT = preload("res://Resources/Fonts/W95FA.otf")
	
	var margins = 40
	draw_line(Vector2(margins, 0), Vector2(margins, size.y - margins), Color.BLACK, 3)
	draw_line(Vector2(margins, size.y - margins), Vector2(size.x, size.y - margins), Color.BLACK, 3)
	draw_string(FONT, Vector2(5, 20), str(data.max()), HORIZONTAL_ALIGNMENT_RIGHT, -1, 24, Color.BLACK)
	draw_string(FONT, Vector2(5, size.y - margins), str(data.min()), HORIZONTAL_ALIGNMENT_RIGHT, -1, 24, Color.BLACK)

	var max_value = data.max()
	var min_value = data.min()
	var length = (size.x - margins) / (data.size() - 1)
	
	var normalized_data = []
	for value in data:
		var normalized_value = (value - min_value) / (max_value - min_value)
		normalized_data.append(abs(1 - normalized_value))
	
	for i in normalized_data.size() - 1:
		var value = normalized_data[i]
		var next_value = normalized_data[i + 1]
		var color = Color.GREEN if value > next_value else \
				(Color.RED if value != next_value else Color.DIM_GRAY)
		draw_line(
			Vector2((i * length) + margins, (size.y - margins) * value),
			Vector2(((i + 1) * length) + margins, (size.y - margins) * next_value),
			color,
			5
		)

func _ready() -> void:
	queue_redraw()
