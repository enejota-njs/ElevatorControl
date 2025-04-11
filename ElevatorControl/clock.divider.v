module clock_divider (
	input frequency_50Mhz,
	output frequency_1hz, frequency_4hz, frequency_64hz, frequency_05hz, frequency_8hz);
	
	clock_counter (frequency_50Mhz, w0);      		   //Output : 10 MHz
	clock_counter (w0, w1);     				       //Output : 2 MHz
	clock_counter (w1, w2);     				       //Output : 400 kHz
	clock_counter (w2, w3);     				       //Output : 80 kHz
	clock_counter (w3, w4);  	                       //Output : 16 kHz
	clock_counter (w4, w5);                            //Output : 3,2 kHz
	clock_counter (w5, w6);                            //Output : 640 Hz
	clock_counter (w6, w7);                            //Output : 128 Hz
	flip_flop_t (w7, 1, frequency_64hz);               //Output : 64 Hz  
	flip_flop_t (frequency_64hz, 1, w9);               //Output : 32 Hz
	flip_flop_t (w9, 1, w10);                          //Output : 16 Hz
	flip_flop_t (w10, 1, frequency_8hz);               //Output : 8 Hz
	flip_flop_t (frequency_8hz, 1, frequency_4hz);     //Output : 4 Hz
	flip_flop_t (frequency_4hz, 1, w13);               //Output : 2 Hz
	flip_flop_t (w13, 1, frequency_1hz);               //Output : 1 Hz
	flip_flop_t (frequency_1hz, 1, frequency_05hz);    //Output : 0,5 Hz
	
endmodule 