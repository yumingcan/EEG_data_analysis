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

start_row=3; %CSV�ļ��ĵ�1��Ϊ�Ե粨Ƶ�ʣ���2��Ϊ���ʵ�λ��V^2������3�п�ʼΪ����
Cal_min_Fre=0; %�����������Ե粨��Ƶ�ʷ�Χ
Cal_max_Fre=80;
Brainwaves_Fre_start=[0,5,10,16,31];%���ò�ͬ�����Ե粨��Ƶ�ʷ�Χ
Brainwaves_Fre_end=[4,9,15,30,80];

[csvfile,Filename,nFile]=csvbatchread();%������ȡcsv�ļ�

%����result���������
for iFile=1:1:nFile
MouseID{iFile}=Filename{iFile}(1:end-4);
end
MouseID_cell=num2cell(MouseID);
column_name=['Frequency(Hz)',MouseID]';
Frequency=num2cell(Cal_min_Fre:Cal_max_Fre);
Brainwaves_name={'delta','theta','alpha','beta','gamma'};
nwave=length(Brainwaves_name);

%�����Ե粨�ľ��Թ��ʺ���Թ���
[Abs_Power,Norm_Power]=EEG_Power_Calculate(csvfile,nFile,start_row,Cal_min_Fre,Cal_max_Fre);

%���㲻ͬ�����Ե粨�ľ��Թ��ʺ���Թ���
[Abs_Brainwaves,Norm_Brainwaves]=EEG_Brainwaves_Calculate(Abs_Power,Brainwaves_Fre_start,Brainwaves_Fre_end,nwave,nFile);

%���result���
output_result(Abs_Power,Frequency,column_name,'Abs_Power.xlsx');
output_result(Norm_Power,Frequency,column_name,'Norm_Power.xlsx');
output_result(Abs_Brainwaves,Brainwaves_name,column_name,'Abs_Brainwaves.xlsx');
output_result(Norm_Brainwaves,Brainwaves_name,column_name,'Norm_Brainwaves.xlsx');


