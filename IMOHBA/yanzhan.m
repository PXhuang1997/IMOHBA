function yz=yanzhan(X,nObj, nVar)
%Spread measure
sum=0;
for(i=1:1:nObj)
    s1=0;s2=0;
    s1=min(X(:,nVar+i));  
    s2=max(X(:,nVar+i));  
    sum=sum+(s2-s1)^2;
end
yz=sqrt(sum);
               
            