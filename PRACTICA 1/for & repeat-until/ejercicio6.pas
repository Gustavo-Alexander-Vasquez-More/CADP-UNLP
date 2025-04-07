//6. Realizar un programa que lea información de 200 productos de un supermercado. 
//De cada producto se lee código y precio (cada código es un número entre 1 y 200). 
//Informar en pantalla:
//● Los códigos de los dos productos más baratos.
//● La cantidad de productos de más de 16 pesos con código par.

program ejercicio6;
var
  i, codigo, precio, minPrice1, minPrice2, codigo1, codigo2, productosCumple:integer;
begin

  minPrice1:=9999;
  minPrice2:=9999;
  codigo1:=0;
  codigo2:=0;
  productosCumple:=0;
  
  for i:=1 to 200 do
  begin
    Writeln('Ingrese un codigo del producto que esté entre el 1 y el 200: ');
    Readln(codigo);
    Writeln('Ingrese el precio del producto: ');
    Readln(precio);
    if((codigo MOD 2 = 0) and (precio > 16)) then
      productosCumple:=productosCumple + 1;
    if(precio < minPrice1) then
    begin
      minPrice2:=minPrice1;
      minPrice1:=precio;
      codigo2:=codigo1;
      codigo1:=codigo;
    end
    else
      if(precio < minPrice2) then
      begin
        minPrice2:=precio;
        codigo2:=codigo;
      end;
  end;
  
  Writeln('Los códigos de los dos productos más baratos son: ',codigo1,' y ',codigo2);
  Writeln('La cantidad de productos de más de 16 pesos con código par son: ',productosCumple)
end.