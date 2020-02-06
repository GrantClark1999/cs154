### Implementing and simulating multiplexers in PyRTL ###

import pyrtl

# Now, it is time to build and simulate (for 16 cycles) a 3-bit 5:1 MUX.
# You can develop your design using either Boolean gates as above or PyRTL's
# conditional assignment.

# Declare data inputs
a = pyrtl.Input(bitwidth=3, name='a')
b = pyrtl.Input(bitwidth=3, name='b')
c = pyrtl.Input(bitwidth=3, name='c')
d = pyrtl.Input(bitwidth=3, name='d')
e = pyrtl.Input(bitwidth=3, name='e')

# Declare control inputs
s = pyrtl.Input(bitwidth=3, name='s')

# Declare outputs 
o = pyrtl.Output(bitwidth=3, name='o')

# Describe your 5:1 MUX implementation
with pyrtl.conditional_assignment:
    with s == 0 :
        o |= a
    with s ==1 :
        o |= b
    with s == 2 :
        o |= c
    with s == 3 :
        o |= d
    with s == 4 :
        o |= e

# Simulate and test your design for 16 cycles using random inputs
sim_trace = pyrtl.SimulationTrace()
sim = pyrtl.Simulation(tracer=sim_trace)

import random
for cycle in range(16):
    # Call "sim.step" to simulate each clock cycle of the design
    sim.step({
        'a': random.choice([0, 1]),
        'b': random.choice([0, 1]),
        'c': random.choice([0, 1]),
        'd': random.choice([0, 1]),
        'e': random.choice([0, 1]),
        's': random.choice([0, 4])
        })

# Print the trace results to the screen.
print('--- 3-bit 5:1 MUX Simulation ---')
sim_trace.render_trace()