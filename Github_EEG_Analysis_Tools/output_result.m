 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title:EEG_Power_and_Brainwaves 
 % Description:
 % Output result data as an excel sheet
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding
function output_result(result_mat,row_name,column_name,result_name)
result_cell=num2cell(result_mat);
Add_Row_name=[row_name;result_cell];
zSummary_result=[column_name,Add_Row_name]';
xlswrite(result_name,zSummary_result);
end