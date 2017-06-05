function[]=openSimulink(arduinoPort)
delete(instrfind({'Port'},{arduinoPort}))
find_system('Name','SIMU')
open_system('SIMU')
set_param(gcs,'SimulationCommand','Start')
% get_param(bdroot,'OUT1') 
end