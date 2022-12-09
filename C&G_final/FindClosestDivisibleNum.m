function division=FindClosestDivisibleNum(Dividend,Divisor)
%求距离Dividend最近的，可以被Divisor整除的数
remainder=mod(Dividend,Divisor);
if remainder==0
    division=Dividend;
elseif remainder>=Divisor/2
    division=Dividend+(Divisor-remainder);
elseif remainder<Divisor/2
    division=Dividend-remainder;
end