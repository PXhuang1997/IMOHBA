%u metric
function f = u_ca_for_this(A,B,mubiao,V)

if mubiao==4
    M(1,:)=[(A(V+1)+A(V+2))/2,(A(V+3)+A(V+4))/2]; %Center of the objective interval for the first individual
    M(2,:)=[(B(V+1)+B(V+2))/2,(B(V+3)+B(V+4))/2]; %Center of the objective interval for the second individual
    R(1,:)=[A(V+2)-A(V+1),A(V+4)-A(V+3)];  %Interval width of the first individual
    R(2,:)=[B(V+2)-B(V+1),B(V+4)-B(V+3)];  %Interval width of the second individual
    for j=1:(mubiao/2)
        if R(1,j)+R(2,j)==0
            f(j)=M(2,j)-M(1,j)+2*sign(M(2,j)-M(1,j));
        else if (M(1,j)~=M(2,j))&&(R(1,j)+R(2,j)~=0)
                f(j)=(M(2,j)-M(1,j))./(R(1,j)+R(2,j))+sign(M(2,j)-M(1,j));
        else if (M(2,j)==M(1,j))&&(R(1,j)+R(2,j)~=0)
                f(j)=(M(2,j)-M(1,j))./max(M(2,j),M(1,j));
        end
        end
        end
    end
    
elseif mubiao==6
    
    M(1,:)=[(A(V+1)+A(V+2))/2,(A(V+3)+A(V+4))/2,(A(V+5)+A(V+6))/2];
    M(2,:)=[(B(V+1)+B(V+2))/2,(B(V+3)+B(V+4))/2,(B(V+5)+B(V+6))/2];
    R(1,:)=[A(V+2)-A(V+1),A(V+4)-A(V+3),A(V+6)-A(V+5)];
    R(2,:)=[B(V+2)-B(V+1),B(V+4)-B(V+3),B(V+6)-B(V+5)];
    for j=1:(mubiao/2)
        if R(1,j)+R(2,j)==0
            f(j)=M(2,j)-M(1,j)+2*sign(M(2,j)-M(1,j));
        else if (M(1,j)~=M(2,j))&&(R(1,j)+R(2,j)~=0)
                f(j)=(M(2,j)-M(1,j))./(R(1,j)+R(2,j))+sign(M(2,j)-M(1,j));
        else if (M(2,j)==M(1,j))&&(R(1,j)+R(2,j)~=0)
                f(j)=(M(2,j)-M(1,j))./max(M(2,j),M(1,j));
        end
        end
        end
    end
end

