f0 = 0; % Under 5 years
f1 = 0; % 5 to 9 years
f2 = 0; % 10 to 14 years
f3 = 5*(29.3/2000); % 15 to 19 years
f4 = 5*(87.3/2000); % 20 to 24 years
f5 = 5*(96.6/2000); % 25 to 29 years
f6 = 5*(82.7/2000); % 30 to 34 years
f7 = 5*(50.7/2000); % 35 to 39 years
f8 = 5*(12.6/2000); % 40 to 44 years
f9 = 0; % 45 to 49 years
f10 = 0; % 50 to 54 years
f11 = 0; % 55 to 59 years
f12 = 0; % 60 to 64 years
f13 = 0; % 65 to 69 years
f14 = 0; % 70 to 74 years
f15 = 0; % 75 to 79 years
f16 = 0; % 80 to 84 years
f17 = 0; % 85 years and over

fecundity = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10];
fecundity = [fecundity, f11, f12, f13, f14, f15, f16, f17];

s0 = 0.998645388365398; % survival rate (under 5) -> (5 to 9)
s1 = 0.999889771595246; % survival rate (5 to 9) -> (10 to 14)
s2 = 0.999853365016549; % survival rate (10 to 14) -> (15 to 19)
s3 = 0.999572284333325; % survival rate (15 to 19) -> (20 to 24)
s4 = 0.999160798626925; % survival rate (20 to 24) -> (25 to 29)
s5 = 0.999022739666083; % survival rate (25 to 29) -> (30 to 34)
s6 = 0.998839751270645; % survival rate (30 to 34) -> (35 to 39)
s7 = 0.998680501864206; % survival rate (35 to 39) -> (40 to 44)
s8 = 0.998089748275858; % survival rate (40 to 44) -> (45 to 49)
s9 = 0.997180890703435; % survival rate (45 to 49) -> (50 to 54)
s10 = 0.995218162962133; % survival rate (50 to 54) -> (55 to 59)
s11 = 0.992509307872618; % survival rate (55 to 59) -> (60 to 64)
s12 = 0.989334831100438; % survival rate (60 to 64) -> (65 to 69)
s13 = 0.982766910518901; % survival rate (65 to 69) -> (70 to 74)
s14 = 0.974254718012159; % survival rate (70 to 74) -> (75 to 79)
s15 = 0.962184783804411; % survival rate (75 to 79) -> (80 to 84)
s16 = 0.940039283850632; % survival rate (80 to 84) -> (85 and over)

survival = [s0, zeros(1, 17)];
survival = [survival; zeros(1,1), s1, zeros(1, 16)];
survival = [survival; zeros(1,2), s2, zeros(1, 15)];
survival = [survival; zeros(1,3), s3, zeros(1, 14)];
survival = [survival; zeros(1,4), s4, zeros(1, 13)];
survival = [survival; zeros(1,5), s5, zeros(1, 12)];
survival = [survival; zeros(1,6), s6, zeros(1, 11)];
survival = [survival; zeros(1,7), s7, zeros(1, 10)];
survival = [survival; zeros(1,8), s8, zeros(1, 9)];
survival = [survival; zeros(1,9), s9, zeros(1, 8)];
survival = [survival; zeros(1,10), s10, zeros(1, 7)];
survival = [survival; zeros(1,11), s11, zeros(1, 6)];
survival = [survival; zeros(1,12), s12, zeros(1, 5)];
survival = [survival; zeros(1,13), s13, zeros(1, 4)];
survival = [survival; zeros(1,14), s14, zeros(1, 3)];
survival = [survival; zeros(1,15), s15, zeros(1, 2)];
survival = [survival; zeros(1,16), s16, zeros(1, 1)];

Leslie = [fecundity; survival];

n0 = 20201362; % Under 5 years
n1 = 20348657; % 5 to 9 years
n2 = 20677194; % 10 to 14 years
n3 = 22040343; % 15 to 19 years
n4 = 21585999; % 20 to 24 years
n5 = 21101849; % 25 to 29 years
n6 = 19962099; % 30 to 34 years
n7 = 20179642; % 35 to 39 years
n8 = 20890964; % 40 to 44 years
n9 = 22708591; % 45 to 49 years
n10 = 22298125; % 50 to 54 years
n11 = 19664805; % 55 to 59 years
n12 = 16817924; % 60 to 64 years
n13 = 12435263; % 65 to 69 years
n14 = 9278166; % 70 to 74 years
n15 = 7317795; % 75 to 79 years
n16 = 5743327; % 80 to 84 years
n17 = 5493433; % 85 and over

Population = [n0; n1; n2; n3; n4; n5; n6; n7; n8; n9; n10];
Population = [Population; n11; n12; n13; n14; n15; n16; n17];
time = [];
final_pop = [];

for t = 0:(80/5)
    time = [time, t];
    final_pop = [final_pop, sum(Population)];
    Population = Leslie*Population;
end

figure
plot(time.*(5), final_pop);
title('US Population Estimation');
xlabel('Time (years since 2010)');
ylabel('Total Population');

