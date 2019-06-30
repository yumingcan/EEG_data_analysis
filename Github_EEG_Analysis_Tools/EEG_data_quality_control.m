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
[csvfile,Filename,nFile]=csvbatchread(); %批量读取CSV文件
start_row=3; %CSV文件的第1行为脑电波频率，第2行为功率单位（V^2），第3行开始为数据
Cal_min_Fre=0; %设置计算和作图时脑电波的频率范围
Cal_max_Fre=80;
plot_min_Fre=0;
plot_max_Fre=20;
for iFile=1:1:nFile
    EEG_Raw_Power=csvfile{iFile}(start_row:end,Cal_min_Fre+1:Cal_max_Fre+1); %计算脑电波的相对功率
    Abs_Power{iFile}=mean(EEG_Raw_Power);
    Total_Power=sum(Abs_Power{iFile});
    Norm_Power{iFile}=100*Abs_Power{iFile}/Total_Power;
    EEG_plot_xdata=(plot_min_Fre:plot_max_Fre); %作脑电波频谱图，以CSV文件名命名并保存
    EEG_plot_ydata=Norm_Power{iFile}(plot_min_Fre+1:plot_max_Fre+1);
    Figname=Filename{iFile}(1:end-4);
    EEG_batch_plot(EEG_plot_xdata,EEG_plot_ydata,Figname);
end
close all