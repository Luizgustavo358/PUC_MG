program soma;

var
    X : integer;
    A : integer;
    B : integer;

begin
    (* lendo do teclado *)
    write('A = ');
    readln(A);
    write('B = ');
    readln(B);

    (* fazendo soma *)
    X := A + B;

    (* mostrando na tela *)
    writeln('X = ', X);
end.
