clear
[csvfile,Filename,nFile]=csvbatchread();
resultname=strrep(Filename,'.csv','.xlsx');
for icsv=1:1:nFile
    rawdata=csvfile{1,icsv}(3:end,9);
    [m,n]=size(rawdata);
    for ieachHour=1:1:fix(m/720)
    eachhourdata=rawdata(720*(ieachHour-1)+1:720*ieachHour,:);  
    ave{ieachHour,1}=mean(eachhourdata,1);
    end
%     if ieachHour==23
%         eachhourdata=rawdata(720*23+1:end,:);
%         ave{24,1}=mean(eachhourdata,1);
%     end
%   result{1,icsv}=[(0:80);cell2mat(ave)];
    result{1,icsv}=cell2mat(ave);
    xlswrite(resultname{1,icsv},result{1,icsv});
%     delta{1,icsv}=result{1,icsv}(:,1:5);
%     theta{1,icsv}=result{1,icsv}(:,6:10);
%     alpha{1,icsv}=result{1,icsv}(:,11:16);
%     beta{1,icsv}=result{1,icsv}(:,17:31);
%     gamma{1,icsv}=result{1,icsv}(:,32:81);
%     
%     matdelta=cell2mat(delta);
%     mattheta=cell2mat(theta);
%     matalpha=cell2mat(alpha);
%     matbeta=cell2mat(beta);
%     matgamma=cell2mat(gamma);
%     
%     sumdelta{1,icsv}=sum(matdelta,2);
%     sumtheta{1,icsv}=sum(mattheta,2);
%     sumalpha{1,icsv}=sum(matalpha,2);
%     sumbeta{1,icsv}=sum(matbeta,2);
%     sumgamma{1,icsv}=sum(matgamma,2);
        
end
% outputdelta=cell2mat(sumdelta);
% outputtheta=cell2mat(sumtheta);
% outputalpha=cell2mat(sumalpha);
% outputbeta=cell2mat(sumbeta);
% outputgamma=cell2mat(sumgamma);
% 
% xlswrite('WTdelta.xlsx',outputdelta);
% xlswrite('WTtheta.xlsx',outputtheta);
% xlswrite('WTalpha.xlsx',outputalpha);
% xlswrite('WTbeta.xlsx',outputbeta);
% xlswrite('WTgamma.xlsx',outputgamma);
