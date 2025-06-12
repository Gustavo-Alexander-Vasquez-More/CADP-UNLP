//5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde teclado (a lo sumo 100) y los almacene en un vector. 
//La carga finaliza al leer el número 0. 
//Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la operación realizada de la siguiente manera: 
//“El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
program Hello;
const dimF=100;
type
  vector=array[1..dimF] of integer;
procedure cargarVector(var arreglo:vector, var dimL:integer);
var num:integer;
begin
  Writeln('Ingrese un numero mayor');Readln(num);
  while((dimL < dimF) AND (num <> 0)) do begin
    dimL:=dimL + 1;
    arreglo[dimL]:=num;
    Writeln('Ingrese un numero');Readln(num);
  end;
end;
function elementoMaximo(arreglo:vector, dimL:integer):integer;
var i, maximo, posicionDelMaximo:integer;
begin
  maximo:=-9999;
  posicionDelMaximo:=1;
  for i:=1 to dimL do begin
    if(arreglo[i] > maximo) then begin
      maximo:=arreglo[i];
      posicionDelMaximo:=i;
    end;
  end;
  elementoMaximo:=posicionDelMaximo;
end;
//f. elementoMinimo: retorna la posicion del menor elemento del vector
function elementoMinimo(arreglo:vector, dimL:integer):integer;
var i, minimo, posicionDelMinimo:integer;
begin
  minimo:=9999;
  posicionDelMinimo:=1;
  for i:=1 to dimL do begin
    if(arreglo[i] < minimo) then begin
      minimo:=arreglo[i];
      posicionDelMinimo:=i;
    end;
  end;
  elementoMinimo:=posicionDelMinimo;
end;
procedure intercambio(x, y:integer; var arreglo:vector);
var saveValue:integer;
begin
  saveValue:=arreglo[x]; //me guardo el valor que tengo en la posicion X
  arreglo[x]:=arreglo[y]; //le pongo a la posicion x lo que tengo en la posicion y 
  arreglo[y]:=saveValue; //le pongo a la posicion y el valor de la posicion x que habia guardado
end;
var
  arreglo:vector;
  dimL, posMax, posMin, eleMax, eleMin:integer;
begin
  dimL:=0;
  cargarVector(arreglo, dimL);
  if(dimL > 0) then begin //osea si se cargo almenos 1 elemento
    posMax:=elementoMaximo(arreglo, dimL); //guardo la posicion del maximo
    posMin:=elementoMinimo(arreglo, dimL); //guardo la posicion del minimo
    eleMax:=arreglo[posMax];
    eleMin:=arreglo[posMin];
    intercambio(posMax, posMin, arreglo);
    Writeln('El elemento máximo ', eleMax, ' que se encontraba en la posición ', posMax, ' fue intercambiado con el elemento mínimo ', eleMin, ' que se encontraba en la posición ', posMin);
  end
  else
    Writeln('El vector está vacio, terminando el programa...')
end.
