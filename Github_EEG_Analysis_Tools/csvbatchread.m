function [csvfile,Filename,nFile]=csvbatchread()
Allfile=dir(fullfile('*.csv'));        %����Ŀ¼���ļ���Ϣ�洢Ϊ�ṹ����ʽ
StrAllfile=struct2cell(Allfile);  %����ʽתΪcell��ʽ
Filename=StrAllfile(1,:);        %ȡ�������ļ�����
[~,nFile]=size(Filename);   %�����ļ�����
jcsv=0;             %csv�ļ���
for icsv=1:1:nFile
    if strfind(Filename{icsv},'.csv')   
        jcsv=jcsv+1;
        [csvfile{jcsv}]=xlsread(Filename{icsv}); 
    end
end
