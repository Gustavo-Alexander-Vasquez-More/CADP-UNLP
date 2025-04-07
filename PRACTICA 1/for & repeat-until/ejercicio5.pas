//5. Realizar un programa que lea números enteros desde teclado. 
//La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse.
//Informar en pantalla:
//● El número máximo leído.
//● El número mínimo leído.
//● La suma total de los números leídos
program ejercicio5;
var
  num, max, min, suma:integer;
begin

  min:=9999;
  max:=-9999;
  suma:=0;
  
  repeat
    Writeln('Ingrese un numero:');
    Readln(num);
    suma:=suma + num;
    if(num < min) then
      min:=num;
    if(num > max) then
      max:=num
  until num = 100;
  
  Writeln('El numero maximo leido fue el: ',max);
  Writeln('El numero minimo leido fue el: ',min);
  Writeln('La suma de los numeros leidos fue: ',suma);
  
end.
