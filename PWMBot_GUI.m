function varargout = PWMBot_GUI(varargin)
% PWMBOT_GUI MATLAB code for PWMBot_GUI.fig
%      PWMBOT_GUI, by itself, creates a new PWMBOT_GUI or raises the existing
%      singleton*.
%
%      H = PWMBOT_GUI returns the handle to a new PWMBOT_GUI or the handle to
%      the existing singleton*.
%
%      PWMBOT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PWMBOT_GUI.M with the given input arguments.
%
%      PWMBOT_GUI('Property','Value',...) creates a new PWMBOT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PWMBot_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PWMBot_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PWMBot_GUI

% Last Modified by GUIDE v2.5 28-Apr-2016 13:35:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PWMBot_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PWMBot_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PWMBot_GUI is made visible.
function PWMBot_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PWMBot_GUI (see VARARGIN)


a=imread('logoUPM.jpg');
axes(handles.logoUPM)
image(a)
axis off
b=imread('logoETSIDI.jpg');
axes(handles.logoETSIDI)
image(b)
axis off

% Choose default command line output for PWMBot_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PWMBot_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PWMBot_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in PortSelect.
function PortSelect_Callback(hObject, eventdata, handles)
% hObject    handle to PortSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PortSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PortSelect

global arduinoPort
contents = cellstr(get(hObject,'String'));
arduinoPort=contents{get(hObject,'Value')};
assignin ('base','arduinoPort',arduinoPort)



% --- Executes during object creation, after setting all properties.
function PortSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PortSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in chooseRadio.
function chooseRadio_Callback(hObject, eventdata, handles)
% hObject    handle to chooseRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chooseRadio contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chooseRadio

global radio
contents = cellstr(get(hObject,'String')); 
radio=str2double(contents{get(hObject,'Value')});

% --- Executes during object creation after setting all properties.
function chooseRadio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chooseRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a wh,ite background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in choosePolygon.
function choosePolygon_Callback(hObject, eventdata, handles)
% hObject    handle to choosePolygon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: contents = cellstr(get(hObject,'String')) returns choosePolygon contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choosePolygon
contents = cellstr(get(hObject,'String'));
polygon=contents{get(hObject,'Value')};
global numberOfSides;
switch polygon
    case 'Triángulo'
        numberOfSides=3;
    case 'Cuadrado'
        numberOfSides=4;
    case 'Pentágono'
        numberOfSides=5;
    case 'Hexágono'
        numberOfSides=6;
    case 'Heptágono'
        numberOfSides=7;
    case 'Octógono'
        numberOfSides=8;
    case 'Eneágono'
        numberOfSides=9;
    case 'Decágono'
        numberOfSides=10;
    case 'Endecágono'
        numberOfSides=11;
    case 'Dodecágono'
        numberOfSides=12;
    case 'Círculo'
        numberOfSides=30;
    otherwise
        numberOfSides=0;
end

% --- Executes during object creation, after setting all properties.
function choosePolygon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choosePolygon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PreviewButton.
function PreviewButton_Callback(hObject, eventdata, handles)
% hObject    handle to PreviewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PreviewButton

global radio numberOfSides
tita =[-pi/2:(2*pi/numberOfSides):2*pi-pi/2]; 
pos_x = radio*cos(tita);
pos_y = radio*sin(tita);

axes(handles.PreviewAxes)
plot(pos_x,pos_y,'-x')
axis equal
axis([-15 15 -10.5 10.5])

% --- Executes on button press in DrawButton.

function DrawButton_Callback(hObject, eventdata, handles)...
% hObject    handle to DrawButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DrawButton

global radio numberOfSides arduinoPort
[P1,P2,P3]=main(arduinoPort,radio,numberOfSides);
assignin ('base','P1',P1)
assignin ('base','P2',P2)
assignin ('base','P3',P3)
delete(instrfind({'Port'},{arduinoPort}))
openSimulink(arduinoPort)
% axes(handles.RealTimeAxes)
% plot(PosX,PosY,'-x')
% axis equal
% axis([-15 15 -10.5 10.5])



% --- Executes on button press in ZeroSearchButton.
function ZeroSearchButton_Callback(hObject, eventdata, handles)
% hObject    handle to ZeroSearchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ZeroSearchButton


% --- Executes on button press in ManuallyAdjustButton.
function ManuallyAdjustButton_Callback(hObject, eventdata, handles)
% hObject    handle to ManuallyAdjustButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ManuallyAdjustButton


% --- Executes on button press in PinoutButton.
function PinoutButton_Callback(hObject, eventdata, handles)
% hObject    handle to PinoutButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PinoutButton


% --- Executes on button press in StopDrawButton.
function StopDrawButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopDrawButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of StopDrawButton
set_param(gcs,'SimulationCommand','Stop');


% --- Executes during object creation, after setting all properties.
function ConnectionStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ConnectionStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
