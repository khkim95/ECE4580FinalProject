function letter=compare(Character)
load NewTemplates 
Character=imresize(Character,[42 24]); 
Correlation=[ ];
for n=1:length(NewTemplates)
    Cor=corr2(NewTemplates{1,n},Character);
    Correlation=[Correlation Cor];
end
Index=find(Correlation==max(Correlation)); 
if Index==1 || Index==2
    letter='A';
elseif Index==3 || Index==4
    letter='B';
elseif Index==5
    letter='C';
elseif Index==6 || Index==7
    letter='D';
elseif Index==8
    letter='E';
elseif Index==9
    letter='F';
elseif Index==10
    letter='G';
elseif Index==11
    letter='H';
elseif Index==12
    letter='I';
elseif Index==13
    letter='J';
elseif Index==14
    letter='K';
elseif Index==15
    letter='L';
elseif Index==16
    letter='M';
elseif Index==17
    letter='N';
elseif Index==18 || Index==19
    letter='O';
elseif Index==20 || Index==21
    letter='P';
elseif Index==22 || Index==23
    letter='Q';
elseif Index==24 || Index==25
    letter='R';
elseif Index==26
    letter='S';
elseif Index==27
    letter='T';
elseif Index==28
    letter='U';
elseif Index==29
    letter='V';
elseif Index==30
    letter='W';
elseif Index==31
    letter='X';
elseif Index==32
    letter='Y';
elseif Index==33
    letter='Z';
    %*-*-*-*-*
% Numerals listings.
elseif Index==34
    letter='1';
elseif Index==35
    letter='2';
elseif Index==36
    letter='3';
elseif Index==37 || Index==38
    letter='4';
elseif Index==39
    letter='5';
elseif Index==40 || Index==41 || Index==42
    letter='6';
elseif Index==43
    letter='7';
elseif Index==44 || Index==45
    letter='8';
elseif Index==46 || Index==47 || Index==48
    letter='9';
else
    letter='0';
end
end

