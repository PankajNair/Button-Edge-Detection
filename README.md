# Button Edge Detection
## Problem Statement
Button switches used in electronic circuits are often prone to generating multiple signals (bouncing) when they are pressed or released. This can cause errors and malfunction in digital systems. To mitigate this issue, a button edge detection FSM is needed that detects the rising and falling edges of the button signal and generates a corresponding output signal that indicates a single press or release of the button. 

## Project Pipeline
* Timer (timer): Design of a timer that ticks every 2ms when enabled.
* Debounced Output (debounce_fsm & delayed_debounce): Design of an FSM that produces a debounced signal. The debounced signal will have a 2ms delay compared to the original signal so as to reduce the risk of errors.
* Edge Detector (edge_detector): Design of an FSM that detects the edges of the debounced signal. 
* Top Module (top): This is the topmost module which is used to connect all other modules in the design.
