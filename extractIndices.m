function Index=extractIndices(Box, NC)

[Freq1,Height]=hist(Box(:,4));	%get the histogram of height
ind1=find(Freq1==NC);	%find index which frequency equals the number of characters

for i=1:length(Box)           
    PColunm(i)=Box(i,2) * Box(i,4); %new column with produce of height and y
end
Box2=cat(2,Box,PColunm');          
[Freq2,Product]=hist(Box2(:,5),20);	%get histogram base on new column
ind2=find(Freq2==NC);                %find index that frequency equals the number of characters
if length(ind1)==1  %if found one set of box meet requirement
    HChar=Height(ind1);    %get height of character
    error=Height(2)-Height(1); %error value of height
    HRange=[HChar-(error/2) HChar+(error/2)]; %calculate range of height for characters
    Index=[];
    for i=1:size(Box,1)
        if Box(i,4)>=HRange(1) && Box(i,4)<=HRange(2) 
            Index=[Index i]; %if meet requirement, add index to vector
        end
    end
elseif length(ind2)==1
    HChar=Product(ind2); %get height of character
    error=Product(2)-Product(1);%error value of height
    HRange=[HChar-(error/2) HChar+(error/2)]; %calculate range of height for characters
    Index=[];
    for i=1:size(Box,1)
        if Box(i,5)>=HRange(1) && Box(i,5)<=HRange(2) 
            Index=[Index i];%if meet requirement, add index to vector
        end
    end   
elseif isempty(ind1) || length(ind1)>1 
    [Freq3,y]=hist(Box(:,2),20); 
    ind2=find(Freq3==NC);

    if length(ind2)==1
        HChar=y(ind2); %get height of character
        error=y(2)-y(1);%error value of height
        HRange=[HChar-(error/2) HChar+(error/2)];  %calculate range of height for characters
        Index=[];
        for i=1:size(Box,1)
            if Box(i,2)>=HRange(1) && Box(i,2)<=HRange(2) 
                Index=[Index i];%if meet requirement, add index to vector
            end
        end   
    end
end
end


