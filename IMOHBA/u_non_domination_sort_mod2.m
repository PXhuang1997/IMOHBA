function f = u_non_domination_sort_mod2(x, M, V)

%% function f = non_domination_sort_mod(x, M, V) 
% This function sort the current popultion based on non-domination. All the
% individuals in the first front are given a rank of 1, the second front
% individuals are assigned rank 2 and so on. After assigning the rank the
% crowding in each front is calculated.
[N, m] = size(x);
clear m
% Initialize the front number to 1.
front = 1;
% There is nothing to this assignment, used only to manipulate easily in
% MATLAB.
F(front).f = [];
individual = [];
%% Non-Dominated sort. 
NEW_M=M/2;
for i = 1 : N
    % Number of individuals that dominate this individual 
    individual(i).n = 0;
    % Individuals which this individual dominate
    individual(i).p = [];
    for j = 1 : N
        u_value = u_ca_for_this(x(i,:), x(j,:),M,V);
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1 : NEW_M   
            if u_value(k)>0
                dom_less = dom_less + 1;
            elseif u_value(k)==0
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more + 1;
            end
        end
        if dom_less == 0 && dom_equal ~= NEW_M   
            individual(i).n = individual(i).n + 1;
        elseif dom_more == 0 && dom_equal ~= NEW_M    
            individual(i).p = [individual(i).p j];
        end
    end   
    if individual(i).n == 0
        x(i,M + V + 1) = 1;
        F(front).f = [F(front).f i];
    end
end
% Find the subsequent fronts
while ~isempty(F(front).f)
   Q = [];
   for i = 1 : length(F(front).f)
       if ~isempty(individual(F(front).f(i)).p)
        	for j = 1 : length(individual(F(front).f(i)).p)
            	individual(individual(F(front).f(i)).p(j)).n = ...
                	individual(individual(F(front).f(i)).p(j)).n - 1;
        	   	if individual(individual(F(front).f(i)).p(j)).n == 0
               		x(individual(F(front).f(i)).p(j),M + V + 1) = ...
                        front + 1;
                    Q = [Q individual(F(front).f(i)).p(j)];
                end
            end
       end
   end
   front =  front + 1;
   F(front).f = Q;
end

[temp,index_of_fronts] = sort(x(:,M + V + 1));
for i = 1 : length(index_of_fronts)
    sorted_based_on_front(i,:) = x(index_of_fronts(i),:);
end
current_index = 0;

%% Crowding distance 
length1=length(F);
for front = 1 : (length(F) - 1) 
    distance = 0;
    y = [];
    previous_index = current_index + 1;
    for i = 1 : length(F(front).f)
        y(i,:) = sorted_based_on_front(current_index + i,:);
    end
    current_index = current_index + i;
    % Sort each individual based on the objective
    sorted_based_on_objective = [];
    for i = 1 : M
        [sorted_based_on_objective, index_of_objectives] = ...
            sort(y(:,V + i));
        sorted_based_on_objective = [];
        for j = 1 : length(index_of_objectives)
            sorted_based_on_objective(j,:) = y(index_of_objectives(j),:);
        end
        f_max = ...
            sorted_based_on_objective(length(index_of_objectives), V + i); 
        f_min = sorted_based_on_objective(1, V + i);                       
        y(index_of_objectives(length(index_of_objectives)),M + V + 1 + i)...
            = Inf;                                                         
        y(index_of_objectives(1),M + V + 1 + i) = Inf;                     
         for j = 2 : length(index_of_objectives) - 1
             for k=1:length(index_of_objectives)
                 if(j~=k)
                     %Using formulas from the paper
                     sum_m=mySum(sorted_based_on_objective(j,:),sorted_based_on_objective(k,:),M,V);
                     Vj=myVolume(sorted_based_on_objective(j,:),M,V);
                     Vk=myVolume(sorted_based_on_objective(k,:),M,V);
                     Vjk=myVolume2(sorted_based_on_objective(j,:),sorted_based_on_objective(k,:),M,V);
                     d(k)=sum_m/(Vj+Vk+Vjk+1);
                 end
             end
             [sort_d,~]=sort(d);
             D=(sort_d(1)+sort_d(2))/2;
             y(index_of_objectives(j),M + V + 1 + i) = D;
         end
    end
    distance = [];
    distance(:,1) = zeros(length(F(front).f),1);
    for i = 1 : M
        distance(:,1) = distance(:,1) + y(:,M + V + 1 + i);
    end
    y(:,M + V + 2) = distance;
    y = y(:,1 : M + V + 2);
    z(previous_index:current_index,:) = y;
end
f = z();
