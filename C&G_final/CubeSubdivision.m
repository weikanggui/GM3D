function data=CubeSubdivision(mx,my,mz,xstep,ystep,zstep,Nx,Ny,Nz,para)
data=zeros(Nx,Ny,Nz);
flagz=JudgeIsParallel([mz(2),mz(4),mz(6),mz(8)],[mz(1),mz(3),mz(5),mz(7)]);
if flagz==0
    z=[FindClosestDivisibleNum(mz(1),zstep),FindClosestDivisibleNum(mz(2),zstep)];
    flagx=JudgeIsParallel([mx(2),mx(1),mx(3),mx(4)],[mx(5),mx(6),mx(7),mx(8)]);
    if flagx==0
        flagy=JudgeIsParallel([my(3),my(4),my(7),my(8)],[my(1),my(2),my(5),my(6)]);
        x=[FindClosestDivisibleNum(mx(5),xstep),FindClosestDivisibleNum(mx(1),xstep)];
        if flagy==1
            if my(8)==my(4)
                y=[FindClosestDivisibleNum(my(5),ystep),FindClosestDivisibleNum(my(7),ystep);FindClosestDivisibleNum(my(6),ystep),FindClosestDivisibleNum(my(8),ystep)];
                type=1;
            else
                y=[FindClosestDivisibleNum(my(6),ystep),FindClosestDivisibleNum(my(8),ystep);FindClosestDivisibleNum(my(2),ystep),FindClosestDivisibleNum(my(4),ystep)];
                type=2;
            end
        else
            if my(6)==my(2)
                y=[FindClosestDivisibleNum(my(5),ystep),FindClosestDivisibleNum(my(7),ystep);FindClosestDivisibleNum(my(6),ystep),FindClosestDivisibleNum(my(8),ystep)];
                type=1;
            else
                y=[FindClosestDivisibleNum(my(6),ystep),FindClosestDivisibleNum(my(8),ystep);FindClosestDivisibleNum(my(2),ystep),FindClosestDivisibleNum(my(4),ystep)];
                type=2;
            end
        end
    else
        y=[FindClosestDivisibleNum(my(5),ystep),FindClosestDivisibleNum(my(7),ystep)];
        if flagx==1
            if mx(1)==mx(2)
                x=[FindClosestDivisibleNum(mx(6),xstep),FindClosestDivisibleNum(mx(2),xstep);FindClosestDivisibleNum(mx(8),xstep),FindClosestDivisibleNum(mx(4),xstep)];
                type=3;
            else
                x=[FindClosestDivisibleNum(mx(5),xstep),FindClosestDivisibleNum(mx(1),xstep);FindClosestDivisibleNum(mx(6),xstep),FindClosestDivisibleNum(mx(2),xstep)];
                type=4;
            end
        else
            if mx(6)==mx(5)
                x=[FindClosestDivisibleNum(mx(6),xstep),FindClosestDivisibleNum(mx(2),xstep);FindClosestDivisibleNum(mx(8),xstep),FindClosestDivisibleNum(mx(4),xstep)];
                type=3;
            else
                x=[FindClosestDivisibleNum(mx(5),xstep),FindClosestDivisibleNum(mx(1),xstep);FindClosestDivisibleNum(mx(6),xstep),FindClosestDivisibleNum(mx(2),xstep)];
                type=4;
            end
        end
    end
else
    x=[FindClosestDivisibleNum(mx(5),xstep),FindClosestDivisibleNum(mx(1),xstep)];
    y=[FindClosestDivisibleNum(my(6),ystep),FindClosestDivisibleNum(my(8),ystep)];
    if flagz==1
        if mz(6)==mz(2)
            z=[FindClosestDivisibleNum(mz(1),zstep),FindClosestDivisibleNum(mz(2),zstep);FindClosestDivisibleNum(mz(3),zstep),FindClosestDivisibleNum(mz(4),zstep)];
            type=5;
        else
            z=[FindClosestDivisibleNum(mz(5),zstep),FindClosestDivisibleNum(mz(6),zstep);FindClosestDivisibleNum(mz(1),zstep),FindClosestDivisibleNum(mz(2),zstep)];
            type=6;
        end
    else
        if mz(1)==mz(5)
            z=[FindClosestDivisibleNum(mz(1),zstep),FindClosestDivisibleNum(mz(2),zstep);FindClosestDivisibleNum(mz(3),zstep),FindClosestDivisibleNum(mz(4),zstep)];
            type=5;
        else
            z=[FindClosestDivisibleNum(mz(5),zstep),FindClosestDivisibleNum(mz(6),zstep);FindClosestDivisibleNum(mz(1),zstep),FindClosestDivisibleNum(mz(2),zstep)];
            type=6;
        end
    end
