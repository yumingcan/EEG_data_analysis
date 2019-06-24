function EEG_batch_plot(EEG_plot_xdata,EEG_plot_ydata,Figname,yname)    
    EEG_plot=figure();
    plot(EEG_plot_xdata,EEG_plot_ydata,'-',EEG_plot_xdata,EEG_plot_ydata,'*r');
    xlabel('Frequency(Hz)');
    ylabel('Norm.Power(%)');
    saveas(EEG_plot,Figname);