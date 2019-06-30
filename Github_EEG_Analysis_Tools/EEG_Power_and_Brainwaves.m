 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title:EEG_Power_and_Brainwaves 
 % Description:
 % batch caculate EEG absolute and normal power spectrum,
 % kinds of brainwaves absolute and normal power
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

clear all

start_row=3; %CSV文件的第1行为脑电波频率，第2行为功率单位（V^2），第3行开始为数据
Cal_min_Fre=0; %设置需计算的脑电波的频率范围
Cal_max_Fre=80;
Brainwaves_Fre_start=[0,5,10,16,31];%设置不同类型脑电波的频率范围
Brainwaves_Fre_end=[4,9,15,30,80];

[csvfile,Filename,nFile]=csvbatchread();%批量读取csv文件

%生成result表格行列名
for iFile=1:1:nFile
MouseID{iFile}=Filename{iFile}(1:end-4);
end
MouseID_cell=num2cell(MouseID);
column_name=['Frequency(Hz)',MouseID]';
Frequency=num2cell(Cal_min_Fre:Cal_max_Fre);
Brainwaves_name={'delta','theta','alpha','beta','gamma'};
nwave=length(Brainwaves_name);

%计算脑电波的绝对功率和相对功率
[Abs_Power,Norm_Power]=EEG_Power_Calculate(csvfile,nFile,start_row,Cal_min_Fre,Cal_max_Fre);

%计算不同类型脑电波的绝对功率和相对功率
[Abs_Brainwaves,Norm_Brainwaves]=EEG_Brainwaves_Calculate(Abs_Power,Brainwaves_Fre_start,Brainwaves_Fre_end,nwave,nFile);

%输出result表格
output_result(Abs_Power,Frequency,column_name,'Abs_Power.xlsx');
output_result(Norm_Power,Frequency,column_name,'Norm_Power.xlsx');
output_result(Abs_Brainwaves,Brainwaves_name,column_name,'Abs_Brainwaves.xlsx');
output_result(Norm_Brainwaves,Brainwaves_name,column_name,'Norm_Brainwaves.xlsx');


