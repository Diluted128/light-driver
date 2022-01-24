## About
The system is designed for automatic control of the condition of light bulbs in given rooms. If there is at least one person in the room, the light should be on. There cannot be more than 9 people in a given room.
## Simulation

The user, through the first 8 switches, can select the place of the passage of a given person. The direction of the transition is defined by the last switch (switched on - upwards for vertical entry, and left for horizontal entry, off - downwards for vertical entry, and right for horizontal entry). The light bulb status is represented by diodes on the Altera board, while the number of people in each room is represented numerically on seven-segment displays.
## Schema
![schema](https://user-images.githubusercontent.com/67759414/150795981-fa5f5acb-7593-4c0b-bed8-9defbbfe32fc.png)
## Technologies
- MicroC / OS-II real-time system
- Hardware module in VHDL
- Dual CPU support
