function result=myVolume2(x,y,M,V)
j=1;
k=1;
for i=1:M
    if(mod(i,2)==0)
        x_temp2(j)=x(V+i);
        y_temp2(j)=y(V+i);
        j=j+1;
    else
        x_temp1(k)=x(V+i);
        y_temp1(k)=y(V+i);
        k=k+1;
    end
end

for i=1:M/2
    A=[x_temp1(i),x_temp2(i)];
    B=[y_temp1(i),y_temp2(i)];
    W(i)=myIntersect(A,B);
end

result=1;
for i=1:length(W)
    result=result*W(i);
end
