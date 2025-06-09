function varargout = WindFarmType4AverageModelInit(varargin)
% Model initialization function of WindFarmType4AverageModel

% By default the functions loads the initial state vector xInitial to start
% the simulation in steady-state. This is done in the Model properties/
% Callbacks/ InitFcn section of the model. The vector is saved in a mat
% file.

% You can use this function to regenerate the initial state vector, after a
% change in the model, by typing:  WindFarmType4AverageModelInit(1) at the command line.
% Review the code below to make sure it still apply to your updated model.

load WindFarmType4AverageModel.mat 

if nargin==0 && nargout==1
    varargout{1} = xInitial;
end
    
% Regenerate initial state vector
if nargin==1
    
    % 1. The name of the model is:
    model = 'WindFarmType4AverageModel';
    disp(['Regenerate initial state vector of ',model,' model:'])
    
    % 2. Make sure the model is loaded in memory
    open_system(model);
    
    % 3. Deactivate programmed transients:
    disp('- Deactivate programmed transients...')
    block = [model,'/120 kV'];
    set_param(block,'VariationEntity','None');
    
    % 4. Estimated time to reach steady-state:
    StopTime = '5'; % time to reach steady-state
    
    % 5. Simulate to reach steady-state:
    disp('- Running the model to steady-state...')
    simout = sim(model,'LoadInitialState','off','SaveFinalState','on','StopTime',StopTime);
    
    % 6. Get the new initial state values:
    disp('- Get the new initial state vector...')
    xInitial = simout.get('xFinal');

    % 7. Save the initial state vector in mat file:
    save  WindFarmType4AverageModel.mat xInitial
    
    disp('- Closing the model...')
    close_system(model,0)
    
    disp('Done.')

end