function f = pavement(T)	
%PAVEMENT f is an overall model of the heat (Q, in Wals) 
%entering and leaving the surface of a road at a temperature T (in Celsius). 
%This function outputs the heat on the surface of a road for a given T.
qsun=650;
qair=(15).*(T-32);
qsky=(5.103e-08).*(((T+273).^4)-((27+273).^4));
f=qsun-qair-qsky;
end
