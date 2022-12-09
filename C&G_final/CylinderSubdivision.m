function data=CylinderSubdivision(spx,spy,sr,min,max,para,xstep,ystep,zstep,Nx,Ny,Nz,type)
data=zeros(Nx,Ny,Nz);
sr2=sr^2;
if type==0
    a=[FindClosestDivisibleNum(spx-sr,ystep),FindClosestDivisibleNum(spx+sr,ystep)]/ystep;
    b=[FindClosestDivisibleNum(spy-sr,zstep),FindClosestDivisibleNum(spy+sr,zstep)]/zstep;
    c=[FindClosestDivisibleNum(min,xstep),FindClosestDivisibleNum(max,xstep)]/xstep;
    for i=a(1,1):1:a(1,2)-1
        for j=b(1,1):1:b(1,2)-1
            if (i*xstep-spx)^2+(j*ystep-spy)^2<=sr2
                data(c(1,1)+1,i+1,j+1)=para;
            end
        end
    end
    for ix=c(1,1)+2:1:c(1,2)
       data(ix,:,:)=data(c(1,1)+1,:,:);
    end  
elseif type==1
    a=[FindClosestDivisibleNum(spx-sr,xstep),FindClosestDivisibleNum(spx+sr,xstep)]/xstep;
    b=[FindClosestDivisibleNum(spy-sr,zstep),FindClosestDivisibleNum(spy+sr,zstep)]/zstep;
    c=[FindClosestDivisibleNum(min,ystep),FindClosestDivisibleNum(max,ystep)]/ystep;
    for i=a(1,1):1:a(1,2)-1
        for j=b(1,1):1:b(1,2)-1
            if (i*xstep-spx)^2+(j*ystep-spy)^2<=sr2
                data(i+1,c(1,1)+1,j+1)=para;
            end
        end
    end
    for iy=c(1,1)+2:1:c(1,2)
        data(:,iy,:)=data(:,c(1,1)+1,:);
    end
elseif type==2
    a=[FindClosestDivisibleNum(spx-sr,xstep),FindClosestDivisibleNum(spx+sr,xstep)]/xstep;
    b=[FindClosestDivisibleNum(spy-sr,ystep),FindClosestDivisibleNum(spy+sr,ystep)]/ystep;
    c=[FindClosestDivisibleNum(min,zstep),FindClosestDivisibleNum(max,zstep)]/zstep;
    for i=a(1,1):1:a(1,2)-1
        for j=b(1,1):1:b(1,2)-1
            if (i*xstep-spx)^2+(j*ystep-spy)^2<=sr2
                
                data(i+1,j+1,c(1,1)+1)=para;
            end
        end
    end
    for iz=c(1,1)+2:c(1,2)
        data(:,:,iz)=data(:,:,c(1,1)+1);
    end

end
end

