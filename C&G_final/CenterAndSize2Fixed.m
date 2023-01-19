function Fixed = CenterAndSize2Fixed(center,size)
%This function is used to calculate the coordinates of the eight corners of the model according to the center point and size of the model
%input:center is the center point of model，a 1×3 matrix
%      size is the size of the model，a 1×3 matrix
%output:Fixed is the coordinates of the eight corners of the model,a 8×3 matrix，
        Fixed(1,1:3)=[center(1,1)+size(1,1)/2,center(1,2)-size(1,2)/2,center(1,3)-size(1,3)/2];
        Fixed(2,1:3)=[center(1,1)+size(1,1)/2,center(1,2)-size(1,2)/2,center(1,3)+size(1,3)/2];
        Fixed(3,1:3)=[center(1,1)+size(1,1)/2,center(1,2)+size(1,2)/2,center(1,3)-size(1,3)/2];
        Fixed(4,1:3)=[center(1,1)+size(1,1)/2,center(1,2)+size(1,2)/2,center(1,3)+size(1,3)/2];
        Fixed(5,1:3)=[center(1,1)-size(1,1)/2,center(1,2)-size(1,2)/2,center(1,3)-size(1,3)/2];
        Fixed(6,1:3)=[center(1,1)-size(1,1)/2,center(1,2)-size(1,2)/2,center(1,3)+size(1,3)/2];
        Fixed(7,1:3)=[center(1,1)-size(1,1)/2,center(1,2)+size(1,2)/2,center(1,3)-size(1,3)/2];
        Fixed(8,1:3)=[center(1,1)-size(1,1)/2,center(1,2)+size(1,2)/2,center(1,3)+size(1,3)/2];

end

