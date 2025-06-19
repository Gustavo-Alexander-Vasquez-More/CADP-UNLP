5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.

program ejercicio5;
type
  producto=record
    codigo:integer;
    descripcion:string;
    stockAct:integer;
    stockMin:integer;
    precio:real;
  end;
  list=^nodo;
  nodo=record
    dato:producto;
    sig:list;
  end;
procedure crearLista(var pri:list);
begin
  pri:=nil;
end;
procedure leerProducto(var cod, sAct, sMin:integer; var price:real; var desc:string);
begin
  Writeln('Ingrese el  codigo del producto'); Readln(cod);
  Writeln('Ingrese la descripcion del producto'); Readln(desc);
  Writeln('Ingrese el Stock Actual'); Readln(sAct);
  Writeln('Ingrese el Stock Minimo'); Readln(sMin);
  Writeln('Ingrese el precio del producto'); Readln(price);
end;
procedure cargarLista(var pri:list; cod, sAct, sMin:integer; price:real; desc:string);
var 
  nuevo:list;
begin
  new(nuevo); nuevo^.dato.codigo:=cod; nuevo^.dato.stockAct:=sAct; nuevo^.dato.stockMin:=sMin; nuevo^.dato.precio:=price; nuevo^.dato.descripcion:=desc; nuevo^.sig:=nil;
  if(pri = nil) then
    pri:=nuevo
  else begin
    nuevo^.sig:=pri;
    pri:=nuevo;
  end;
end;
//INCISO A
function porcentaje(pri:list):real;
var cumplen, total:integer;
begin
  total:=0;
  cumplen:=0;
  while(pri <> nil) do begin
    total:=total + 1;
    if(pri^.dato.stockAct < pri^.dato.stockMin) then
      cumplen:=cumplen + 1;
    pri:=pri^.sig;
  end;
  if(total = 0) then
    porcentaje:=0
  else
    porcentaje:=(cumplen * 100) / total;
end;
//INCISO B 
procedure informarDescripcion(pri:list);
var
  digitosPares, codigo, dig:integer;
begin
  while(pri <> nil) do begin
    digitosPares:=0;
    codigo:=pri^.dato.codigo;
    while(codigo <> 0) do begin
      dig:=codigo MOD 10; //obtiene el ultimo digito
      if((dig MOD 2) = 0) then
        digitosPares:=digitosPares + 1;
      codigo:=codigo DIV 10; //quitar el ultimo digito
    end;
    if(digitosPares >= 3) then
      Writeln(pri^.dato.descripcion);
    pri:=pri^.sig;
  end;
end;
//INCISO C 
procedure informarCodigo(pri:list);
var
  min1, min2, codMin1, codMin2:integer;
begin
  min1:=9999;
  min2:=9999;
  codMin1:=0;
  codMin2:=0;
  while(pri <> nil) do begin
    if(pri^.dato.precio < min1) then begin
      min2:=min1;
      codMin2:=codMin1;
      min1:=pri^.dato.precio;
      codMin1:=pri^.dato.codigo;
    end
    else if(pri^.dato.precio < min2) then begin
      min2:=pri^.dato.precio;
      codMin2:=pri^.dato.codigo;
    end;
    pri:=pri^.sig;
  end;
  Writeln(codMin1);
  Writeln(codMin2);
end;
//VARIABLES LOCALES DEL PROGRAMA
var
  pri:list;
  cod, sAct, sMin:integer;
  price:real;
  desc:string;
begin
  crearLista(pri);
  leerProducto(cod, sAct, sMin, price, desc);
  while(cod <> -1) do begin
    cargarLista(pri, cod, sAct, sMin, price, desc);
    leerProducto(cod, sAct, sMin, price, desc);
  end;
  Writeln('El porcentaje de productos los cuales su stock actual es menor que su stock minimo es: ', porcentaje(pri), '%');
  informarDescripcion(pri);
  informarCodigo(pri);
end.
