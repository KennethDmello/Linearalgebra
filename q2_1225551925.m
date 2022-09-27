%% Problem 2 both A & B
%% Input matrix coefficent as A
%%% Code starts %%%%
function[L,U]= q2_1225551925(A) 
% B = [ 2 0 2 -1; 4 -2 -3 6; 3 -5 6 3; 0 2 7 -8; 17 -11 -1 20; 1 7 5 -13]; %Matrix A
[M , N] = size(A);           
L=eye(M);                            %% diagonal elements='1'
U=A;
%fill = 0;
%%Fill the upper and lower matrices

for k=1:N
        for j=2+(k-1):M 
          if (U(k,k)==0)         %% warning and stop for row exchange
               % fprintf('row exchange requide for the matrix')
            return
          end

        U(j,:)= U(j,:)- (U(k,:)/U(k,k))*U(j,k);
        L(j,k)= L(j,k)+ (L(k,k))*(A(j,k)/A(k,k));
        A=U;
  %%Result
 %L 
  %U
end
    end
%%% Code ends %%%%