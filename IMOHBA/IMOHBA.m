function [indices,archive]=IMOHBA(name,pop,gen,runs) 
%IMOHBA for solving benchmark IMOPs 

% pop - Population size   
% gen - Total number of generations 
% Make sure pop and gen are integers 
pop = round(pop);
gen = round(gen);
%Getting information about the test function
[nVar,nObj,xbounds,ybounds]= objective_description_function(name); 
M=nObj;
V=nVar;
min_range=xbounds(:,1);
max_range=xbounds(:,2);
%% Initialize the population
chromosome = initialize_variables(name,pop, nObj, nVar, min_range, max_range);
tic;
chromosome = initialize_variables(name,pop, nObj, nVar, min_range, max_range);
fprintf(2,name),fprintf(2,'_number of iterations:'),fprintf(2,'%d\n',runs)
%% Sort the initialized population
chromosome = u_non_domination_sort_mod2(chromosome, nObj, nVar);            
%% Start the process 
for i = 1 : gen
    % pool - size of the mating pool. 
    % tour - Tournament size.
    pool = round(pop/2);
    tour = 2;
    % Selection process 
    parent_chromosome = tournament_selection(chromosome, pool, tour);
    mu = 20;% The distribution indeices for crossover and mutation operators as mu = 20
    mum = 20;% and mum = 20 respectively.
    offspring_chromosome =...
        genetic_operator2(name,parent_chromosome,nObj, nVar, mu, mum, min_range, max_range);
    % Intermediate population
    [main_pop,temp] = size(chromosome);
    [offspring_pop,temp] = size(offspring_chromosome);
    % temp is a dummy variable.
    clear temp
    % intermediate_chromosome is a concatenation of current population and
    % the offspring population.
    intermediate_chromosome(1:main_pop,:) = chromosome;
    intermediate_chromosome(main_pop + 1 : main_pop + offspring_pop,1 : M+V) = ...
        offspring_chromosome;
    % Non-domination-sort of intermediate population 
    intermediate_chromosome = ...
        u_non_domination_sort_mod2(intermediate_chromosome, M, V);        
    chromosome = replace_chromosome(intermediate_chromosome, nObj, nVar, pop);
    temp_i=i;
    beta    = 6;     % HBA parameter
    C       = 2;     % HBA parameter
    vec_flag=[1,-1];
    N=pop;
    dim=nVar;
    %1.Select an optimal individual with the largest crowding distance
    Food_position=chromosome(1,1:nVar);
    X=chromosome(:,1:nVar);
    alpha=C*exp(-i/gen);   %density factor 
    I=Intensity(N,Food_position,X); %intensity 
    %2.Updating individuals with the honey badger algorithm
    for i=1:N
        r =rand();
        F=vec_flag(floor(2*rand()+1));
        for j=1:1:dim
            di=((Food_position(j)-X(i,j)));
            if r<.5
                r3=rand; r4=rand; r5=rand;
                Xnew(i,j)=Food_position(j) +F*beta*I(i)* Food_position(j)+F*r3*alpha*(di)*abs(cos(2*pi*r4)*(1-cos(2*pi*r5)));
            else
                r7=rand;
                Xnew(i,j)=Food_position(j)+F*r7*alpha*di;
            end
        end
        ub=max_range';
        lb=min_range'; 
        % Check the boundary and calculate the fitness
        Flag4ub=Xnew(i,:)>ub;
        Flag4lb=Xnew(i,:)<lb;
        Xnew(i,:)=(Xnew(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        X(i,:)=Xnew(i,:);
        myChromosome(i,1:nVar)=X(i,:);
        myChromosome(i,V+1:M+V)=evaluate_objective(name,myChromosome(i,1:nVar),nObj,nVar);
    end
    %3.previous individuals are mixed together and the optimal individual is selected using non-dominated sorting
    [main_pop,temp]=size(chromosome);
    [my_pop,temp]=size(myChromosome);
    clear temp
    myIntermediate_chromosome(1:main_pop,:)=chromosome;
    myIntermediate_chromosome(main_pop+1:main_pop+my_pop,1:M+V)=myChromosome;
    myIntermediate_chromosome=u_non_domination_sort_mod2(myIntermediate_chromosome,M,V);   
    chromosome=replace_chromosome(myIntermediate_chromosome,nObj,nVar,pop);
    if ~mod(temp_i,100)
        fprintf('%d generations completed\n',temp_i);
    end
end
toc
chromosome=chromosome(1:max(find(chromosome(:,nVar+nObj+1)==1)),:);
archive.xy=chromosome;
%*******************Calculation of performance indicators***************
indices.time=toc ;
indices.sp=spp(chromosome,nObj, nVar); %SPP
indices.yz=yanzhan(chromosome, nObj, nVar); % Spread
indices.igd=IGD(name,chromosome,nObj,nVar); %IGD
if nObj==4  %bi-objective
    hv=[];
    nrOfSamples=10000;
    points=[];
    points(:,1)=chromosome(:,nVar+1);
    points(:,2)=chromosome(:,nVar+3);
    hv(1) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    points(:,1)=chromosome(:,nVar+2);
    points(:,2)=chromosome(:,nVar+4);
    %%%*************HV********************
    hv(2) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    if hv(2)<=hv(1)
        hv(3)=hv(1);
        hv(4)=hv(2);
        hv(1)=hv(4);
        hv(2)=hv(3);
    end
    hv=hv(1:2);
    indices.whv=hv(1);
    indices.bhv=hv(2);
    indices.hv=mean(hv);
    %%%%%%%%************Imprecise*******************
    imprecise=0;
    for i=1:size(chromosome,1)
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
            abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)));
    end
    indices.im=imprecise;
elseif nObj==6 %%tri-objective
    %%%*************HV********************
    hv=[];
    nrOfSamples=10000;
    points=[];
    points(:,1)=chromosome(:,nVar+1);
    points(:,2)=chromosome(:,nVar+3);
    points(:,3)=chromosome(:,nVar+5);
    hv(1) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    points(:,1)=chromosome(:,nVar+2);
    points(:,2)=chromosome(:,nVar+4);
    points(:,3)=chromosome(:,nVar+6);
    hv(2) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    if hv(2)<=hv(1)
        hv(3)=hv(1);
        hv(4)=hv(2);
        hv(1)=hv(4);
        hv(2)=hv(3);
    end
    hv=hv(1:2);
    indices.whv=hv(1);
    indices.bhv=hv(2);
    indices.hv=mean(hv);
   %%%%%%%%************Imprecise*******************
    imprecise=0;
    for i=1:size(chromosome,1)
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
            abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)))+abs((chromosome(i,nVar + 6)-chromosome(i,nVar + 5)));
    end
    indices.im=imprecise;
end
% plot figure
plot_figure(name,chromosome,nObj, nVar,runs);
end
%Calculate Intensity
function I=Intensity(N,Xprey,X)
for i=1:N-1
    di(i) =( norm((X(i,:)-Xprey+eps))).^2;
    S(i)=( norm((X(i,:)-X(i+1,:)+eps))).^2;
end
di(N)=( norm((X(N,:)-Xprey+eps))).^2;
S(N)=( norm((X(N,:)-X(1,:)+eps))).^2;
for i=1:N
    r2=rand;
    I(i)=r2*S(i)/(4*pi*di(i));
end
end
