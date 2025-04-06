//1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
//a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.


program ejercicio1;
var 
  i, suma, num, cantMayores : integer;
begin
 cantMayores:=0;
 Writeln('Escriba un numero: ');
 Readln(num);
 if(num > 5) then
   cantMayores:=cantMayores + 1;
 suma:=num;
 for i:=1 to 9 do
 begin
   Writeln('Escriba un numero: ');
   Readln(num);
   if(num > 5) then
     cantMayores:=cantMayores + 1;
   suma:=suma + num;
 end;
 Writeln('La suma de los numeros es: ',suma);
 Writeln('La cantidad de numeros mayores a 5 fue: ',cantMayores);
end.
