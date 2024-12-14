module elevator_control (
	input clock,
	input floor3_key, floor2_key, floor1_key, floor0_key, 
	input increment_button, decrement_button,
	output sound_alarm,
	output digit_4, digit_3, digit_2, digit_1, 
	output segment_A, segment_B, segment_C, segment_D, segment_E, segment_F, segment_G, segment_P,
	output led_9, led_8, led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0,
	output line_6, line_5, line_4, line_3, line_2, line_1, line_0, column_4, column_3, column_2, column_1, column_0,
	output open_door, elevator_moving, door_moving);

	clock_divider (clock, frequency_1hz, frequency_4hz, frequency_64hz, frequency_05hz, frequency_8hz); // Clock Divider
	
	// Setting the display digits ***
	
	assign digit_1 = frequency_64hz;
	assign digit_2 = 1;
	assign digit_3 = 1;
	assign digit_4 = ~frequency_64hz;
	
	// ******************************
	
	state_machine (frequency_05hz, x, reset, e1, e0); // Finite state machine
	state_change_control (e1, e0, floor3_key, floor2_key, floor1_key, floor0_key, c2, c1, c0, a1, a2, a0, u1, u0, l1, l0, door_direction, x); // State Change Control
	
	// People control *******************************************************************
	
	reset_control (frequency_4hz, reset);

	debounce (frequency_64hz, increment_button, inc_but);
	debounce (frequency_64hz, decrement_button, dec_but);

	edge_detector (frequency_64hz, inc_but, inc);
	edge_detector (frequency_64hz, dec_but, dec);

	assign maximum_people = a2 & a1 & a0; 
	assign minimum_people = ~a2 & ~a1 & ~a0;
	
	assign inc_button = inc & ~maximum_people;
	assign dec_button = dec & ~minimum_people;
	
	assign m = dec;
	
	assign sound_alarm = red_alarm;
	assign red_alarm = (a2 & a1 & ~a0 & frequency_4hz) | (a2 & a1 & a0 & frequency_8hz);
	
	people_control (m, a2, a1, a0, 0, 0, 1, r2, r1, r0);
	
	and (frequency_incdec, frequency_64hz, ~e1, ~e0);
	
	flip_flop_d (frequency_incdec, r2, (inc_button | dec_button), reset, a2);
	flip_flop_d (frequency_incdec, r1, (inc_button | dec_button), reset, a1);
	flip_flop_d (frequency_incdec, r0, (inc_button | dec_button), reset, a0);

	// **********************************************************************************
	
	assign elevator_moving = e1 & ~e0;
	and (frequency_movements, frequency_1hz, e1, ~e0);
	movement_control (frequency_movements, floor3_key, floor2_key, floor1_key, floor0_key, u1, u0, l1, l0); // Floor control
	
	// Door control *********************************************************************************
	
	assign door_moving = (~e1 & e0) | (e1 & e0) | red_alarm;
	
	assign open_door = (~e1 & ~e0 & ~a2) | (~e1 & ~e0 & ~a1);
	
	assign port_permission = (e0);
	assign door_direction = (~e1);
	
	door_counter (frequency_4hz, door_direction, port_permission, c2, c1, c0);
	door_decoder (c2, c1, c0, led_9, led_8, led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0);
	
	// **********************************************************************************************
	
	matrix_decoder (u1, u0, line_6, line_5, line_4, line_3, line_2, line_1, line_0, column_4, column_3, column_2, column_1, column_0); // LED matrix decoder
	
	display_multiplexer (frequency_64hz, 0, u1, u0, a2, a1, a0, out2, out1, out0); // 7-segment display multiplexer
	
	seven_segment_decoder (out2, out1, out0, segment_A, segment_B, segment_C, segment_D, segment_E, segment_F, segment_G, segment_P); // 7 segment decoder
endmodule 