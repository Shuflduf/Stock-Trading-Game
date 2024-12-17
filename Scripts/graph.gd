extends TextureRect

var data: Array[float] = [0.2, 0.1, 0.1, 0.3, 0.2, 0.6, 0.9, 0.8]

func _draw() -> void:
    var max_value = data.max()
    var min_value = data.min()
    var length = size.x / (data.size() - 1)
    
    var normalized_data = []
    for value in data:
        var normalized_value = (value - min_value) / (max_value - min_value)
        normalized_data.append(abs(1 - normalized_value))
    
    for i in normalized_data.size() - 1:
        var value = normalized_data[i]
        var next_value = normalized_data[i + 1]
        draw_line(
            Vector2(i * length, size.y * value),
            Vector2((i + 1) * length, size.y * next_value),
            Color.RED,
            3
        )

func _ready() -> void:
    queue_redraw()
