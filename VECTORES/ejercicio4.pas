//4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
program ejercicio4Vectores;
const dimF=100;
type
  vector=array[1..dimF] of integer;
procedure cargarVector(var arreglo:vector); // se dispone y se sabe que se cargaran 100 numeros enteros (solo se escribe la cabecera)
//a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.
function posicion(x:integer, arreglo:vector):integer;
var 
  i:integer;
  encontre:boolean;
begin
  encontre:=false;
  i:=1;
  while((i <= dimF) AND (NOT encontre)) do begin
    if(arreglo[i] = x) then
      encontre:= true
    else
      i:=i+1;
  end;
  if(encontre = true) then
    posicion:=i
  else
    posicion:=-1;
end;
//b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde se intercambiaron los valores de las posiciones x e y.
procedure intercambio(x, y:integer; var arreglo:vector);
var saveValue:integer;
begin
  saveValue:=arreglo[x]; //me guardo el valor que tengo en la posicion X
  arreglo[x]:=arreglo[y]; //le pongo a la posicion x lo que tengo en la posicion y 
  arreglo[y]:=saveValue; //le pongo a la posicion y el valor de la posicion x que habia guardado
end;
//c. sumaVector: retorna la suma de todos los elementos del vector.
function sumaVector(arreglo:vector):integer;
var i, acumulador:integer;
begin
  acumulador:=0;
  for i:=1 to dimF do
    acumulador:=acumulador + arreglo[i];
  sumaVector:=acumulador;
end;
//d. promedio: devuelve el valor promedio de los elementos del vector.
function promedio(arreglo:vector):real;
begin
  promedio:=sumaVector(arreglo) / dimF;
end;
//e. elementoMaximo: retorna la posición del mayor elemento del vector
function elementoMaximo(arreglo:vector):integer;
var i, maximo, posicionDelMaximo:integer;
begin
  maximo:=-9999;
  posicionDelMaximo:=0;
  for i:=1 to dimF do begin
    if(arreglo[i] > maximo) then begin
      maximo:=arreglo[i];
      posicionDelMaximo:=i;
    end;
  end;
  elementoMaximo:=posicionDelMaximo;
end;
//f. elementoMinimo: retorna la posicion del menor elemento del vector
function elementoMinimo(arreglo:vector):integer;
var i, minimo, posicionDelMinimo:integer;
begin
  minimo:=9999;
  posicionDelMinimo:=0;
  for i:=1 to dimF do begin
    if(arreglo[i] < minimo) then begin
      minimo:=arreglo[i];
      posicionDelMinimo:=i;
    end;
  end;
  elementoMinimo:=posicionDelMinimo;
end;
var
  arreglo:vector;
  x, y:integer;
begin
  x:=50;
  y:=80;
  cargarVector(arreglo);
  Writeln('La posicion es ',posicion(x, arreglo));
  intercambio(x, y, arreglo);
  Writeln('La suma de todos los elementos del vector es: ',sumaVector(arreglo));
  Writeln('El valor promedio del vector es: ',promedio(arreglo));
  Writeln('El elemento maximo del vector se encuentra en la posicion: ',elementoMaximo(arreglo));
  Writeln('El elemento minimo del vector se encuentra en la posicion: ',elementoMinimo(arreglo));
end.
