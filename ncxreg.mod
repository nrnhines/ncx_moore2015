TITLE sodium calcium exchange
: taken from jwm simulation
: 4 - 1 stoichiometry : added kcra suggested by Luis Beague Feb 2012


NEURON {
SUFFIX ncx
USEION ca READ eca, cai WRITE ica
USEION na READ ena WRITE ina
RANGE k, ica, ina, ex, kcra
GLOBAL n
}

UNITS {
(mA) = (milliamp)
(mV) = (millivolt)
(mM) = (milli/liter)
}

PARAMETER {
k = .0002 (S/cm2) <0,1e6>: at 6.3 deg. Q10 of 3
kcra = 0.0002 (mM) <0,1e9>
n = 4
}

ASSIGNED {
celsius (degC)
v (mV)
eca (mV)
ena (mV)
ica (mA/cm2)
ina (mA/cm2)
cai (mM)
ex (mV)
}

LOCAL s_celsius, Q

BREAKPOINT {LOCAL kca
if (s_celsius*1(degC) != celsius) {
s_celsius = celsius
Q = 3^((celsius - 6.3)/10 (degC))
}
ex = (n*ena - 2*eca)/(n - 2)
ina = 2*k*Q*(v - ex) * cai / (kcra + cai)
ica = -2*ina/n
}