end
temp=z(1,2);
z(1,2)=z(1,1);
z(1,1)=temp;
switch type
    case 1
        %57 68
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=z(2)-z(1);
        ygh=(y(1,1)-y(2,1))/layer;
        ygq=(y(1,2)-y(2,2))/layer;
        ylayer=zeros(layer,2);
        for i=1:layer
            ylayer(i,:)=[y(1,1)-round((i-1)*ygh),y(1,2)-round((i-1)*ygq)];
        end
        layer=0;
        for i=z(1):1:z(2)-1
            layer=layer+1;
            for j=x(1):1:x(2)-1
                for k=ylayer(layer,1):1:ylayer(layer,2)-1
                    data(j+1,k+1,i+1)=para;
                end
            end
        end
        
    case 2
        %68 24
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=x(2)-x(1);
        ygh=(y(1,1)-y(2,1))/layer;
        ygq=(y(1,2)-y(2,2))/layer;
        ylayer=zeros(layer,2);
        for i=1:layer
            ylayer(i,:)=[y(1,1)-round((i-1)*ygh),y(1,2)-round((i-1)*ygq)];
        end
       
        layer=0;
        for i=x(1):1:x(2)-1
            layer=layer+1;
            for j=z(1):1:z(2)-1
                for k=ylayer(layer,1):1:ylayer(layer,2)-1
                    data(i+1,k+1,j+1)=para;
                end
            end
        end
        
    case 3
        % 62 84
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=y(2)-y(1);
        xgl=(x(1,1)-x(2,1))/layer;
        xgr=(x(1,2)-x(2,2))/layer;
        xlayer=zeros(layer,2);
        for i=1:layer
            xlayer(i,:)=[x(1,1)-round((i-1)*xgl),x(1,2)-round((i-1)*xgr)];
        end
        layer=0;
        for i=y(1):1:y(2)-1
            layer=layer+1;
            for j=z(1):1:z(2)-1
                for k=xlayer(layer,1):1:xlayer(layer,2)-1
                    data(k+1,i+1,j+1)=para;
                end
            end
        end
    case 4
        %51 62
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=z(2)-z(1);
        xgl=(x(1,1)-x(2,1))/layer;
        xgr=(x(1,2)-x(2,2))/layer;
        xlayer=zeros(layer,2);
        for i=1:layer
            xlayer(i,:)=[x(1,1)-round((i-1)*xgl),x(1,2)-round((i-1)*xgr)];
        end 
        layer=0;
        for i=z(1):1:z(2)-1
            layer=layer+1;
            for j=y(1):1:y(2)-1
                for k=xlayer(layer,1):1:xlayer(layer,2)-1
                    data(k+1,j+1,i+1)=para;
                end
            end
        end
    case 5
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=y(2)-y(1);
        zgd=(z(1,1)-z(2,1))/layer;
        zgu=(z(1,2)-z(2,2))/layer;
        zlayer=zeros(layer,2);
        for i=1:layer
            zlayer(i,:)=[z(1,1)-round((i-1)*zgd),z(1,2)-round((i-1)*zgu)];
        end
        layer=0;
        for i=y(1):1:y(2)-1
            layer=layer+1;
            for j=x(1):1:x(2)-1
                for k=zlayer(layer,1):1:zlayer(layer,2)-1
                    data(j+1,i+1,k+1)=para;
                end
            end
        end
    case 6
        z=z/zstep;
        x=x/xstep;
        y=y/ystep;
        layer=x(2)-x(1);
        zgd=(z(1,1)-z(2,1))/layer;
        zgu=(z(1,2)-z(2,2))/layer;
        zlayer=zeros(layer,2);
        for i=1:layer
            zlayer(i,:)=[z(1,1)-round((i-1)*zgd),z(1,2)-round((i-1)*zgu)];
        end
        layer=0;
        for i=x(1):1:x(2)-1
            layer=layer+1;
            for j=y(1):1:y(2)-1
                for k=zlayer(layer,1):1:zlayer(layer,2)-1
                    data(i+1,j+1,k+1)=para;
                end
            end
        end     
end      
end
