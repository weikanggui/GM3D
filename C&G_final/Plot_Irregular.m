function Plot_Irregular(ax,data,alldata,Nx,Ny,Nz,sco,color)
facet=[1 2 4 3;1 3 7 5;1 2 6 5;2 4 8 6;3 4 8 7;5 6 8 7;];
adata=zeros(Nx+2,Ny+2,Nz+2);
adata(2:Nx+1,2:Ny+1,2:Nz+1)=alldata;
for ix=1:Nx
    for iy=1:Ny
        for iz=1:Nz
            if data(ix,iy,iz)~=0
                if NeedtoDraw(ix+1,iy+1,iz+1,adata)
                    fixed=CenterAndSize2Fixed([(ix-0.5)*sco(1,7)+sco(1,1),(iy-0.5)*sco(1,8)+sco(1,3),(iz-0.5)*sco(1,9)+sco(1,5)],sco(1,7:9));
                    patch(ax,'Faces',facet,"Vertices",fixed,'facecolor',color);
                end
            end
        end
    end
end
end


