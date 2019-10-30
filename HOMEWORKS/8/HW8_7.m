%%%%%%%%%DISCRETE FOURIER DECOMPOSITION %%%%%%%%%%%%%%%%%%%
%% SET UP DISCRETE DATA POINTS IN MATLAB AND CONDUCT DISCRETE FOURIER ANALYSIS(DFT):
period=2; % PERIOD OF EXACT F(T)
N2=200; %100 Hz data
N=100;
tj=0:(1/100):2-(1/100); %frequency of 100 Hz data collection
fj=(2*(tj>0.75 & tj<=1.25))+(1*(tj<=0.75 | tj>1.25)); %creates approppaite data points
F=fft(fj); % F is of size 4, fft is MATLAB Command to do DFT.
%% TRANSFORM MATLAB DFT INTERPERATION INTO FOURIER TRANSFORMATION COEFFICIENTS(x100):
%Ak is vector of size 100 containling all Ak coefficeints for 1<=k<=N,
%Bk is vector of size 101 containling all Bk coefficeints for 0<=k<=N,
Bk=zeros(1,N+1); % create Ak and Bk vector to store and intialize coefficient elements
Ak=zeros(1,N);
Ak(N)=0; % Ao & An are both zero
Bk(1)=F(1)/N2; %Bo is first coefficient of Bk
Bk(N+1)=F(N+1)/N2; %Bn is last coefficient of Bk
for k=1:(N-1)
    Bk(k+1)=real(F(k+1))/N;
    Ak(k)=-imag(F(k+1))/N;
end
%% STEM PLOT TO VISUALIZE THE FOURIER SERIES TRANSFORMATION COEFFICIENTS:
kp=-N:N; %shows coeeficients of Ak and Bk Fourrier Series on differing sides with correct length of N for both.
%Ak=[0,Ak]; % adds Ao=0 to Ak vector to plot stem plot;
stem(kp,[fliplr(Ak),Bk]) % overall fourier series coefficients displayed.
print -dpdf HW8_7stem.pdf
%% INVERSE FOURIER TRANSFORMATION - TO RECONTRUCT F(tj):
t=linspace(0,period,6000); % plot t for more finely-spaced vector
finv=Bk(1)*ones(size(t));
% Recontruct an approximation of f(t) over 1 peiod using Ak and Bk coefficients
for k=1:N %adds up all the sinsuisoids.
    finv=finv+(Ak(k)*sin((2*pi*k/period)*t)+Bk(k+1)*cos((2*pi*k/period)*t));
end
%% PLOT FOURUER APPROXIMATION OF F(T) WITH EXACT F(T) OVER 1 PERIOD
figure
f_exact=(2*(t>0.75 & t<=1.25))+(1*(t<=0.75 | t>1.25)); %orginal f(T) FUCTION OVER 1 PERIOD
plot(t,f_exact,'-k',t,finv,'--r',tj,fj,'or'); % PLOT ORGINAL WITH SUPER IMPOSED DISCRTE DATE POINTS AND THEN APPROXIMATED F(T) WITH FOURIER SERIES
print -dpdf HW8_7ift.pdf