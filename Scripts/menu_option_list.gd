extends PanelContainer

const SIZE_CHANGE_SECONDS = 0.5

var collapsed = false
var changing_size = false

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_LEFT:
				if !changing_size:
					changing_size = true

					for i in $Options.get_children():
						if !collapsed:
							buffer_reenable()
							i.minimize(SIZE_CHANGE_SECONDS)
						else:
							buffer_reenable()
							i.expand(SIZE_CHANGE_SECONDS)
					collapsed = !collapsed

func buffer_reenable():
	get_tree().create_timer(SIZE_CHANGE_SECONDS).timeout.connect(func(): changing_size = false)
