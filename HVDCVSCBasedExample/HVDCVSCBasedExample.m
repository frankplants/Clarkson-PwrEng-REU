%% VSC-Based HVDC Transmission System  
%
% This example shows a VSC-based HVDC transmission link 200 MVA (+/-
% 100kV).
%
% Silvano Casoria (Hydro-Quebec)

% Copyright 1997-2012 Hydro-Quebec, and The MathWorks, Inc.
%%

open_system('HVDCVSCBased')

%% Description
%
% A 200 MVA (+/- 100 kV DC) forced-commutated Voltage-Sourced Converter (VSC)  interconnection is used to transmit power from a 230 kV, 2000 MVA, 
% 50 Hz system to another identical  AC system. The rectifier and the inverter are three-level Neutral Point Clamped (NPC) VSC converters using 
% close IGBT/Diodes. The Sinusoidal Pulse Width Modulation (SPWM) switching uses a single-phase triangular carrier wave with a frequency of 27 
% times fundamental frequency (1350 Hz). Along with the converters, the station includes on the AC side: the step down Yg-D transformer, the AC
% filters, the converter reactor; and on the DC side: the capacitors, the DC filters. The transformer tap changers and saturation characteristics 
% are not simulated. The 40 Mvar shunt AC filters are 27th and 54th high-pass tuned around the two dominating harmonics. The 0.15 p.u. converter 
% reactor with the 0.15 p.u. transformer leakage reactance permits the VSC output voltage to shift in phase and amplitude with respect to the AC 
% system Point of Common Coupling (PCC) (bus B1 for station 1 and B2 for station 2) and allows control of converter active and reactive power 
% output. The reservoir DC capacitors are connected to the VSC terminals. They have an influence on the system dynamics and the voltage ripple 
% on the DC side. The high-frequency blocking filters are tuned to the 3rd harmonic, i.e. the main harmonic present in the positive and negative 
% pole voltages. The rectifier and the inverter are interconnected through a 75 km cable (i.e. 2 pi sections) and two 8 mH smoothing reactors. 
% A circuit breaker is used to apply a three-phase to ground fault on the inverter AC side. A Three-Phase Programmable Voltage Source block is 
% used in station 1 system to apply voltage sags.
%
% The discrete control system generates the three sinusoidal modulating signals that are the reference value of the bridge phase voltages. The 
% amplitude and phase of the modulating signals can be calculated to control either: the reactive and real AC power flow at the PCC, or the 
% reactive power flow at the PCC and the pole to pole DC voltage. It would also be possible to control the AC voltage amplitude at the PCC, 
% but this option is not included in our model. A description of the control system is provided in the "VSC-Based HVDC Link" case study of the 
% User's Manual. The power system and the control system are both discretized for a sample time Ts_Power=7.406e-6 s and Ts_control=74.06e-6 s 
% respectively. They are multiples of the carrier period. Notice that the "Model initialization" function of the model automatically sets these 
% two sample times in your MATLAB(R) workspace.                                                
%

%% Simulation
%
% Two simulations will permit to examine the system response to:  
%
% 1) Steps on the regulators references, and  
%
% 2) Minor and severe perturbations on the AC sides.
%
% *Steady-state - Step response of power (P & Q) and DC voltage regulators*
%
% The system is programmed to start and reach a steady state. Steps are then applied sequentially on: the reference active and reactive power 
% of the rectifier; the reference DC voltage of the inverter. The dynamic response of the regulators is observed. Start the simulation. Open the 
% BUS B1 STATION_1 and DC_SIDE_STATION_2 scopes (in the respective Data Acquisition subsystems). Examine in station 1: the active power on trace 
% 2 (1 p.u. = 200 MW) and the reactive power (reference and measured values) on trace 3 (1 p.u. =200 Mvar); in station 2: the DC voltage 
% (reference and measured values) on trace 2 (1 p.u. =  200 kV). 
%
% At t = 1.5 s, a -0.1 p.u. step is first applied to the reference active power (decrease from 1 p.u.  to 0.9 pu). The power stabilizes in 
% approximately 0.3 seconds. Steps are also applied to the reference reactive power of the rectifier (from 0 to -0.1 p.u.) at t = 2.0 s and on 
% the reference DC voltage of the inverter (decrease from 1 p.u.  to 0.95 p.u.) at t = 2.5 s. Note the regulators dynamics and how they are more 
% or less mutually affected. The control design attempts to decouple the active and reactive power responses.    
%
% *AC side perturbations*
%
% Deactivate the steps applied on the three references by changing the multiplication factors to 100 in the Step times. In the "Three-Phase 
% Programmable Voltage Source" inside AC system 1 subsystem, change the Time variation setting to "Amplitude". Check that the source is now 
% programmed for a step of -0.1 p.u on voltage magnitude at t = 1.5 s, for a duration of 7 cycles. In the "Three-Phase Fault" block change to 
% 1 the multiplication factor in the Transition times. A 6 cycles three-phase fault will be applied at t = 2.1 s in station 2 PCC (Bus B2). 
% Restart the simulation. 
%
% After the AC voltage sag in station 1, the active and reactive power deviation from the pre-disturbance is less than 0.09 p.u. and 0.2 p.u. 
% respectively. The recovery time is less than 0.3 s and steady state is reached again. A second perturbation follows. During the severe 
% three-phase fault at station 2, the transmitted DC power is almost halted and the DC voltage tends to increase (1.2 p.u.) since the DC side 
% capacitance is being excessively charged. A special function (DC Voltage Control Override) in the Active Power Control (in station 1) attempts 
% to limit the DC voltage within a fixed range (see the controller mask). The system recovers well after the fault within 0.5 s. You can observe 
% overshoot in the active power (1.33 p.u. in station 1) and damped oscillations (around 10 Hz) in the reactive power.
%
% *Impact of the DC voltage balance control*
% 
% Open the VOLTAGE_BALANCE_CONTROL_STATION_2 scope. Finally, open the control dialog box in Station 2 and verify that the DC Voltage Balance box 
% is activated. The DC voltage balance control objective is to minimize the voltage unbalance (Udc_0_mean signal = sum of the positive and 
% negative pole voltages).  A way of producing an unbalance is to use unequal capacitance values in the positive and negative poles (for example, 
% Cp divided by 2). Observe the Udc_0_mean signal first with the DC balance control activated and then deactivated. Note that this function 
% response is relatively slow. 
%
%

%%

