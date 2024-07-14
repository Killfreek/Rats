extends Node

@export var levelCreator : Node;

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
		
	if  rows > 5:
		errorLabelNode.text = "Max number of rows allowed is 5";
		return;
		
	if  columns > 12:
		errorLabelNode.text = "Max number of columns allowed is 12";
		return;
		
	levelCreator.createBoard(rows,columns);


func _on_place_spawn_point_btn_pressed():
	var errorLabelNode = get_node("SetSpwanPoint/PlaceSpawnPointLbl");
	errorLabelNode.text = "";
	
	var rowSPPointNode = get_node("SetSpwanPoint/PlaceSpawnPointRowsTxt");		
	var colSPPointNode = get_node("SetSpwanPoint/PlaceSpawnPointColumnsTxt");
		
	var rowSPPoint = rowSPPointNode.text.to_int();
	var columnSPPoint = colSPPointNode.text.to_int();
	
	var result = levelCreator.setSpawnPoint(rowSPPoint, columnSPPoint);
	if 	!result[0]:
		errorLabelNode.text = result[1];
