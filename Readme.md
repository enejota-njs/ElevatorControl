This repository contains a project that simulates an elevator control system, developed as part of the Digital Circuit Design discipline of the Computer Engineering course at the State University of Feira de Santana. The project covers topics such as combinational and sequential logic, state machines (Moore and Mealy), circuit design with flip-flops and multiplexers, as well as Verilog implementations for FPGAs, with practical applications involving displays and other digital peripherals.

Project Details:

The system developed is capable of efficiently managing elevator calls, controlling movement between floors according to requests made. To guarantee safety, the system checks that the doors are properly closed before starting any movement, ensuring the integrity of users. Furthermore, it continuously monitors the maximum occupancy capacity, preventing overloads and preserving proper functioning. All these functionalities operate in an integrated manner, meeting security requirements and promoting efficient and reliable operation.

Entries:

- Elevator Call: Each floor will be represented by a DIP switch. When the key is activated, it represents that the elevator was called to that floor.
- People Control: Two buttons are used to simulate people entering and leaving the elevator. A button increases the number of people inside the elevator. The other button decreases the number of people.

Outputs:

- Motor Drive: The system must control the motor to move the elevator between floors, with "up" and "down" commands.
- Current Floor Display: The floor on which the elevator is located should be displayed on a 7-segment display.
- Display of Number of People: The current number of people within the elevator must be displayed on a second 7-segment display.
- Door Status Indication: There must be an indication whether the elevator door is is open or closed. The door should only open when the elevator is stopped at the floor called.
- Maximum Capacity Alarm: The elevator has a maximum capacity of people. If the number of people exceeds this capacity, the elevator must be stopped and an alarm must be activated until the number of people is reduced.
- Movement and Direction: The direction of movement of the elevator (rising or descending) shall be indicated by separate LEDs or other signaling method.