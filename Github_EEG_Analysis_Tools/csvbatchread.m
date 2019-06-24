function [csvfile,Filename,nFile]=csvbatchread()
Allfile=dir(fullfile('*.csv'));        %读入目录下文件信息存储为结构体形式
StrAllfile=struct2cell(Allfile);  %将格式转为cell形式
Filename=StrAllfile(1,:);        %取出其中文件名单
[~,nFile]=size(Filename);   %计算文件个数
jcsv=0;             %csv文件数
for icsv=1:1:nFile
    if strfind(Filename{icsv},'.csv')   
        jcsv=jcsv+1;
        [csvfile{jcsv}]=xlsread(Filename{icsv}); 
    end
end
