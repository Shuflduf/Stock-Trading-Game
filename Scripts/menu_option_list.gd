extends PanelContainer

@export var SIZE_CHANGE_SECONDS = 0.5

var collapsed = false
var changing_size = false

func _ready() -> void:
    for i in $Options.get_children():
        i.selected.connect(select_item.bind(i))
        i.deselect()

func _on_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.is_pressed():
            if event.button_index == MOUSE_BUTTON_LEFT:
                change_size_all()

func change_size_all():
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

func select_item(item: MenuOption):
    if collapsed:
        change_size_all()
        return
    if changing_size:
        return

    for i in $Options.get_children():
        i.deselect()
    item.select()
    change_size_all()
