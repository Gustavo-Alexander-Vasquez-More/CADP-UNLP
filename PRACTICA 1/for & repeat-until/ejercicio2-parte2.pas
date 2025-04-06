//2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
//a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el
//número de orden, dentro de la secuencia, en el que fue leído.

program ejercicio2;
var 
  i, num, mayor, posicion : integer;
begin
  Writeln('Escriba un numero: ');
  Readln(num);
  mayor:=num;
  posicion:=1;
  for i:=2 to 10 do
  begin
    Writeln('Escriba un numero: ');
    Readln(num);
    if(num > mayor) then
      begin
        mayor:=num;
        posicion:=i;
      end;
  end;
  Writeln('El mayor numero leído fue el ',mayor, ', en la posición', posicion);
end.
