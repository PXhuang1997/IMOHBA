function fit=ptrue(name,nVar)
switch name
    %% IMOPs
    %% ************************************
    case {'IZDT1'}
        x=linspace(0,1,nVar)';
        f1=x(:,1);
        f2=abs(1-f1.^0.5);
        fit(:,1)=f1;
        fit(:,2)=f2;
    case {'IZDT2'}
        x=linspace(0,1,nVar)';
        f1=x(:,1);
        f2=abs(1-f1.^2);
        fit(:,1)=f1;
        fit(:,2)=f2;
    case 'IZDT3'
        x=linspace(0,1,nVar)';
        f1=x(:,1);
        f2=abs(2-f1.^0.5-f1.*sin(10*pi*f1));
        fit(:,1)=f1;
        fit(:,2)=f2;
    case 'IZDT4'
        x=linspace(0,1,nVar)';
        f1=x(:,1);
        f2=abs(1-f1.^0.5);
        fit(:,1)=f1;
        fit(:,2)=f2;
    case {'IZDT6'}
        x=linspace(0,1,nVar)';
        f1=x(:,1);
        f2=abs(1-f1.^2);
        fit(:,1)=f1;
        fit(:,2)=f2;

    case 'IDTLZ1'
        x = [0:0.1:1]';
        f1 = x*x'/2;
        f2 = x*(1-x')/2;
        f3 = (1-x)*ones(size(x'))/2;
        fit(:,1) = f1(:);
        fit(:,2) = f2(:);
        fit(:,3) = f3(:);
    case 'IDTLZ2'
        a = linspace(0,pi/2,10)';
        f1 = sin(a)*cos(a');
        f2 = sin(a)*sin(a');
        f3 = cos(a)*ones(size(a'));
        fit(:,1) = f1(:);
        fit(:,2) = f2(:);
        fit(:,3) = f3(:);
    case 'IDTLZ3'
        a = linspace(0,pi/2,10)';
        f1 = sin(a)*cos(a');
        f2 = sin(a)*sin(a');
        f3 = cos(a)*ones(size(a'));
        fit(:,1) = f1(:);
        fit(:,2) = f2(:);
        fit(:,3) = f3(:);
    case 'IDTLZ4'
        a = linspace(0,pi/2,10)';
        f1 = sin(a)*cos(a');
        f2 = sin(a)*sin(a');
        f3 = cos(a)*ones(size(a'));
        fit(:,1) = f1(:);
        fit(:,2) = f2(:);
        fit(:,3) = f3(:);
    case 'IDTLZ5'
        N=100;
        R = [0:1/(N-1):1;1:-1/(N-1):0]';
        R = R./repmat(sqrt(sum(R.^2,2)),1,size(R,2));
        R = [R(:,ones(1,1)),R];
        R = R./sqrt(2).^repmat([1,1:-1:0],size(R,1),1);
        fit=R;
    case 'IDTLZ6'
        N=100;
        R = [0:1/(N-1):1;1:-1/(N-1):0]';
        R = R./repmat(sqrt(sum(R.^2,2)),1,size(R,2));
        R = [R(:,ones(1,1)),R];
        R = R./sqrt(2).^repmat([1,1:-1:0],size(R,1),1);
        fit=R;
    case 'IMMF1'
        N=100;
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF2'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF3'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF4'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - R(:,1).^2;
        fit=R;
    case 'IMMF5'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF6'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF7'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = 1 - sqrt(R(:,1));
        fit=R;
    case 'IMMF8'
        R(:,1) = linspace(0,1,100)';
        R(:,2) = sqrt(1-R(:,1).^2);
        fit=R;

end
%%


