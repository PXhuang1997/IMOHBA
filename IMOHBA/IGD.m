%Interval inverse generation distance (IIGD) involves 
% measuring the distance between the known Pareto front (pknow) and the true 
% Pareto front (ptrue). This distance represents the convergence and distribution of pknow.

%********calculate the true Pareto front values for function f2***********%
%             Ht=1.25+0.75*sin(0.5*pi*environment_t(tt));
%             f1=[0:0.01:1]';
%             f2=1-f1.^Ht;
%             Ture_fitness=[f1,f2];
%********end*******************%
function IGD_mean=IGD(name,chromosome,nObj,nVar)
%name is the name of the test function, t the environment variable, 
% D the dimension of the independent variable, and 
% a,b the upper and lower bounds of the variable.
%% Calculation of the true front surface
if nObj==4
    pknow(:,1)=0.5*(chromosome(:,nVar+1)+chromosome(:,nVar+2));
    pknow(:,2)=0.5*(chromosome(:,nVar+3)+chromosome(:,nVar+4));
elseif nObj==6
    pknow(:,1)=0.5*(chromosome(:,nVar+1)+chromosome(:,nVar+2));
    pknow(:,2)=0.5*(chromosome(:,nVar+3)+chromosome(:,nVar+4));
    pknow(:,3)=0.5*(chromosome(:,nVar+5)+chromosome(:,nVar+6));
end
ptru=ptrue(name,nVar);
%% Calculate IIGD
for i=1:size(ptru,1)
    for j=1:size(pknow,1)
        dist_temp(j)=norm((ptru(i,:)-pknow(j,:)),2);
    end
    dist(i)=min(dist_temp);
end
IGD_mean=mean(dist);
