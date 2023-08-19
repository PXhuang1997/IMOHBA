function sp=spp(X,nObj, nVar)
% The return value of the function is the variance of the individual distances 
% of the population, responding to the degree of dispersion of the population, i.e., 
% the schoot distribution degree

D=[];
 for(i=1:1:size(X,1))
     d=0;dd=[];
     for(j=1:1:size(X,1))
         if(j~=i)
             ddd=0;
             for(jj=1:nObj)
                 ddd=ddd+ abs(X(j,nVar+jj)-X(i,nVar+jj)); 
             end
            dd=[dd;ddd];
         end
     end
    d=min(dd);
    D=[D;d];
 end
 if numel(D)~=0
    avd=mean(D);
    sumd=0;
    for(i=1:1:size(X,1))
        sumd=sumd+(avd-D(i))^2;
    end
    sp=sqrt(sumd/(size(X,1)-1));
else
    sp=1000000;
end


    