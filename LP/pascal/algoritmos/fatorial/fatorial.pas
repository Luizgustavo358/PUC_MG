Program fatorial;

Var
    n : Integer;
    nr : Integer;
    fat : Longint;

begin
    Write('Informe o Fatorial: ');
    Readln(nr);

    fat := 1;

    For n := 1 to nr do
    begin
        fat := fat * n;
    end;

    Writeln('O Fatorial de ', nr, ' = ', fat);
end.
