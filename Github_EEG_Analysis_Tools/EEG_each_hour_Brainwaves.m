 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title:EEG_Power_and_Brainwaves 
 % Description:
 % Analysis for the per hour change of kinds of brainwaves power 
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding
clear all

[csvfile,Filename,nFile]=csvbatchread();%������ȡcsv�ļ�
resultname=strrep(Filename,'.csv','.xlsx');

start_row=3; %CSV�ļ��ĵ�1��Ϊ�Ե粨Ƶ�ʣ���2��Ϊ���ʵ�λ��V^2������3�п�ʼΪ����
Cal_min_Fre=0; %���ü���ʱ�Ե粨��Ƶ�ʷ�Χ
Cal_max_Fre=80;
Brainwaves_Fre_start=[0,5,10,16,31];%���ò�ͬ�����Ե粨��Ƶ�ʷ�Χ
Brainwaves_Fre_end=[4,9,15,30,80];
Unit_time=5;%����csv�ļ����Ե粨�ĵ�λʱ��
Hour_row_num=3600/Unit_time;

%����result���������
for iFile=1:1:nFile
MouseID{iFile}=Filename{iFile}(1:end-4);
end
MouseID_cell=num2cell(MouseID);
MouseID_summary=['Zeitgeber Time',MouseID]';
Brainwaves_name={'delta.xlsx','theta.xlsx','alpha.xlsx','beta.xlsx','gamma.xlsx'};
nwave=length(Brainwaves_name);

for iMouse=1:1:nFile
    EEG_Raw_Power=[];
    EEG_Raw_Power=csvfile{1,iMouse}(start_row:end,Cal_min_Fre+1:Cal_max_Fre+1);
    %����csv�ļ����Ե粨��¼����ʱ�䣬ʱ�䵥λΪСʱ������1Сʱ��1Сʱ����
    [Total_row_num,~]=size(EEG_Raw_Power);
    if Total_row_num/Hour_row_num==fix(Total_row_num/Hour_row_num)
       nHour=Total_row_num/Hour_row_num;
    else
       nHour=fix(Total_row_num/Hour_row_num)+1;
    end
    for iHour=1:1:fix(Total_row_num/Hour_row_num)
        Each_hour_mean_Power{iMouse}(iHour,:)=mean(EEG_Raw_Power(Hour_row_num*(iHour-1)+1:Hour_row_num*iHour,:),1);
    end
        if iHour==nHour-1
            Each_hour_mean_Power{iMouse}(nHour,:)=mean(EEG_Raw_Power(Hour_row_num*(nHour-1)+1:end,:),1);
        end
    %���㲻ͬ�����Ե粨�ľ��Թ��ʺ���Թ���
    [Abs_Brainwaves{iMouse},Norm_Brainwaves{iMouse}]=EEG_Brainwaves_Calculate(Each_hour_mean_Power{iMouse},Brainwaves_Fre_start,Brainwaves_Fre_end,nwave,nHour);    
end
%����ͬ���͵��Ե粨������
row_name=num2cell(0:nHour-1);
for iwave=1:1:nwave
    for iMouse=1:1:nFile
        Brainwaves{iwave}(:,iMouse)=Abs_Brainwaves{iMouse}(:,iwave);
    end
    output_result(Brainwaves{iwave}',row_name,MouseID_summary,Brainwaves_name{iwave})
end
