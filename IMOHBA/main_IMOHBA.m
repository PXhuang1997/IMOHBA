function main_IMOHBA

clear;clc
%19 benchmark IMOPs
fname={'IZDT1';'IZDT2';'IZDT3';'IZDT4';'IZDT6';'IDTLZ1';'IDTLZ2';'IDTLZ3';'IDTLZ4';'IDTLZ5';'IDTLZ6';'IMMF1';'IMMF2';
    'IMMF3';'IMMF4';'IMMF5';'IMMF6';'IMMF7';'IMMF8'};
num=length(fname); % number of test function
for i=15:15
    name=fname{i,:};
    num_of_runs=20;          %number of run times
    pop=100;gen=400;         %Population size and Total number of generations
    for runs = 1:num_of_runs 
        fprintf('number of run times:%d\n',runs)
        [metric_IMOHBA,archive_IMOHBA]=IMOHBA(name,pop,gen,runs); 
        IMOHBA_metric(runs,1)=metric_IMOHBA;
        IMOHBA_archive(runs,1).dyIP=archive_IMOHBA;
    end
    %save the running results
    str = strcat(name,'_metric_IMOHBA','.mat');
    save(['data\',str],'IMOHBA_metric');
end
        
