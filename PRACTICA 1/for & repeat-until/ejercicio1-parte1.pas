//1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.

program ejercicio1;
var 
  i, suma, num : integer;
begin
 suma:=0;
 for i:=1 to 10 do
 begin
   Writeln('Escriba un numero: ');
   Readln(num);
   suma:=suma + num;
 end;
 Writeln('La suma de los numeros es: ',suma)
end.
