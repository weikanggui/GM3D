function data = SphereSubdivision(sx,sy,sz,sr,xstep,ystep,zstep,Nx,Ny,Nz,para)
xl=[FindClosestDivisibleNum(sx-sr,xstep),FindClosestDivisibleNum(sx+sr,xstep)]/xstep;
yl=[FindClosestDivisibleNum(sy-sr,ystep),FindClosestDivisibleNum(sy+sr,ystep)]/ystep;
zl=[FindClosestDivisibleNum(sz-sr,zstep),FindClosestDivisibleNum(sz+sr,zstep)]/zstep;
s=fix(sr*sqrt(2)/2)-fix(sr/10);
sr2=sr^2;

data=zeros(Nx,Ny,Nz);

%中心正方体%%%%%%%%%%%%%%%%%%%%
zx=[FindClosestDivisibleNum(sx-s,xstep),FindClosestDivisibleNum(sx+s,xstep)]/xstep;
zy=[FindClosestDivisibleNum(sy-s,ystep),FindClosestDivisibleNum(sy+s,ystep)]/ystep;
zz=[FindClosestDivisibleNum(sz-s,zstep),FindClosestDivisibleNum(sz+s,zstep)]/zstep;
count=0;

for i=zx(1,1):1:zx(1,2)-1
    for j=zy(1,1):1:zy(1,2)-1
        for k=zz(1,1):1:zz(1,2)-1
            count=count+1;
            data(i+1,j+1,k+1)=para;
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 四边剩余部分
% 上下部分
for m=xl(1,1):1:xl(1,2)-1
    for n=yl(1,1):1:yl(1,2)-1
        for k=zl(1,1):1:zz(1,1)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end
for m=xl(1,1):1:xl(1,2)-1
    for n=yl(1,1):1:yl(1,2)-1
        for k=zz(1,2):1:zl(1,2)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end
%左右部分
for m=xl(1,1):1:zx(1,1)-1
    for n=zy(1,1):1:zy(1,2)-1
        for k=zz(1,1):1:zz(1,2)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end

for m=zx(1,2):1:xl(1,2)-1
    for n=zy(1,1):1:zy(1,2)-1
        for k=zz(1,1):1:zz(1,2)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end

%前后部分
for m=xl(1,1):1:xl(1,2)-1
    for n=zy(1,2):1:yl(1,2)-1
        for k=zz(1,1):1:zz(1,2)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end

for m=xl(1,1):1:xl(1,2)-1
    for n=yl(1,1):1:zy(1,1)-1
        for k=zz(1,1):1:zz(1,2)-1
            if (m*xstep-sx)^2+(n*ystep-sy)^2+(k*zstep-sz)^2<=sr2
                data(m+1,n+1,k+1)=para;
            end
        end
    end
end
save('test2','data')
end