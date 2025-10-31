# 6-Bit Counter
Simple 6-bit counter on the Gowin Tang Nano 9K FPGA to validate Verilog development toolchain and hardware setup.

### Demo
![Counter Demo](https://github.com/user-attachments/assets/3d4ad195-2c1a-4bff-a326-6947fc03f34f)

### Objective
This project serves as a "Hello World" equivalent for FPGA dev, the 6-bit counter cycles through values 0-63, displaying the count on the onboard LEDs.

- [x] **Toolchain Setup**: Configure VSCode with Verilog extensions
- [x] **Simulation Workflow**: Master Icarus Verilog for behavioral simulation  
- [x] **FPGA Synthesis**: Learn Gowin synthesis flow and constraint files
- [x] **Hardware Debugging**: Use LEDs for real-time verification



### Hardware Configuration
```verilog
localparam WAIT_TIME = 3500000;  // ~0.5 second at 27MHz
reg [23:0] clockCounter = 0;     // 24-bit timing counter
reg [5:0] LED_Display = 0;       // 6-bit counter value
```

### Repo Structure
```
/
├── src/
│   └── counter.v              # Main counter implementation
└── constraints/
    └── tangnano9k.cst         # Physical pin constraints
```

### Synthesis & Deployment
1. Open project in VSCode ([Icarus Verilog](https://steveicarus.github.io/iverilog/) needed)
2. Load concstraint file
3. Build and Program

## Next Steps
This project served as the foundation for more complex designs ->  [RISC-Style ALU](https://github.com/ChidumamAmadi-Obi/RISC-Style-ALU)
