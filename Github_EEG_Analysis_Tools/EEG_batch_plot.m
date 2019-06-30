 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title:EEG_batch_plot 
 % Description :batch plot EEG power sepctrum
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

 function EEG_batch_plot(EEG_plot_xdata,EEG_plot_ydata,Figname,yname)    
    EEG_plot=figure();
    plot(EEG_plot_xdata,EEG_plot_ydata,'-',EEG_plot_xdata,EEG_plot_ydata,'*r');
    xlabel('Frequency(Hz)');
    ylabel('Norm.Power(%)');
    saveas(EEG_plot,Figname);