function f  = genetic_operator2(name,parent_chromosome, M, V, mu, mum, l_limit, u_limit)

%% function f  = genetic_operator(parent_chromosome, M, V, mu, mum, l_limit, u_limit)
%
% This function is utilized to produce offsprings from parent chromosomes.
% The genetic operators corssover and mutation which are carried out with
% slight modifications from the original design. For more information read
% the document enclosed. 
%
% parent_chromosome - the set of selected chromosomes. 
% M - number of objective functions   
% V - number of decision varaiables  
% mu - distribution index for crossover (read the enlcosed pdf file) 
% mum - distribution index for mutation (read the enclosed pdf file) 
% l_limit - a vector of lower limit for the corresponding decsion variables
% u_limit - a vector of upper limit for the corresponding decsion variables
% The genetic operation is performed only on the decision variables, that
% is the first V elements in the chromosome vector.
[N,m] = size(parent_chromosome);
clear m
p = 1;
% Flags used to set if crossover and mutation were actually performed. 
% was_crossover = 0;
% was_mutation = 0;
for i = 1 : round(N/2*0.9)
        child_1 = [];
        child_2 = [];
        % Select the first parent
        parent_1 = round(N*rand(1));  
        if parent_1 < 1
            parent_1 = 1;
        end
        % Select the second parent
        parent_2 = round(N*rand(1));
        if parent_2 < 1
            parent_2 = 1;
        end
        % Make sure both the parents are not the same. 
        while isequal(parent_chromosome(parent_1,:),parent_chromosome(parent_2,:))
            parent_2 = round(N*rand(1));
            if parent_2 < 1
                parent_2 = 1;
            end

        end
        % Get the chromosome information for each randomnly selected
        % parents 
        parent_1 = parent_chromosome(parent_1,:);
        parent_2 = parent_chromosome(parent_2,:);
        % Perform corssover for each decision variable in the chromosome.
        alpha=rand(size(parent_1,1),V);
        child_1=alpha.* parent_1(:,1:V)+(1-alpha).* parent_2(:,1:V);
        child_2=alpha.* parent_2(:,1:V)+(1-alpha).* parent_1(:,1:V);
        % Evaluate the objective function for the offsprings and as before
        % concatenate the offspring chromosome with objective value.£¨£©
        child_1(:,V + 1: M + V) = evaluate_objective(name,child_1, M, V);
        child_2(:,V + 1: M + V) = evaluate_objective(name,child_2, M, V);
        child(p,:) = child_1;
        child(p+1,:) = child_2;
        p=p+2;
end



for i=1:round(N*0.4)
%     if rand(1)<0.4
        % Select at random the parent.
        parent_3 = round(N*rand(1));
        if parent_3 < 1
            parent_3 = 1;
        end
    mu=0.02; 
    sigma=0.1*(u_limit- l_limit); 
    nMu=ceil(mu*V);

    j=randsample(V,nMu);
    if numel(sigma)>1
        sigma = sigma(j);
    end
    child_3 = parent_chromosome(parent_3,:);

    
    child_3(j)=child_3(j)+sigma.*randn(size(j));
    if child_3(j)<l_limit(j)
       child_3(j)=l_limit(j);
    elseif child_3(j)>u_limit(j)
        child_3(j)=u_limit(j);
    end
 %%%end***********************
 child_3(:,V + 1: M + V) = evaluate_objective(name,child_3, M, V);    
 p=p+1;
end
f = child;
