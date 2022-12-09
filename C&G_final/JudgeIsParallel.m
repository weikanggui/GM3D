function flag=JudgeIsParallel(a,b)
%flag=1 正向面不相等
%flag=2 负向面不相等
%flag=0 两面均相等
if a(1)-mean(a)||a(2)-mean(a)||a(3)-mean(a)||a(4)-mean(a)
    flag=1;
else
    if b(1)-mean(b)||b(2)-mean(b)||b(3)-mean(b)||b(4)-mean(b)
        flag=2;
    else
        flag=0;
    end
end
end