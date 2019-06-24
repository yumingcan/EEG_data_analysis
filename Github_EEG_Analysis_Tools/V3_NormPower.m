clear
[csvfile,Filename,nFile]=csvbatchread();
for iFile=1:1:nFile
    Power=csvfile{iFile}(3:end,1:81);
    Ave_Power{iFile}=mean(Power);
    ResultFilename{iFile}=strcat(Filename{iFile}(1:end-4),'80Hz_AbsPower.xlsx');
    xlswrite(ResultFilename{iFile},Ave_Power{iFile});
    total_power=sum(Ave_Power{iFile});
    Norm_Power{iFile}=100*Ave_Power{iFile}/total_power;
    EEG_plot_xdata=(0:19);
    EEG_plot_ydata=Norm_Power{iFile}(1:20);
    Figname=Filename{iFile}(1:end-4);
    EEG_batch_plot(EEG_plot_xdata,EEG_plot_ydata,Figname);
    ResultFilename{iFile}=strcat(Filename{iFile}(1:end-4),'80Hz_NormPower.xlsx');
    xlswrite(ResultFilename{iFile},Norm_Power{iFile});
%     theta_power=Ave_Power(6:10);
%     low_gamma_power=Ave_Power(31:49);
%     high_gamma_power=Ave_Power(53:81);
%     gamma_power=[low_gamma_power,high_gamma_power];
%     theta_total{iFile}=sum(theta_power)/sum(total_power);
%     theta_gamma{iFile}=sum(theta_power)/sum(gamma_power);    
   delta{iFile}=sum(Ave_Power{iFile}(1:5));
   theta{iFile}=sum(Ave_Power{iFile}(6:10));
   alpha{iFile}=sum(Ave_Power{iFile}(11:16));
   beta{iFile}=sum(Ave_Power{iFile}(17:31));
   gamma{iFile}=sum(Ave_Power{iFile}(32:81));
end
% Norm_Power_mat=cell2mat(Norm_Power);
% Norm_Power_mat_result=reshape(Norm_Power_mat,[512,nFile])';
% xlswrite(Resultname,Norm_Power_mat_result);

% Ave_Power_mat=cell2mat(Ave_Power);
% Ave_Power_mat_result=reshape(Ave_Power_mat,[512,nFile])';
% xlswrite(Resultname,Ave_Power_mat_result);
% close all
