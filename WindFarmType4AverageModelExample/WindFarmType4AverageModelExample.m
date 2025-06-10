%% Wind Farm - Synchronous Generator and Full Scale Converter (Type 4) Average Model
%
% This example shows a 10 MW wind farm using an average model of a Type 4
% wind turbine.
% 
% Richard Gagnon and Jacques Brochu (Hydro-Quebec)

% Copyright 1997-2018 Hydro-Quebec, and The MathWorks, Inc.

%%

Ts=50e-6;
open_system('WindFarmType4AverageModel')

%% 1. Simulation Methods of the Type 4 Wind Turbine 
%
% Depending on the range of frequencies to be represented, three simulation
% methods are currently available in Specialized Power Systems to model VSC based energy conversion systems connected on power grids. 
%
% *The detailed model (discrete)* such as the one presented in the power_wind_type_4_det model. The detailed model includes detailed representation of power 
% electronic IGBT converters. In order to achieve an acceptable accuracy with the 2000 Hz and 3000 Hz switching frequencies used in this example, the 
% model must be discretized at a relatively small time step (2 microseconds). This model is well suited for observing harmonics and 
% control system dynamic performance over relatively short periods of times (typically hundreds of milliseconds to one second).  
%
% *The average model (discrete)* such as the one presented in this example. In this type of model the IGBT Voltage-sourced converters (VSC) are represented 
% by equivalent voltage sources generating the AC voltage averaged over one cycle of the switching frequency. A similar method is used for DC-DC converter. The average model does not 
% represent harmonics, but the dynamics resulting from control system and power system interaction is preserved. This model allows using
% much larger time steps (typically 50 microseconds), thus allowing simulations of several seconds. 
%
% *The phasor model (continuous)* such as the one presented in the "power_wind_dfig" model in the Renewable Energy examples library. This model is better
% adapted to simulate the low frequency electromechanical oscillations over long periods of time (tens of seconds to minutes). In the 
% phasor simulation method, the sinusoidal voltages and currents are replaced by phasor quantities (complex numbers) at the system 
% nominal frequency (50 Hz or 60 Hz).This is the same technique which is used in transient stability software. 
%

%% 2. Description
%
% A 10 MW wind farm consisting of five 2 MW wind turbines connected to a 25 kV distribution system exports power to a 120 kV grid through 
% a 30 km, 25 kV feeder.      
%
% The Type 4 wind turbine presented in this example consists of a synchronous generator connected to a diode rectifier, a DC-DC IGBT-based PWM boost converter and a DC/AC IGBT-based PWM 
% converter modeled by voltage sources. The Type 4 technology allows extracting maximum energy from the wind for low wind speeds by 
% optimizing the turbine speed, while minimizing mechanical stresses on the turbine during gusts of wind.  
%
% In this example the wind speed is maintained constant at 15 m/s. The control system of the DC-DC converter is used to maintain the 
% speed at 1 pu. The reactive power produced by the wind turbine is regulated at 0 Mvar. 
%
% Right-click on the "Wind Turbine Type 4" block and select "Look Under Mask" to see how the model is built. The sample time 
% used to discretize the model (Ts= 50 microseconds) is specified in the Initialization function of the Model Properties. 
%
% Open the "Wind Turbine Type 4" block menu to see the 
% data of the generator, the converter, the turbine, the drive train and
% the control systems. In the Display menu select "Turbine data for 1 wind
% turbine", check "Display wind turbine power characteristics" and then click Apply. The
% turbine Cp curves are displayed in Figure 1. The turbine power, the tip speed ratio lambda and the Cp values are displayed
% in Figure 2 as function of wind speed.
% For a wind speed of 15 m/s, the turbine output power is 1 pu of its rated power, the pitch angle is 8.9 deg and the generator speed is 1 pu.
%

%% 3. Simulation
%
% In this example you will observe the steady-state operation of the Type 4 wind turbine and its dynamic response to voltage sag resulting from a remote fault 
% on the 120-kV system. Open the "120 kV" block modeling the voltage source and see how a six-cycle 0.25 pu voltage drop is programmed at t=0.03 s 
%
% Start simulation. Observe voltage and current waveforms on the Scope block. At simulation start the "xInitial" variable containing the initial 
% state variables is automatically loaded (from the "WindFarmType4AverageModel.mat" file specified in the Model Properties) so that the 
% simulation starts in steady state. 
%
% Initially the Type 4 wind farm produces 10 MW. The corresponding turbine speed is 1 pu of generator synchronous speed. 
% The DC voltage is regulated at 1100 V and reactive power is kept at 0 Mvar. At t=0.03 s the positive-sequence voltage suddenly drops to 
% 0.75 p.u. causing an increase on the DC bus voltage and a drop on the Type 4 wind turbine output power. During the voltage sag the control systems try to regulate 
% DC voltage and reactive power at their set points (1100 V, 0 Mvar). The
% system recovers after fault elimination. 
%

%% 4. Regenerate Initial Conditions
%
% This example is set-up with all states initialized so that the simulation starts in steady-state. Otherwise, due to the 
% long time constants of the electromechanical part of the wind turbine model and to its relatively slow regulators you would have to wait  
% for tens of seconds before reaching steady-state. The initial conditions have been saved in the "WindFarmType4AverageModel.mat" file.
% When you start simulation, the InitFcn callback (in the Model Properties/Callbacks) automatically loads into your workspace the contents
% of this .mat file ("xInitial" variable specified in the "Initial state" parameter in the Simulation/Configuration Parameters menu). 
%
% If you modify this model, or change parameter values of power components, the initial conditions stored in the "xInitial" variable 
% will no longer be valid and Simulink(R) will issue an error message. To regenerate the initial conditions for your modified model,
% follow the steps listed below:
%%
% 1. In the Configuration Parameters pane, uncheck the "Initial state" parameter and check "Final States" parameter.
% 
% 2. In the 120 kV Three-phase Voltage Source menu, disable the source voltage step by setting the "Time variation of " parameter to "none".
% 
% 3. In order to shorten the time required to reach steady-state, temporarily decrease the inertia of the turbine-generator
% group. Open the Wind Turbine Type 4 menu and in the Drive train data and Generator data, divide the H inertia constants by 10. 
% 
% 4. Change the Simulation Stop Time to 5 seconds. Note that in order to generate initial conditions coherent with the 60 Hz voltage source 
% phase angles, the Stop Time must be an integer number of 60 Hz cycles.
% 
% 5. Change the Simulation Mode from "Normal" to "Accelerator".
% 
% 6. Start simulation. When Simulation is completed, verify that steady state has been reached by looking at waveforms displayed on the Scope block. 
% The final states which have been saved in the "xFinal" structure with time can be used as initial states for future simulations.
% Executing the next two commands copies these final conditions in "xInitial" and saves this variable in a new file (MyModelInit.mat).
%
%   >> xInitial=xFinal;
%
%   >> save MyModelInit xInitial
%
% 7. In the InitFcn window of Model Properties pane, replace the first line of initialization commands with "load MyModelInit".
% Next time you start a simulation with this model, the variable
% xInitial saved in the MyModelInit.mat file will be loaded in your workspace.
%
% 8. In the Configuration Parameters pane, check "Initial state".
%
% 9. In the Wind Turbine Generator and Drive train data, reset the inertia constants H back to their original values.
%
% 10. Start simulation and verify that your model starts in steady-state.
%
% 11. In the 120 kV Three-phase voltage source menu, set the "Time variation of" parameter back to "Amplitude". 
%
% 12. Change the Simulation Stop Time and Simulation Mode back to their original values (0.2 seconds,  Normal).
%
% 13. Save your model.
%%

