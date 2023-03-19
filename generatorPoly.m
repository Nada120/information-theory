% Encode linear block code with g(x) (Task 1)

syms x
gpoly = input('Enter the g(x) matrix in polynomial form: ');
m = input('Enter the message: ');
k = length(m);

% To but the power of the equation in as a vector
[qpoly, rpoly] = coeffs(gpoly);

for i=1:1:length(rpoly)
    for j=0:1:20
        if (x^j == rpoly(i))
            polyVector(i) = j;
        end
    end
end

% z represent the n-k
z = max(polyVector);
n = z+k;

% The process of divide X^i by g(x) where i=n-k,...,n-1 
for i=1:1:k
    Xi = x^(z+i-1);
    
    % The process of division
    [q,r] = quorem(Xi,gPoly);
    
    % r represent the remainder 
    r = r+Xi;
    
    % To Get the each x of the equation 
    [qcoeff, rcoeff] = coeffs(r);
    
    % To get the power of each x and represent in vector
    for j=1:1:length(rcoeff)
        for b=0:1:20
            if (x^b == rcoeff(j))
                xEquation(j) = b;
            end
        end
    end
    
    % The process of making  binary generator matrix
    eqBinary = gfrepcov(xEquation(1,1:length(rcoeff)));
    for a=1:1:length(eqBinary)
        gBinary(i,a) = eqBinary(a);
    end
end

% will display the binary generator matrix
disp(gBinary);

% The process of encoding message
v = encode(m,n,k,'linear/binary',gBinary);

disp('The encode message is: ');
disp(v);
