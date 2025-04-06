//2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.

program ejercicio2;
var 
  i, num, mayor : integer;
begin
  Writeln('Escriba un numero: ');
  Readln(num);
  mayor:=num;
  for i:=1 to 9 do
  begin
    Writeln('Escriba un numero: ');
    Readln(num);
    if(num > mayor) then
      mayor:=num;
  end;
  Writeln('El mayor numero leido fue el ',mayor)
end.
