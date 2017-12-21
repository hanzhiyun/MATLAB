function varargout = fastcolonycounting(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fastcolonycounting_OpeningFcn, ...
                   'gui_OutputFcn',  @fastcolonycounting_OutputFcn, ...
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

function fastcolonycounting_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
ssize=get(0,'screensize');
set(hObject,'position',ssize);


function varargout = fastcolonycounting_OutputFcn(hObject, eventdata, handles) 
global level g_area;
level = 0.4;
%------set checkbox flags-------
global SE ;
SE = [1:9];
for k = 1:9
    SE(k)=1;
end
%--------------------------------
varargout{1} = handles.output;




function pushbutton_openimg_Callback(hObject, eventdata, handles)
global I I0;

%if  exist('./fig0.jpg', 'file') == 2
 %   I0=imread('./fig0.jpg');
%else 
    [FileName,PathName]=uigetfile('*.jpg;*.png','open image');
    I0=imread(strcat(PathName,FileName));
%end

I=I0;
imshow(I);


function pushbutton_getline_Callback(hObject, eventdata, handles)
global I I0
algorithm=get(handles.popupmenu2,'string');
n=get(handles.popupmenu2,'value');
if length(size(I)) == 3
    I=rgb2gray(I0);
end
I=edge(I,algorithm{n,:});
imshow(I);


function pushbutton3_Callback(hObject, eventdata, handles)
global I
I=~I;
imshow(I);


function pushbutton4_Callback(hObject, eventdata, handles)
global I
imshow(I);
[CX,CY,C]=improfile;
k=1;
Xk=round(CX(k));
Yk=round(CY(k));
C=I(Yk,Xk);
while k<length(CX)
    k=k+1;
    if abs(CX(k)-Xk)>0.5
      Xk=Xk+sign(CX(k)-  Xk);
      I(Yk,Xk)=C;
    end
    if abs(CY(k)-Yk)>0.5
      Yk=Yk+sign(CY(k)-Yk);
      I(Yk,Xk)=C;
    end
end
imshow(I);


function pushbutton5_Callback(hObject, eventdata, handles)
global I
I=imfill(I, 'holes');
imshow(I);



function pushbutton6_Callback(hObject, eventdata, handles)
global I
I=imfill(I);
imshow(I);
%imview(I), imview(I1)


function pushbutton7_Callback(hObject, eventdata, handles)
global I
SE=zeros(3);
for k=1:9
    SE(k)=get(findobj('Tag',strcat('checkbox',num2str(k))),'value');
end
I=imerode(I,SE);
imshow(I);


function pushbutton8_Callback(hObject, eventdata, handles)
global I
SE=zeros(3);
for k=1:9
    SE(k)=get(findobj('Tag',strcat('checkbox',num2str(k))),'value');
end
I=imdilate(I,SE);
imshow(I);


function pushbutton9_Callback(hObject, eventdata, handles)
global I I0
I=xor(I,I0);
%imshow(I);


function pushbutton10_Callback(hObject, eventdata, handles)
global I I_TEMP
I_TEMP=I;
imshow(I);


function pushbutton11_Callback(hObject, eventdata, handles)
global I I_TEMP I1
I1=I_TEMP;
I_TEMP=I;
I=I1;
imshow(I);


function pushbutton12_Callback(hObject, eventdata, handles)
global I I0 I_TEMP
a=size(I);
b=[a(1) a(2)];
I1=imresize(I0,b);
I=or(I,I_TEMP);
imshow (I);


function pushbutton13_Callback(hObject, eventdata, handles)
global I I0

if(length(size(I0))==3)
    IMG_R=I0(:,:,1);
    IMG_G=I0(:,:,2);
    IMG_B=I0(:,:,3);
    IMG_R=uint8(double(IMG_R).*~I);
    IMG_G=uint8(double(IMG_G).*~I);
    IMG_B=uint8(double(IMG_B).*~I);
    I=cat(3,IMG_R,IMG_G, IMG_B);
else
    I=uint8(double(I0).* ~I);
end
imshow(I);


%-------------------------------------------bw
function pushbutton14_Callback(hObject, eventdata, handles)
global I I0 level;
I = im2bw(I0,level);
imshow(I);


function popupmenu1_Callback(hObject, eventdata, handles)

global I I0;
n=get(findobj('Tag','popupmenu1'),'value');
d=length(size(I0));
if (d<3)
    n=1;
end
switch n
    case 1
        I=I0;
    case 2
        I=rgb2gray(I0);
    case 3
        I=I0(:,:,1);
    case 4
        I=I0(:,:,2);
    case 5
        I=I0(:,:,3);
end
imshow(I);

function popupmenu1_CreateFcn(hObject, eventdata, handles)



function popupmenu2_Callback(hObject, eventdata, handles)



function popupmenu2_CreateFcn(hObject, eventdata, handles)




function setRadioButton(handles)
global SE;
set(findobj('Tag','radiobutton_self'),'value',0);
flag = 1;
for k=1:9
    if SE(k)==0
        flag = 0;
    end
end
if flag==1
    set(findobj('Tag','radiobutton_8'),'value',1);
else
    set(findobj('Tag','radiobutton_8'),'value',0);
    if SE(2)==1 && SE(4)==1 && SE(6)==1 && SE(8)==1 && SE(1)==0 && SE(3)==0 && SE(7)==0 && SE(9)==0
        set(findobj('Tag','radiobutton_4'),'value',1);
    else 
        set(findobj('Tag','radiobutton_4'),'value',0);
        set(findobj('Tag','radiobutton_self'),'value',1);
    end 
   
end



function setSE(hObject,handles, position)
global SE;
if get(hObject,'value')==get(hObject,'Max')
    SE(position) = 1;
else
    SE(position) = 0;
end

function checkbox1_Callback(hObject, eventdata, handles)
setSE(hObject,handles,1)
setRadioButton(handles)


function checkbox2_Callback(hObject, eventdata, handles)
setSE(hObject,handles,2)
setRadioButton(handles)


function checkbox3_Callback(hObject, eventdata, handles)
setSE(hObject,handles,3)
setRadioButton(handles)


function checkbox4_Callback(hObject, eventdata, handles)
setSE(hObject,handles,4)
setRadioButton(handles)


function checkbox5_Callback(hObject, eventdata, handles)
setSE(hObject,handles,5)
setRadioButton(handles)


function checkbox6_Callback(hObject, eventdata, handles)
setSE(hObject,handles,6)
setRadioButton(handles)


function checkbox7_Callback(hObject, eventdata, handles)
setSE(hObject,handles,7)
setRadioButton(handles)


function checkbox8_Callback(hObject, eventdata, handles)
setSE(hObject,handles,8)
setRadioButton(handles)


function checkbox9_Callback(hObject, eventdata, handles)
setSE(hObject,handles,9)
setRadioButton(handles)


function setCheckbox(se)
global SE;
SE = se;
for k = 1:9
    set(findobj('Tag',strcat('checkbox', num2str(k))), 'value', SE(k));
end

% --------------------------------------------------------------------
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
switch get(hObject,'Tag')
    case 'radiobutton_4'
        SE = [0 1 0,1 1 1 ,0 1 0]
        setCheckbox(SE);
        
    case 'radiobutton_8'
        SE=[1 1 1,1 1 1 ,1 1 1]
        setCheckbox(SE);
end
        





function edit_thresh_Callback(hObject, eventdata, handles)
global level I0;
strVal = get(hObject,'String');
strVal
if strcmp(strVal,'auto')==1
    level = graythresh(I0);
    level
else 
    level = str2double(strVal)/255;
    level
end


    

function edit_thresh_CreateFcn(hObject, eventdata, handles)

if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




function pushbutton16_Callback(hObject, eventdata, handles)

global I
b=str2num(get(findobj('tag','edit4'),'string'));
N=bweuler(I,4);
set(findobj('Tag','edit5'),'String',num2str(N));
A=b*bwarea(I);
set(findobj('Tag','edit6'),'String',num2str(A));
a=A/N;
set(findobj('Tag','edit7'),'String',num2str(a));



function pushbutton17_Callback(hObject, eventdata, handles)
global I  l
L=str2num(get(findobj('Tag','edit2'),'string'));
[x,y]=getline;
l=L/sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)
set(findobj('Tag','edit3'),'string',num2str(l));
set(findobj('Tag','edit4'),'string',num2str(l*l));


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
set(handles.listbox1, 'value',1);
global I g_area;
BW=I;
[L, num]=bwlabel(BW,4); 
STATS=regionprops(L, 'Area');
areas = {};


