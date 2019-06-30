 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title: csvbatchread
 % Description :batch processing for quality control for EEG recording data
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

clear all
[csvfile,Filename,nFile]=csvbatchread(); %������ȡCSV�ļ�
start_row=3; %CSV�ļ��ĵ�1��Ϊ�Ե粨Ƶ�ʣ���2��Ϊ���ʵ�λ��V^2������3�п�ʼΪ����
Cal_min_Fre=0; %���ü������ͼʱ�Ե粨��Ƶ�ʷ�Χ
Cal_max_Fre=80;
plot_min_Fre=0;
plot_max_Fre=20;
for iFile=1:1:nFile
    EEG_Raw_Power=csvfile{iFile}(start_row:end,Cal_min_Fre+1:Cal_max_Fre+1); %�����Ե粨����Թ���
    Abs_Power{iFile}=mean(EEG_Raw_Power);
    Total_Power=sum(Abs_Power{iFile});
    Norm_Power{iFile}=100*Abs_Power{iFile}/Total_Power;
    EEG_plot_xdata=(plot_min_Fre:plot_max_Fre); %���Ե粨Ƶ��ͼ����CSV�ļ�������������
    EEG_plot_ydata=Norm_Power{iFile}(plot_min_Fre+1:plot_max_Fre+1);
    Figname=Filename{iFile}(1:end-4);
    EEG_batch_plot(EEG_plot_xdata,EEG_plot_ydata,Figname);
end
close all