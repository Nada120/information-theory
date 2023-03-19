function varargout = cycliccodeTask4(varargin)
% CYCLICCODETASK4 MATLAB code for cycliccodeTask4.fig
%      CYCLICCODETASK4, by itself, creates a new CYCLICCODETASK4 or raises the existing
%      singleton*.
%
%      H = CYCLICCODETASK4 returns the handle to a new CYCLICCODETASK4 or the handle to
%      the existing singleton*.
%
%      CYCLICCODETASK4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLICCODETASK4.M with the given input arguments.
%
%      CYCLICCODETASK4('Property','Value',...) creates a new CYCLICCODETASK4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cycliccodeTask4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cycliccodeTask4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cycliccodeTask4

% Last Modified by GUIDE v2.5 17-May-2022 21:08:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cycliccodeTask4_OpeningFcn, ...
                   'gui_OutputFcn',  @cycliccodeTask4_OutputFcn, ...
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


% --- Executes just before cycliccodeTask4 is made visible.
function cycliccodeTask4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cycliccodeTask4 (see VARARGIN)

% Choose default command line output for cycliccodeTask4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cycliccodeTask4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cycliccodeTask4_OutputFcn(hObject, eventdata, handles) 
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
if mod(u,2)==u
    k=length(u)
    %poly2sym fun is used to write polynomial equation of binary vector g[1 0 1 1] but write it in reverse order [1 1 0 1] to get the right equation
    gx=poly2sym(g)
    %find is used to get index of non zero elements in vector g which will be in ex:1 2 4
    polyPowers = find(g) - 1;
    paritybits=max(polyPowers);
    n=k+paritybits;
    
    v=zeros([1,paritybits])
    v=[v u] 
    
    syms x
    zx=x^n+1
    
    %sym2poly returns the numeric vector of coefficients of the symbolic polynomial 
    %when you use deconv function  parameters must be vestors"Binary"
    %fliplr Flip array left to right
    
    zxb=sym2poly(zx)
    [h,r]=deconv(zxb,g)
    h=mod(h,2)
    hx=poly2sym(h)
    hcoeff=fliplr(h)
    
    %index in matlab for vector start from 1 
    m=hcoeff(1:paritybits+1)
    x=length(v)
    y=length(u)
    for j=0:paritybits-1
        v(paritybits-j)=sum(m.*v(x:-1:y));
        v(paritybits-j)=mod(v(paritybits-j),2)
        x=x-1;
        y=y-1;
    end 
end
set(handles.res,'string',num2str(v))
