//8. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta).
//si se ingresa otro carácter, debe informar un error y finalizar. 
//Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0. 
//El programa deberá aplicar la operación leída con la secuencia de números, e imprimir el resultado final.
//Por ejemplo:
//* Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
//* Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir: 0 (-10 + 5 + 6 + (-1))
program ejercicio7;
var 
  caracter : char;
  operacion, num : integer;
begin
  Writeln('Escribe + o - : ');
  Readln(caracter);
  if ((caracter = '+') or (caracter = '-')) then
  begin
   Writeln('Ingrese un numero');
   Readln(num);
   operacion:=num;
   Writeln('Ingrese un numero');
   Readln(num);
   while (num <> 0) do
   begin
     if(caracter = '+') then
       operacion:=operacion + num
     else
       operacion:=operacion - num;
     Writeln('Ingrese un numero');
     Readln(num);
   end
  end
  else
    Writeln('Error');
  Writeln('El resulado es: ', operacion);
end.
