f0 = 0;
f1 = 1.5;
f2 = ;

fecundity = [f0, f1, f2];

s0 = .5;
s1 = .3;

survival = [s0, 0, 0];
survival = [survival; 0, s1, 0];

Leslie = [fecundity; survival];

n0 = 1000;
n1 = 0;
n2 = 0;

Population = [n0; n1; n2];
time = [];
final_pop = [];

for t = 0:100
    time = [time, t];
    final_pop = [final_pop, sum(Population)];
    Population = Leslie*Population;
end

figure
plot(time, final_pop);
title('Population Plot');
xlabel('Time (t)');
ylabel('Total Population');

