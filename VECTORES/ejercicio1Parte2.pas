//a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor n y retorne si n se encuentra en el vector o no.
//b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera ascendente.
program ejercicio1Parte2;
const dimF=500;
type
  vector=array[1..dimF] of integer;
procedure cargarVector(var vectorEnteros:vector, var dimL:integer); //se dispone y solo se escribe la cabecera
//inciso a:
function encontrarElemento(vectorEnteros:vector; n, dimL:integer):boolean;
var 
  i:integer;
  encontre:boolean;
begin
  i:=0;
  encontre:=false;
  while((i < dimL) AND (NOT encontre)) do begin //es mejor usar un while que un for porque el for me obliga a recorrer todo en cambio el while corta cuando encuentra el elemento
    i:=i+1;
    if(vectorEnteros[i] = n) then
      encontre:=true;
  end;
  encontrarElemento:=encontre;
end;
//inciso b:
function busquedaDicotomica(vectorEnteros:vector; n, dimL:integer):boolean;
var 
  inf, sup, medio:integer;
  encontre:boolean;
begin
 encontre:=false;
 inf:=1;
 sup:=dimL;
 medio:=(inf + sup) DIV 2;
 while ((n <> vectorEnteros[medio]) AND inf <=sup) do begin
   if(n < vectorEnteros[medio]) then
     sup:=medio - 1
   else
     inf:=medio + 1;
   medio:=(inf + sup) DIV 2
 end;
 if((inf <=sup) AND (n = vectorEnteros[medio])) then
   encontre:=true;
 busquedaDicotomica:=encontre;
end;
var
  vectorEnteros:vector;
  dimL, n:integer;
begin
  dimL:=0;
  cargarVector(vectorEnteros, dimL);
  if (dimL > 0) then begin
    Readln(n);
    if (NOT encontrarElemento(vectorEnteros, n, dimL)) then
      Writeln('No se encontro el elemento n en el vector')
    else
      Writeln('El elemento n si se encontró en el vector');
    if (NOT busquedaDicotomica(vectorEnteros, n, dimL)) then
      Writeln('No se encontro el elemento n en el vector')
    else
      Writeln('El elemento n si se encontró en el vector');
  end
  else
    Writeln('El vector está vacio, finalizando el programa ....');
end.
