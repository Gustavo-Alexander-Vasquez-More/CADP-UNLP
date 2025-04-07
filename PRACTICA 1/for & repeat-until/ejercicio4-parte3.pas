//4. Realizar un programa que lea 1000 números enteros desde teclado. 
//Informar en pantalla cuáles son los dos números mínimos leídos.
//b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
//número 0, el cual no debe procesarse
program ejercicio4;
var
  num, min1, min2:integer;
begin

  min1:=9999;
  min2:=9999;
  Writeln('Ingrese un numero:');
  Readln(num);
  
  while (num <> 0)do
    begin
      if(num < min1) then
        begin
          min2:=min1;
          min1:=num;
        end
      else
        if(num < min2) then
          min2:=num;
      Writeln('Ingrese un numero:');
      Readln(num);
    end;
  Writeln('Los numeros minimos leídos son: ',min1,' y ',min2)
  
end.
