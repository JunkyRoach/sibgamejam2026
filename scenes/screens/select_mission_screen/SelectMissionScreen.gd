extends ScreenBase
class_name SelectMissionScreen

static var select_mission_screen_scene:PackedScene = preload("res://scenes/screens/select_mission_screen/SelectMissionScreen.tscn")






func destroy():
	self.queue_free()
	pass