[x,y,color] = impixel;
points = [x y];
j = 1;
for i = 1:size(points)
    if L(points(i,2), points(i,1)) > 0
        pos_num(j) = L(points(i,2), points(i,1));
        j = j+1;
    end
end
pos_num = sort(pos_num);

for i = 1: size(points)
    area(i,1)=STATS(pos_num(i)).Area;
    area(i,2) = pos_num(i);
end
g_area = area;
sort_all(area, handles);




function pushbutton23_Callback(hObject, eventdata, handles)
area = get_area();
sort_all(area, handles);


% ---- sort area function -------------------
function area =  get_area()
global I g_area;
BW=I;
[L, num]=bwlabel(BW,4); 
STATS=regionprops(L, 'Area');
areas={};
for i = 1:num
    area(i,1) = STATS(i).Area;
    area(i,2) = i;
end
g_area = area;



%%------------------------------------------------
function sort_all(area, handles)
global g_area;
area_orig = area;
num = length(area);
sort_method = get(handles.pop_sort, 'value');
IX=[];
area = area_orig;
s_t = size(area);
SIZE = s_t(1);
switch sort_method
    case 1 % default sort by number
        for i = 1:SIZE
            IX(i,1) = i;
            IX(i,2) = i;
            set(handles.text12, 'String', get(handles.text_fu, 'String'));
        end
    case 2 % sort up
        [area,IX]= sort(area,1,'ascend');
        set(handles.text12, 'String', get(handles.text_fu, 'String'));
    case 3 % sort down
        [area,IX]= sort(area,1,'descend');
        set(handles.text12, 'String', get(handles.text_zheng, 'String'));
