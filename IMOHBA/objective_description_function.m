function [nVar,nObj, xbounds,ybounds] = objective_description_function(name)

%% function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function()
% This function is used to completely describe the objective functions and
% the range for the decision variable space etc. The user is prompted for
% inputing the number of objectives, numebr of decision variables, the
% maximum and minimum range for each decision variable and finally the
% function waits for the user to modify the evaluate_objective function to
% suit their need.
%[nVar,nObj, xbounds,ybounds] = objective_description_function(name,nVar)


switch name
    case{'IZDT1'}
        nVar=30;
        nObj=4;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5];

    case{'IZDT2'}
        nVar=30;
        nObj=4;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5];

    case{'IZDT3'} 
        nVar=10;
        nObj=4;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5];
        
    case{'IZDT4'}
        nVar=10;
        nObj=4;
        xbounds(1:nVar,1)=[0;-5*ones(nVar-1,1)];
        xbounds(1:nVar,2)=[1; 5*ones(nVar-1,1)];
        ybounds=[5,5];

    case{'IZDT6'}
        nVar=10;
        nObj=4;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5];

    case {'IDTLZ1'}
        nVar=7 ;
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IDTLZ2'}
        nVar=12 ;
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IDTLZ3'}
        nVar=12 ;
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IDTLZ4'}
        nVar=12 ; 
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IDTLZ5'}
        nVar=12 ; 
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IDTLZ6'}
        nVar=12 ; 
        nObj=6;
        xbounds(1:nVar,1)=0;
        xbounds(1:nVar,2)=1;
        ybounds=[5,5,5];

    case {'IMMF1'}
        nVar=2 ; 
        nObj=4;
        xbounds(1:nVar,1)=[-1,1];
        xbounds(1:nVar,2)=[1,3];
        ybounds=[5,5];

    case {'IMMF2'}
        nVar=2 ; 
        nObj=4;
        xbounds(1:nVar,1)=[0,0];
        xbounds(1:nVar,2)=[1,2];
        ybounds=[5,5];

    case {'IMMF3'}
        nVar=2 ; 
        nObj=4;
        xbounds(1:nVar,1)=[0,0];
        xbounds(1:nVar,2)=[1,1.5];
        ybounds=[5,5];

    case {'IMMF4'}
        nVar=2 ; 
        nObj=4;
        xbounds(1:nVar,1)=[-1,0];
        xbounds(1:nVar,2)=[1,2];
        ybounds=[5,5];
     
    case {'IMMF5'}
        nVar=2;
        nObj=4;
        xbounds(1:nVar,1)=[1,-1];
        xbounds(1:nVar,2)=[3,3];
        ybounds=[5,5];

    case {'IMMF6'}
        nVar=2;
        nObj=4;
        xbounds(1:nVar,1)=[1,-1];
        xbounds(1:nVar,2)=[3,2];
        ybounds=[5,5];

    case {'IMMF7'}
        nVar=2;
        nObj=4;
        xbounds(1:nVar,1)=[1,-1];
        xbounds(1:nVar,2)=[3,1];
        ybounds=[5,5];

    case {'IMMF8'}
        nVar=2;
        nObj=4;
        xbounds(1:nVar,1)=[-pi,0];
        xbounds(1:nVar,2)=[pi,0];
        ybounds=[5,5];
end





