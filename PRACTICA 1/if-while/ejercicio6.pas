//6. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
//La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. 
//Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
//Por ejemplo:
//* Si se ingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir:
//El aumento de precio del producto 10382 no supera el 10%
//* Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir:
//El aumento de precio del producto 32767 es superior al 10%”

program ejercicio6;
var
  codigoProducto : integer;
  precioActual, nuevoPrecio : real;
begin

  Writeln('Escriba el codigo del producto: ');
  Readln(codigoProducto);
  
  while (codigoProducto <> 32767) do
  begin
    Writeln('Escriba el precioActual: ');
    Readln(precioActual);
    Writeln('Escriba el nuevo precio: ');
    Readln(nuevoPrecio);
    if ((((nuevoPrecio - precioActual)/precioActual)*100) > 10) then
      Writeln('El aumento de precio del producto ',codigoProducto,' es superior al 10%')
    else
      Writeln('El aumento de precio del producto ',codigoProducto, ' no supera el 10%');
    Writeln('Escriba el codigo del producto: ');
    Readln(codigoProducto);
  end;
  
  if(codigoProducto = 32767) then
  begin
    Writeln('Escriba el precioActual: ');
    Readln(precioActual);
    Writeln('Escriba el nuevo precio: ');
    Readln(nuevoPrecio);
    if  ((((nuevoPrecio - precioActual)/precioActual)*100) > 10) then
      Writeln('El aumento de precio del producto ',codigoProducto,' es superior al 10%')
    else
      Writeln('El aumento de precio del producto ',codigoProducto, ' no supera el 10%');
  end;
end.
