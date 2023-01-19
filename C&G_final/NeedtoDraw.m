function flag = NeedtoDraw(ix,iy,iz,data)
    if data(ix,iy,iz+1)&&data(ix,iy,iz-1)&&data(ix,iy+1,iz)&&data(ix,iy-1,iz)&&data(ix-1,iy,iz)&&data(ix+1,iy,iz)
        flag=0;
    else
        flag=1;
    end
end

