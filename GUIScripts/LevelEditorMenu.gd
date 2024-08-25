extends Node

@export var levelAssembler : Node;

func _on_exit_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/StartMenu.tscn");

func _on_run_btn_pressed():
	levelAssembler.RunLevel();

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
		
	levelAssembler.createBoard(rows,columns);


func _on_place_spawn_point_btn_pressed():
	var errorLabelNode = get_node("SetSpawnPoint/PlaceSpawnPointLbl");
	errorLabelNode.text = "";
	
	var rowSPPointNode = get_node("SetSpawnPoint/PlaceSpawnPointRowsTxt");		
	var colSPPointNode = get_node("SetSpawnPoint/PlaceSpawnPointColumnsTxt");
		
	var rowSPPoint = rowSPPointNode.text.to_int() - 1;
	var columnSPPoint = colSPPointNode.text.to_int() - 1;
	
	var result = levelAssembler.setSpawnPoint(rowSPPoint, columnSPPoint);
	if 	!result[0]:
		errorLabelNode.text = result[1];


func _on_place_enemy_spawn_point_btn_pressed():
	var errorLabelNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointLbl");
	errorLabelNode.text = "";
	
	var rowSPPointNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointRowsTxt");		
	var colSPPointNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointColumnsTxt");
		
	var rowSPPoint = rowSPPointNode.text.to_int() - 1;
	var columnSPPoint = colSPPointNode.text.to_int() - 1;
	
	var result = levelAssembler.setEnemySpawnPoint(rowSPPoint, columnSPPoint);
	if 	!result[0]:
		errorLabelNode.text = result[1];


func _on_remove_enemy_spawn_point_btn_pressed():
	var errorLabelNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointLbl");
	errorLabelNode.text = "";
	
	var rowSPPointNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointRowsTxt");		
	var colSPPointNode = get_node("SetEnemySpawnPoints/PlaceEnemySpawnPointColumnsTxt");
		
	var rowSPPoint = rowSPPointNode.text.to_int() - 1;
	var columnSPPoint = colSPPointNode.text.to_int() - 1;
	
	var result = levelAssembler.removeEnemySpawnPoint(rowSPPoint, columnSPPoint);
	if 	!result[0]:
		errorLabelNode.text = result[1];
