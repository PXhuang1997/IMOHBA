function f = evaluate_objective(name, x, nObj, nVar)

%% function f = evaluate_objective(x, M, V)
% Function to evaluate the objective functions for the given input vector
% x. x is an array of decision variables and f(1), f(2), etc are the
% objective functions. The algorithm always minimizes the objective
% function hence if you would like to maximize the function then multiply
% the function by negative one. M is the numebr of objective functions and
% V is the number of decision variables.

switch name
    case {'IZDT1'}
        f=[];
        sum_x=0;
        g=[];
        for i=2:nVar
            sum_x=sum_x+x(i);
        end
        g_x=1+9*sum_x/(nVar-1);
        g(1)=x(1);
        g(2)=g_x*(1-sqrt(g(1)/g_x));
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); %Lower bounds of objective 1
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); %Upper bound for objective 1
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); %Lower bounds of objective 2
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); %Upper bound for objective 2
        %%

        case {'IZDT2'}   
         f=[];
         sum_x=0;
         g=[];
         for i=2:nVar
             sum_x=sum_x+x(i);
         end
         g_x=1+9*sum_x/(nVar-1);
         g(1)=x(1);
         g(2)=g_x*(1-(g(1)/g_x)^2);
         f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
         f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
         f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
         f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 
     %%    
      
     case {'IZDT3'}   
         f=[];
         sum_x=0;
         g=[];
         for i=2:nVar
             sum_x=sum_x+x(i);
         end
         g_x=1+9*sum_x/(nVar-1);
         g(1)=x(1);
         g(2)=g_x*(1-sqrt(g(1)/g_x)-g(1)/g_x*sin(10*pi*g(1)));
         f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
         f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
         f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
         f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 
     %%    

    case {'IZDT4'}
        f=[];
        sum_x=0;
        g=[];
        for i=2:nVar
            sum_x=sum_x+x(i)^2-10*cos(4*pi*x(i));
        end
        g_x=1+10*(nVar-1)+sum_x;
        g(1)=x(1);
        g(2)=g_x*(1-sqrt(g(1)/g_x));
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 
     %%  

     case {'IZDT6'}
        f=[];
        sum_x=0;
        g=[];
        for i=2:nVar
            sum_x=sum_x+x(i);
        end
        g_x=1+9*(sum_x/(nVar-1))^0.25;
        g(1)=x(1);
        g(2)=g_x*(1-(g(1)/g_x)^2);
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

      %%
   
     case 'IDTLZ1'
        f = [];
        sum_x = 0;
        g = [];
        for i = 3 : nVar

            sum_x = sum_x + (x(i)-0.5)^2-cos(20*pi*(x(i)-0.5));
        end
        sum_x=sum_x/(nVar-3+1);
        g_x = 100*(nVar-3+1+sum_x)/(100*(nVar-3+1));
        g(1) = (1 + g_x)*x(1)*x(2)/2; 
        g(2) = (1 + g_x)*x(1)*(1-x(2))/2; 
        g(3) = (1 + g_x)*(1-x(1))/2;                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);    
  %%

    case 'IDTLZ2'
        f = [];
        g_x = 0;
        g = [];
        for i = 3 : nVar
            g_x = g_x + (x(i) - 0.5)^2;
        end
        g_x=g_x/(nVar-3+1);
        g(1) = (1 + g_x)*cos(0.5*pi*x(1))*cos(0.5*pi*x(2)); 
        g(2) = (1 + g_x)*cos(0.5*pi*x(1))*sin(0.5*pi*x(2)); 
        g(3) = (1 + g_x)*sin(0.5*pi*x(1));                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);  

        %%

  case 'IDTLZ3'
        f = [];
        sum_x = 0;
        g = [];
        for i = 3 : nVar
            sum_x = sum_x + (x(i)-0.5)^2-cos(20*pi*(x(i)-0.5));
        end
        sum_x=sum_x/(nVar-3+1);
        g_x = sum_x;
        g(1) = (1 + g_x)*cos(pi/2*x(1))*cos(pi/2*x(2)); 
        g(2) = (1 + g_x)*cos(pi/2*x(1))*sin(pi/2*x(2)); 
        g(3) = (1 + g_x)*sin(pi/2*x(1));                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);  

        %%

  case 'IDTLZ4'
        f = [];
        sum_x = 0;
        g = [];
        for i = 3 : nVar
            sum_x = sum_x + (x(i)-0.5)^2;
        end
        sum_x=sum_x/(nVar-3+1);
        g_x = sum_x;
        g(1) = (1 + g_x)*cos(pi/2*x(1))*cos(pi/2*x(2)); 
        g(2) = (1 + g_x)*cos(pi/2*x(1))*sin(pi/2*x(2)); 
        g(3) = (1 + g_x)*sin(pi/2*x(1));                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);  

        %%

  case 'IDTLZ5'
        
        f = [];
        sum_x = 0;
        g = [];
        for i = 3 : nVar
            sum_x = sum_x + (x(i)-0.5)^2;
        end
        sum_x=sum_x/(nVar-3+1);
        x(2)=(1+2*sum_x*x(2))/(2+2*sum_x);
        g_x = sum_x;
        g(1) = (1 + g_x)*cos(pi/2*x(1))*cos(pi/2*x(2)); 
        g(2) = (1 + g_x)*cos(pi/2*x(1))*sin(pi/2*x(2)); 
        g(3) = (1 + g_x)*sin(pi/2*x(1));                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);  

        %%

  case 'IDTLZ6'
        f = [];
        sum_x = 0;
        g = [];
        for i = 3 : nVar
            sum_x = sum_x + (x(i))^0.1;
        end
        sum_x=sum_x/(nVar-3+1);
        x(2)=(1+2*sum_x*x(2))/(2+2*sum_x);
        g_x = sum_x;
        g(1) = (1 + g_x)*cos(pi/2*x(1))*cos(pi/2*x(2)); 
        g(2) = (1 + g_x)*cos(pi/2*x(1))*sin(pi/2*x(2)); 
        g(3) = (1 + g_x)*sin(pi/2*x(1));                  
        f(1) = min(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(2) = max(g(1),g(1)+sin(10*pi*sum(x))/4);  
        f(3) = min(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(4) = max(g(2),g(2)+sin(20*pi*sum(x))/4);  
        f(5) = min(g(3),g(3)+sin(40*pi*sum(x))/4);  
        f(6) = max(g(3),g(3)+sin(40*pi*sum(x))/4);  

        %%

    case 'IMMF1'
        PopObj(:,1) = abs(x(:,1)-2);
        PopObj(:,2) = 1-sqrt(PopObj(:,1))+2*(x(:,2)-sin(6*pi*PopObj(:,1)+pi)).^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF2'
        temp = x(:,2) <= 1;
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sqrt(x(temp,1));
        y(~temp) = x(~temp,2) - 1 - sqrt(x(~temp,1));
        PopObj(:,1) = x(:,1);
        PopObj(:,2) = 1 - sqrt(x(:,1)) + 2.*((4.*y.^2)-2*cos(20.*y.*pi/sqrt(2))+2);
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF3'
        temp = x(:,2)<=0.5 | x(:,2)<1 & x(:,1)>0.25;
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sqrt(x(temp,1));
        y(~temp) = x(~temp,2) - 0.5 - sqrt(x(~temp,1));
        PopObj(:,1) = x(:,1);
        PopObj(:,2) = 1 - sqrt(x(:,1)) + 2*(4*y.^2-2*cos(20*y*pi/sqrt(2))+2);
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF4'
        temp = x(:,2) < 1;
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sin(pi*abs(x(temp,1)));
        y(~temp) = x(~temp,2) - 1 - sin(pi*abs(x(~temp,1)));
        PopObj(:,1) = abs(x(:,1));
        PopObj(:,2) = 1 - x(:,1).^2 + 2*y.^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4);
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF5'
        temp = x(:,2) <= 1;
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sin(6*pi*abs(x(temp,1)-2)+pi);
        y(~temp) = x(~temp,2) - 2 - sin(6*pi*abs(x(~temp,1)-2)+pi);
        PopObj(:,1) = abs(x(:,1)-2);
        PopObj(:,2) = 1 - sqrt(PopObj(:,1)) + 2*y.^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF6'
        temp = x(:,2)<=0 | x(:,2)<=1 & (x(:,1)<=7/6|8/6<x(:,1)&x(:,1)<=9/6|10/6<x(:,1)&x(:,1)<=11/6|13/6<x(:,1)&x(:,1)<=14/6|15/6<x(:,1)&x(:,1)<=16/6|17/6<x(:,1));
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sin(6*pi*abs(x(temp,1)-2)+pi);
        y(~temp) = x(~temp,2) - 1 - sin(6*pi*abs(x(~temp,1)-2)+pi);
        PopObj(:,1) = abs(x(:,1)-2);
        PopObj(:,2) = 1 - sqrt(PopObj(:,1)) + 2*y.^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF7'
        PopObj(:,1) = abs(x(:,1)-2);
        PopObj(:,2) = 1 - sqrt(PopObj(:,1)) + (x(:,2)-(0.3.*(PopObj(:,1).^2).*cos(24.*pi.*PopObj(:,1)+4.*pi)+0.6.*PopObj(:,1)).*sin(6.*pi.*PopObj(:,1)+pi)).^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

    case 'IMMF8'
        temp = x(:,2) <= 4;
        y    = zeros(size(x,1),1);
        y(temp)  = x(temp,2) - sin(abs(x(temp,1))) - abs(x(temp,1));
        y(~temp) = x(~temp,2) - 4 - sin(abs(x(~temp,1))) - abs(x(~temp,1));
        PopObj(:,1) = sin(abs(x(:,1)));
        PopObj(:,2) = sqrt(1-PopObj(:,1).^2) + 2*y.^2;
        g(1) = PopObj(1); 
        g(2) = PopObj(2); 
        f(1)=min(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(2)=max(g(1),g(1)+sin(10*pi*sum(x))/4); 
        f(3)=min(g(2),g(2)+sin(20*pi*sum(x))/4); 
        f(4)=max(g(2),g(2)+sin(20*pi*sum(x))/4); 

end
 
      
























