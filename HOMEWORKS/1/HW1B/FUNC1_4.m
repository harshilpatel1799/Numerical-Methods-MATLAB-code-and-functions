function C = FUNC1_4(A,B,option)
% FUNC1_4-This functon will take inputs A and B (vectors or matrices of	any size but never scalar) 
% and option (scalar number from 1 to 3)	
% and create the output matrix C where: 
% C = A + B, if option = 1,
% C = A .* B, if option = 2,	
% C = A * B, if	option = 3.	

if((option==1 || option==2) & (size(A)==size(B))) %proceeds to dertime C if option=1 or =2 are selected and there are no inconsistencies in the size of A and B, such that C can be validly evaluated
    C=zeros(size(A)); % create an emepty vector that is size of A or B to later input matrix C elements.
    if option==1 %creates matrix C that is the addtion of A & B if sizes of inputs match.
        for i= 1:size(A,1)  
            for j= 1:size(B,1)      
                C(i,j)= A(i,j)+B(i,j);
            end
        end 
    else %creates matrix C that is the element by element multiplication of A & B if sizes of inputs match - option=2 chosen
        for i= 1:size(A,1)  
            for j= 1:size(B,1)      
                C(i,j)= A(i,j)*B(i,j);
            end
        end   
    end    
elseif((option==3) && (size(A,2)==size(B,1))) %checks to see if no inconsistencies in the size of A and B if option=3, such that C can be validly evaluated if C is the matrix product of A & B 
    C=zeros(size(A,1),size(B,2)); % create an emepty vector that is size of the matrix product of A & B to later input matrix C elements.
    for i= 1:size(A,1)  
           for j= 1:size(B,2) 
               for k= 1:size(A,2)
                   C(i,j) = C(i,j)+(A(i,k)*B(k,j));
               end
           end
    end
else 	%if the user fuction inputs cannot create a valid matrix c due to inconsistency	in the size of A and B.
    C = 'No good! Garbage.';
end