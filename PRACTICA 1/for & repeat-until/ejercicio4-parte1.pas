//4. Realizar un programa que lea 1000 números enteros desde teclado. 
//Informar en pantalla cuáles son los dos números mínimos leídos.

program ejercicio4;
var
  i, num, min1, min2:integer;
begin

  min1:=9999;
  min2:=9999;
  
  for i:= 1 to 10 do
  begin
    Writeln('(',i,'/10) Ingrese un numero:');
    Readln(num);
    
    if(num < min1) then
    begin
      min2:=min1;
      min1:=num;
    end
    
    else
      if(num < min2) then
        min2:=num;
  end;
  
  Writeln('Los numeros minimos leídos son: ',min1,' y ',min2)
  
end.
