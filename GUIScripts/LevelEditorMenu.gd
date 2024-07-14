extends Node

func _on_exit_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/StartMenu.tscn");

func _on_run_btn_pressed():
	pass # Replace with function body.

func _on_save_btn_pressed():
	pass # Replace with function body.


func _on_set_board_size_btn_pressed():
	var errorLabelNode = get_node("BoardGameDimensions/SetBoardSizeLbl");
	errorLabelNode.text = "";
	
	var numOfRowsNode = get_node("BoardGameDimensions/BoardRowsTxt");		
	var numOfColumnsNode = get_node("BoardGameDimensions/BoardColumnsTxt");
		
	var rows = numOfRowsNode.text.to_int();
	var columns = numOfColumnsNode.text.to_int();
	
	if  rows == 0 || columns == 0:
		errorLabelNode.text = "Both row and columns must be ints";
		return;
