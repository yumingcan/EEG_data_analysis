 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title: EEG_Power_Calculate
 % Description :batch caculate EEG absolute and normal power spectrum
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

function [Abs_Power,Norm_Power]=EEG_Power_Calculate(csvfile,nFile,start_row,Cal_min_Fre,Cal_max_Fre)
    for iFile=1:1:nFile
        EEG_Raw_Power=csvfile{1,iFile}(start_row:end,Cal_min_Fre+1:Cal_max_Fre+1); 
        Abs_Power(iFile,:)=mean(EEG_Raw_Power);%计算脑电波的绝对功率
        Total_Power=sum(Abs_Power(iFile,:));
        Norm_Power(iFile,:)=100*Abs_Power(iFile,:)/Total_Power;%计算脑电波的相对功率
    end

