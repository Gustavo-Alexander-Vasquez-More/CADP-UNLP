//4. Realizar un programa que lea 1000 números enteros desde teclado. 
//Informar en pantalla cuáles son los dos números mínimos leídos

program ejercicio4;
var
  i, num, min1, min2: integer;
begin
  min1:=99999;
  min2:=99999;
  Writeln('Ingrese un numero');
  Readln(num);
  min1:=num;
  for i:=2 to 1000 do
  begin
    Writeln('Ingrese un numero');
    Readln(num);
    if(num < min1) then
    begin
     min2:=min1;
     min1:=num;
    end
    else
    begin
    if (num < min2) then
      min2:=num;
    end;
  end;
   Writeln('Los dos numeros minimos leidos son el ',min1,' y el ',min2);
end.