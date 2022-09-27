
%Problem 1_    % assuming | is not part of input text. 
m =[1 -1 3 -2;2 -1 0 -1; 7 -5 10 -6; 1 0 -2 4]; % matrics 3
s ='Have you seen sparky today?yes,at the Sun Devil Stadium.';
[sencrypt,sdecrypt]= q_1225551925(s,m)
% disp(sencrypt)
% disp(sdecrypt)
%start code
function[sencrypt,sdecrypt]= q_1225551925(s,m)


key_1 = m;
text = s;

sencrypt=encrypt(text,key_1);
sdecrypt=decrypt(sencrypt,key_1);

%  disp(sencrypt)
% disp(sdecrypt)
function new_code=encrypt(text,key)  % start Encryption
%text = input('input text...\n','s');
text_length=size(text);
key_length=size(key);
pad_char='|';              % assuming | is not part of input text.          
while mod(text_length(2),key_length(2)) ~= 0
   text = append(text,pad_char);
   text_length=size(text);
end
new_matrix_col= text_length(2)/key_length(2);
a = double(text);
b = reshape(a,key_length(2),new_matrix_col);
code = mod(key*(b-32) ,95) + 32;
new_code = reshape(code,1,length(text));
new_code = char(new_code);

end  

function new_msg=decrypt(scode,key)   % start Decryption
code_length=size(scode);
key_length=size(key);
column_length=code_length(2)/key_length(2);
a = double(scode);
b = reshape(a,key_length(2),column_length);
msg = round(mod(inv(key)*(b-32),95)+32);
new_msg = char(reshape(msg,1,code_length(2)));
new_msg = extractBefore(new_msg,"|");
end
end 

