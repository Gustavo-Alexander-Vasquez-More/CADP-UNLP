//2. Realice un programa que resuelva los siguientes incisos:
//a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
//b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
//c. Lea un nombre y lo inserte en la posición 4 del vector.
//d. Lea un nombre y lo agregue al vector.
//Nota: Realizar todas las validaciones necesarias.
program Hello;
const dimF=500;
type
  vector=array[1..dimF] of string;
procedure cargarVector(var vectorAlumnos:vector; var dimL:integer);
var nombre:string;
begin
  Writeln('Ingrese el nombre de un alumno'); Readln(nombre);
  while((dimL < dimF) AND (nombre <> 'ZZZ')) do begin
    dimL:=dimL + 1;
    vectorAlumnos[dimL]:=nombre;
    Writeln('Ingrese el nombre de un alumno'); Readln(nombre);
  end;
end;
//inciso a:
procedure eliminarOcurrencia(var vectorAlumnos:vector; var dimL:integer);
var 
  nombre:string;
  pos, i:integer;
begin
  pos:=1;
  Readln(nombre);
  while((pos <= dimL) AND (vectorAlumnos[pos] <> nombre)) do begin
    pos:=pos + 1;
  end;
  if((pos >= 1) AND (pos <=dimL)) then begin
    for i:=pos to (dimL - 1) do begin
      vectorAlumnos[i]:=vectorAlumnos[i + 1];
    end;
    dimL:=dimL - 1;
  end;
end;
procedure insertarNombre(var vectorAlumnos:vector; var dimL:integer);
var 
  nombre:string;
  i:integer;
begin
  Writeln('Ingrese el nombre'); Readln(nombre);
  //necesitamos desplazar una posicion todos los elementos que estan despues de la posicion a la que vamos a insetar el elementos.
  //1.tenemos que preguntarnos si hay espacio en el vector
  if(dimL < dimF) then begin
    for i:=(dimL + 1) downto 5 do begin //empezamos desde la posicion extra que vamos a agregar
      vectorAlumnos[i]:=vectorAlumnos[i - 1];  //agregamos lo que tiene la posicion anterior y asi hasta que lleguemos a copiar en la posicion 5 lo que tengo en la poscion 4.
    end;
    vectorAlumnos[4]:=nombre; //ya que hicimos el borrado logico del 4 ahi agregamos en esa posicion el nuevo nombre.
    dimL:=dimL + 1; //aumentamos en 1 la dimL ya que tenemos un elemento más
  end;
end;
procedure agregarNombre(var vectorAlumnos:vector; var dimL:integer);
var nombre:string;
begin
  Writeln('Ingrese el nombre'); Readln(nombre);
  //En este caso agregar implica poner el elemento al final del vector
  if(dimL < dimF) then begin // para ello preguntamos primero si hay lugar en el vector
    vectorAlumnos[dimL + 1]:=nombre; //si hay lugar agregamos el nombre una posicion mas del ultimo elemento
    dimL:=dimL + 1; //aumentamos la dimension logica porque ahora tenemos un elemento nuevo
  end;
end;
var
  vectorAlumnos:vector;
  dimL:integer;
begin
  dimL:=0;
  cargarVector(vectorAlumnos, dimL);
  if(dimL > 0) then begin
    eliminarOcurrencia(vectorAlumnos, dimL);
    insertarNombre(vectorAlumnos, dimL);
    agregarNombre(vectorAlumnos, dimL);
  end
  else
    Writeln('El vector esta vacío, finalizando el programa ...')
end.
