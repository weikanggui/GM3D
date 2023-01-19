 function [Lx,Ly,Lz]=Plot_Cylinder(L,Originp,R,type)
      %type==0 走向沿着x方向
      %type==1 走向沿着y方向 
      %type==2 走向沿着z方向
      if type==1
          Vector=[0 L 0];
      elseif type==0
          Vector=[L 0 0];
      elseif type==2
          Vector=[0 0 L];
      end
      obstracle_hight=norm(Vector);
      CZ=Vector/norm(Vector);
      CZout=null(CZ);
      CX=CZout(:,1);
      CY=CZout(:,2);
      CZ=CZ';
      Trans=[[CX CY CZ Originp'];0 0 0 1];
      Lx=zeros(2,51);
      Ly=Lx;
      Lz=Lx;
      
      for i=1:50
          Lx(1,i)=R*cos(i*2*pi/50);
          Ly(1,i)=R*sin(i*2*pi/50);
          Lz(2,i)=obstracle_hight;
          Lz(1,i)=0;
      end
      Lx(1,51)=Lx(1,1);
      Ly(1,51)=Ly(1,1);
      Lz(1,51)=0;
      Lz(2,51)=obstracle_hight;
      Lx(2,:)=Lx(1,:);
      Ly(2,:)=Ly(1,:);
      
      for i=1:51
          out=Trans*[Lx(1,i);Ly(1,i);Lz(1,i);1];
          Lx(1,i)=out(1);
          Ly(1,i)=out(2);
          Lz(1,i)=out(3);
          out=Trans*[Lx(2,i);Ly(2,i);Lz(2,i);1];
          Lx(2,i)=out(1);
          Ly(2,i)=out(2);
          Lz(2,i)=out(3);
      end
