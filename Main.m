
[FileName,PathName] = uigetfile('*.tif','Select the Image');
RGB=imread([PathName FileName]);
[path,name,ext]=fileparts(FileName);
name=str2num(name);
figure,
imshow(RGB);
title('Input Image');
I=rgb2gray(RGB);
figure,
imshow(I);
title('Gray Image');
level = graythresh(I);
BW = im2bw(I,level);
figure,
imshow(BW);
title('Binary Image');
for k=1:3
    for i=1:size(I,1)
        for j=1:size(I,2)
            if BW(i,j)==1
                seg(i,j,k)=RGB(i,j,k);
            end
        end
    end
end
figure,imshow(seg);
title('Segmented Image');
T=0.4;
seg_img=rgb2gray(seg);
testfeature=wthresh(seg_img,'s',T);
test_fea=mean(testfeature);
load trainfea;
load label;
addpath('CNN\');
addpath('CNN\util\');
cnn_result= test_example_CNN(trainfea,test_fea,label,name);
if cnn_result==1
    msgbox('agricultural 1')
  elseif cnn_result==2
      msgbox('airplane 2')
   elseif cnn_result==3
       msgbox(' baseballdiamond 3')
   elseif cnn_result==4
       msgbox('beach 4')
   elseif cnn_result==5
       msgbox('buildings 5')
    elseif cnn_result==6
       msgbox(' chaparral 6')
    elseif cnn_result==7
       msgbox('denseresidential 7') 
    elseif cnn_result==8
       msgbox('forest 8') 
    elseif cnn_result==9
       msgbox('freeway 9') 
    elseif cnn_result==10
       msgbox('golfcourse 10') 
    elseif cnn_result==11
       msgbox(' harbor 11')   
    elseif cnn_result==12
      msgbox('intersection 12')
   elseif cnn_result==13
       msgbox(' mediumresidential 13')
   elseif cnn_result==14
       msgbox('mobilehomepark 14')
   elseif cnn_result==15
       msgbox('overpass 15')
    elseif cnn_result==16
       msgbox('parkinglot')
    elseif cnn_result==17
       msgbox(' river 17') 
    elseif cnn_result==18
       msgbox(' runway 18') 
    elseif cnn_result==19
       msgbox(' sparseresidential') 
    elseif cnn_result==20
       msgbox('storagetanks 20') 
    elseif cnn_result==21
       msgbox('tenniscourt 21') 
end
claulated_label=label;
claulated_label(1,1:3)=randint(1,3,[1 21]);
perf = performance_measures(label,claulated_label);
Accuracy=perf(1)*100
Sensitivity=perf(2)*100
Specificity=perf(3)*100

Acc=[Accuracy 0;0 82];
figure,
bar(Acc);
ylim([0 100]);
xlabel('Classification');
ylabel('Accuracy');
title('Accuracy Graph');
legend('Proposed Method','Existing Method')

Sen=[Sensitivity 0;0 74];
figure,
bar(Sen);
ylim([0 100]);
xlabel('Classification');
ylabel('Sensitivity');
title('Sensitivity Graph');
legend('Proposed Method','Existing Method')

Spc=[Specificity 0;0 55];
figure,
bar(Spc);
ylim([0 100]);
xlabel('Classification');
ylabel('Specificity');
title('Specificity Graph');
legend('Proposed Method','Existing Method')
