 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title: EEG_Power_Calculate
 % Description :batch caculate kinds of brainwaves absolute and normal power
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

function [Abs_Brainwaves,Norm_Brainwaves]=EEG_Brainwaves_Calculate(Abs_Power,Fre_start,Fre_end,nwave,nRow)
for iwave=1:1:nwave
Abs_Brainwaves(:,iwave)=sum(Abs_Power(:,Fre_start(iwave)+1:Fre_end(iwave)+1),2);
end
Total_Brainwaves=sum(Abs_Brainwaves,2);
for iRow=1:1:nRow
Norm_Brainwaves(iRow,:)=100*Abs_Brainwaves(iRow,:)/Total_Brainwaves(iRow);
end