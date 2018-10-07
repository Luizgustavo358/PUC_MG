program exFunction;
var
   a, b, ret : integer;

(* definicao da funcao max() *)
function max(num1, num2: integer): integer;
var
   (* declaracao local *)
   result: integer;

begin
   if (num1 > num2) then
      result := num1
   
   else
      result := num2;

   max := result;
end;

begin
   a := 100;
   b := 200;

   (* chamada da funcao max() *)
   ret := max(a, b);
   
   (* Escreve o valor maximo *)
   writeln( 'Max value is : ', ret );
end.
