extends Node2D

func _process(delta):
	
	if GlobalData.currently_controlling != null:
		# retry level
		if Input.is_action_just_pressed("ui_retry"):
			get_tree().reload_current_scene()
		
		
		if Input.is_action_just_pressed("ui_change_left"):
			# get positions
			var benjamin_pos_x = GlobalData.benjamin_ref.position.x
			var nathan_pos_x = GlobalData.nathan_ref.position.x
			var charlotte_pos_x = GlobalData.charlotte_ref.position.x
			var currently_controlled_pos_x = GlobalData.get_ref_from_enum(GlobalData.currently_controlling).position.x
			
			var positions = [
				benjamin_pos_x,
				nathan_pos_x,
				charlotte_pos_x
			]
	
			var dict = {
				benjamin_pos_x: GlobalData.family_members.BENJAMIN,
				nathan_pos_x: GlobalData.family_members.NATHAN,
				charlotte_pos_x: GlobalData.family_members.CHARLOTTE
			}
			
			# sort
			positions.sort()
			if currently_controlled_pos_x in positions:
				var controlled_index = positions.bsearch(currently_controlled_pos_x)
				var index_to_change_to
				match controlled_index:
					0:
						index_to_change_to = 2
					1:
						index_to_change_to = 0
					2:
						index_to_change_to = 1
				GlobalData.change_controlled_member_to(dict[positions[index_to_change_to]])
		
		if Input.is_action_just_pressed("ui_change_right"):
			# get positions
			var benjamin_pos_x = GlobalData.benjamin_ref.position.x
			var nathan_pos_x = GlobalData.nathan_ref.position.x
			var charlotte_pos_x = GlobalData.charlotte_ref.position.x
			var currently_controlled_pos_x = GlobalData.get_ref_from_enum(GlobalData.currently_controlling).position.x
			
			var positions = [
				benjamin_pos_x,
				nathan_pos_x,
				charlotte_pos_x
			]
	
			var dict = {
				benjamin_pos_x: GlobalData.family_members.BENJAMIN,
				nathan_pos_x: GlobalData.family_members.NATHAN,
				charlotte_pos_x: GlobalData.family_members.CHARLOTTE
			}
			
			# sort
			positions.sort()
			if currently_controlled_pos_x in positions:
				var controlled_index = positions.bsearch(currently_controlled_pos_x)
				var index_to_change_to
				match controlled_index:
					0:
						index_to_change_to = 1
					1:
						index_to_change_to = 2
					2:
						index_to_change_to = 0
				GlobalData.change_controlled_member_to(dict[positions[index_to_change_to]])
