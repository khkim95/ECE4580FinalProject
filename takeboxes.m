function r=takeboxes(NR,container,chk)
%TAKEBOXES helps in determining the values of indices of interested Bounding boxes.
% R=TAKEBOXES(NR,CONTAINER,CHK) outputs the value of indices corresponding
% the desired Bounding boxes. NR is the numberofregionsx4 matrix of all the
% regions' Bounding boxes. CONTAINER is the width of the bin that contain
% all the six bounding boxes of interest. CHK will determine whether
% bounding boxes are y-dimension widht's wise grouped or y-coordinate wise
% grouped. CHK=2 considers y-dimension width grouping and CHK=1 considers
% y-coordinate grouping.

takethisbox=[]; % Initialize the variable to an empty matrix.
r=[];
for i=1:size(NR,1)
    if NR(i,(2*chk))>=container(1) && NR(i,(2*chk))<=container(2) % If Bounding box is among the container plus tolerence.
        takethisbox=cat(1,takethisbox,NR(i,:)); % Take that box and concatenate along first dimension.
        r=[r i];
    end
end

end
