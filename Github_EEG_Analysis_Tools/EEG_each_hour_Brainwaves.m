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

[csvfile,Filename,nFile]=csvbatchread();%批量读取csv文件
resultname=strrep(Filename,'.csv','.xlsx');

start_row=3; %CSV文件的第1行为脑电波频率，第2行为功率单位（V^2），第3行开始为数据
Cal_min_Fre=0; %设置计算时脑电波的频率范围
Cal_max_Fre=80;
Brainwaves_Fre_start=[0,5,10,16,31];%设置不同类型脑电波的频率范围
Brainwaves_Fre_end=[4,9,15,30,80];
Unit_time=5;%设置csv文件中脑电波的单位时间
Hour_row_num=3600/Unit_time;

%生成result表格行列名
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
    %计算csv文件中脑电波记录的总时间，时间单位为小时，不足1小时按1小时计算
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
    %计算不同类型脑电波的绝对功率和相对功率
    [Abs_Brainwaves{iMouse},Norm_Brainwaves{iMouse}]=EEG_Brainwaves_Calculate(Each_hour_mean_Power{iMouse},Brainwaves_Fre_start,Brainwaves_Fre_end,nwave,nHour);    
end
%按不同类型的脑电波输出结果
row_name=num2cell(0:nHour-1);
for iwave=1:1:nwave
    for iMouse=1:1:nFile
        Brainwaves{iwave}(:,iMouse)=Abs_Brainwaves{iMouse}(:,iwave);
    end
    output_result(Brainwaves{iwave}',row_name,MouseID_summary,Brainwaves_name{iwave})
end
