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

//Defining the Beta values range
bet=linspace(-300,300);

//Linear Approximation
alp=(a1/a2)*bet;
plot(bet,alp)

//Cases based on angle α1
function alp=f(bet)
    gam1=180-gam-bet;
    c1=sqrt(a1^2+b1^2-2*a1*b1*cosd(gam1));
    alp1=acosd((c1^2+b1^2-a1^2)/(2*c1*b1));
    bet2=acosd((a2^2+c1^2-b2^2)/(2*a2*c1));
    if((bet>=-gam && bet<=(180-gam))||(bet>=-300 && bet<=(-180-gam))) then
        alp=alp1+bet2-gam-del;
    else
        alp=-alp1+bet2-gam-del;
    end
endfunction
plot(bet,f,'r')

legend('Linear Approximation: α=(a1/a2)ß','α =f(ß) from (-300 to 300)', 'in_lower_right') 
xtitle('Graph α =f(ß)','ß','α') 
set(gca(),"grid",[1,1]) 
