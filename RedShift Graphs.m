load StarData
nObs = size(spectra,1);
lambdaStart = 630.02;
lambdaDelta = 0.14;
lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta;
lambda = (lambdaStart:lambdaDelta:lambdaEnd)' ;
[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458;
for v=1:7
    s= spectra(:,v);
    if speed(v)<=0
        loglog(lambda,s,"--")
    else
        loglog(lambda,s,"LineWidth",3)
    end
    hold on;
end
hold off;
legend(starnames);
movaway = starnames(speed > 0); 