end

areas = {};
for i=1:SIZE
      d = sprintf('% 10.2f',sqrt(area(i,1)/pi));
      sum = 0;
      for j=1:i-1
          sum = sum + area(j,1);
      end
      areas{end+1} = strcat(sprintf('%3d',g_area(IX(i,1),2) ),sprintf('%8d',area(i,1)),d, sprintf('%8d',sum));
      %areas{end+1} = strcat(sprintf('%3d',g_area(IX(i,1),2) ));
end ;
set(handles.listbox1,'string',areas);




function edit9_Callback(hObject, eventdata, handles)




function edit10_Callback(hObject, eventdata, handles)


function edit10_CreateFcn(hObject, eventdata, handles)


function edit11_Callback(hObject, eventdata, handles)


function edit11_CreateFcn(hObject, eventdata, handles)



function listbox1_Callback(hObject, eventdata, handles)


function listbox1_CreateFcn(hObject, eventdata, handles)
set(hObject,'BackgroundColor',[0.157 0.157 0.157]);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a
%        double


function edit12_CreateFcn(hObject, eventdata, handles)
set(hObject,'BackgroundColor',[0.157 0.157 0.157]);





function pushbutton24_Callback(hObject, eventdata, handles)
list_string = get(handles.listbox1,'string');
data=str2num(char(list_string));
d=str2num(get(handles.edit11,'string'));
[n,m]=size(data);
t=data(1:n,3);
Y=data(1:n,4);

b=polyfit(t,Y,d-1);
tt=min(t):(max(t)-min(t))/100:max(t)';
YY = polyval(b, tt);
Yc = polyval(b, t);
residual = Y - Yc;
resnorm = sum(residual.^2);
plot(t,Y,'og',tt,YY,'b');

set(handles.edit12, 'String', num2str(b'));
set(findobj('Tag','edit9'),'String',num2str(resnorm));
set(findobj('Tag','edit10'),'String',num2str(max(abs(residual))));
set(handles.axes1,'YColor','white');
set(handles.axes1,'XColor','white');
set(handles.axes1,'Color',[0.157 0.157 0.157]);




% sort
function pop_sort_Callback(hObject, eventdata, handles)
global g_area;
sort_all(g_area,handles);


function pop_sort_CreateFcn(hObject, eventdata, handles)



function menu_exit_Callback(hObject, eventdata, handles)
result=questdlg('Do you want to quit this program?','quit this program?','Yes','No','Cancel');
if strcmp(char(result), 'Yes') == 1
    delete(hObject);
end




% --- Executes on button press in pushbutton_save_img.
function pushbutton_save_img_Callback(hObject, eventdata, handles)
global I;
[FileName,PathName, fi]=uiputfile('*.jpg;*.png','save image')
class(FileName)
if FileName == 0
    return
end
filePath = strcat(PathName,FileName);
if length(findstr(filePath, '.')) == 0
    filePath = strcat(filePath, '.jpg');
end
imwrite(I,filePath);
msgbox(['sava image success!     path = ',filePath]);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function figure1_CloseRequestFcn(hObject, eventdata, handles)
result=questdlg('Do you want to quite this program?','quit this program?','Yes','No','Cancel');
if strcmp(char(result), 'Yes') == 1
    delete(hObject);
end





% --------------------------------------------------------------------
function menu_onkey_Callback(hObject, eventdata, handles)
global I0 I
I = I0;
fastcolonycounting('pushbutton_getline_Callback',gcbo,[],guidata(gcbo));
fastcolonycounting('pushbutton5_Callback',gcbo,[],guidata(gcbo));
fastcolonycounting('pushbutton7_Callback',gcbo,[],guidata(gcbo));
fastcolonycounting('pushbutton16_Callback',gcbo,[],guidata(gcbo));
set(handles.pop_sort,'value', 2);
fastcolonycounting('pushbutton23_Callback',gcbo,[],guidata(gcbo));
fastcolonycounting('pushbutton10_Callback',gcbo,[],guidata(gcbo));
fastcolonycounting('pushbutton24_Callback',gcbo,[],guidata(gcbo));





% --- Executes during object creation, after setting all properties.
function pushbutton22_CreateFcn(hObject, eventdata, handles)
set(hObject,'BackgroundColor',[0.173 0.243 0.333]);




% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)


function Untitled_23_Callback(hObject, eventdata, handles)




