function varargout = Eg_Hello(varargin)
% EG_HELLO MATLAB code for Eg_Hello.fig
%      EG_HELLO, by itself, creates a new EG_HELLO or raises the existing
%      singleton*.
%
%      H = EG_HELLO returns the handle to a new EG_HELLO or the handle to
%      the existing singleton*.
%
%      EG_HELLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EG_HELLO.M with the given input arguments.
%
%      EG_HELLO('Property','Value',...) creates a new EG_HELLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Eg_Hello_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Eg_Hello_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Eg_Hello

% Last Modified by GUIDE v2.5 02-Apr-2015 10:35:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Eg_Hello_OpeningFcn, ...
                   'gui_OutputFcn',  @Eg_Hello_OutputFcn, ...
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


% --- Executes just before Eg_Hello is made visible.
function Eg_Hello_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Eg_Hello (see VARARGIN)

% Choose default command line output for Eg_Hello
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Eg_Hello wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Eg_Hello_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in hello.
function hello_Callback(hObject, eventdata, handles)
% hObject    handle to hello (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Hello World!');
