function varargout = cycliccodeTask3(varargin)
% CYCLICCODETASK3 MATLAB code for cycliccodeTask3.fig
%      CYCLICCODETASK3, by itself, creates a new CYCLICCODETASK3 or raises the existing
%      singleton*.
%
%      H = CYCLICCODETASK3 returns the handle to a new CYCLICCODETASK3 or the handle to
%      the existing singleton*.
%
%      CYCLICCODETASK3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLICCODETASK3.M with the given input arguments.
%
%      CYCLICCODETASK3('Property','Value',...) creates a new CYCLICCODETASK3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cycliccodeTask3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cycliccodeTask3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cycliccodeTask3

% Last Modified by GUIDE v2.5 17-May-2022 21:05:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cycliccodeTask3_OpeningFcn, ...
                   'gui_OutputFcn',  @cycliccodeTask3_OutputFcn, ...
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


% --- Executes just before cycliccodeTask3 is made visible.
function cycliccodeTask3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cycliccodeTask3 (see VARARGIN)

% Choose default command line output for cycliccodeTask3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cycliccodeTask3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cycliccodeTask3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g as text
%        str2double(get(hObject,'String')) returns contents of g as a double


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u as text
%        str2double(get(hObject,'String')) returns contents of u as a double


% --- Executes during object creation, after setting all properties.
function u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = str2num(get(handles.g,'string'))
u = str2num(get(handles.u,'string'))
    k=length(u)
    %poly2sym fun is used to write polynomial equation of binary vector g[1 0 1 1] but write it in reverse order [1 1 0 1] to get the right equation, Message [1 1 0 1]->[1 0 1 1]
    
    gx=poly2sym(g)
    ux=poly2sym(u)
    
    %find is used to get index of non zero elements in vector g which will be in ex:1 2 4
    polyPowers = find(g) - 1
    paritybits=max(polyPowers)
    n=k+paritybits
    
    %syms Create symbolic variables, expressions, functions, matrices
    %expand multiplies all parentheses in inputs
    syms x
    power=x^paritybits
    delta_ux=expand(ux*power)
    
    %sym2poly returns the numeric vector of coefficients of the symbolic polynomial 
    delta_uxb=sym2poly(delta_ux)

    [Result,b]=deconv(delta_uxb,g)
    rx=poly2sym(mod(Result,2))
    bx=poly2sym(mod(b,2))
    v=fliplr(sym2poly(bx+delta_ux))
     
    if length(v)< n
        v(n)=0; 
    end
    set(handles.res,'string',num2str(v))
