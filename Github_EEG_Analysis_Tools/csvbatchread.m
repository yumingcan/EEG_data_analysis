 % Copyright: Copyright (c) 2019
 % All rights reserved
 % Created on 2019-6-24  
 % Author:Mingcan Yu in Chinese Academy of Sciences
 % Title: csvbatchread
 % Description :batch read csv file
 % Acknowledge:
 % NSFC provided funding to acquire EEG recording data
 % Junying Wang participated in discussion about data acquiring, analysis and coding

function [csvfile,Filename,nFile]=csvbatchread()
Allfile=dir(fullfile('*.csv'));        %����Ŀ¼���ļ���Ϣ�洢Ϊ�ṹ����ʽ
StrAllfile=struct2cell(Allfile);  %����ʽתΪcell��ʽ
Filename=StrAllfile(1,:);        %ȡ�������ļ�����
[~,nFile]=size(Filename);   %�����ļ�����
jcsv=0;             %�����ȡcsv�ļ�
for icsv=1:1:nFile
    if strfind(Filename{icsv},'.csv')   
        jcsv=jcsv+1;
        [csvfile{jcsv}]=xlsread(Filename{icsv}); 
    end
end
