//Defining the INPUT values
d=105;
h=19;
a2=118.72;
a1=18;
b2=36.22;
hk=17;
lk=117.5;

//Calculation Formulae
b1=sqrt(d^2+h^2);
gam=atand(h/d);
del=atand(hk/lk);

//Cases: 1.Angle ß >= Angle -γ  2.Angle ß < Angle -γ 
function alp=f(bet)
    gam1=180-gam-bet;
    c1=sqrt(a1^2+b1^2-2*a1*b1*cosd(gam1));
    alp1=acosd((c1^2+b1^2-a1^2)/(2*c1*b1));
    bet2=acosd((a2^2+c1^2-b2^2)/(2*a2*c1));
    if(bet>=-gam) then
        alp=alp1+bet2-gam-del;
    else
        alp=-alp1+bet2-gam-del;
    end
endfunction

f(30)

