//4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). 
//De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por nro de alumno de manera ascendente. Se pide:
//a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
//b. Un módulo que reciba un alumno y lo inserte en el vector.
//c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
//d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
//e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
//Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datosleídos de teclado.
program Hello;
const dimF=1000;
type
  alumno=record
    nro_alumno:integer;
    apellido:string;
    nombre:string;
    asistencias:integer;
  end;
  vector=array[1..dimF] of alumno;
//MODULOS
procedure cargarVectorAlumnos(var v:vector; var dimL:integer); //se dispone, solo se escribe la cabecera y se sabe que el vector se carga ordenado
function buscarPosicion(v: vector; num:integer): integer; // INCISO A: el alumno seguro existe
var
  pos: integer;
begin
  pos := 1; // Inicializa en la primera posición válida del vector
  // Recorre el vector mientras el número del alumno actual sea menor al buscado
  // No es necesario verificar igualdad porque el enunciado garantiza que el alumno existe.
  // Al finalizar el ciclo, la posición encontrada corresponde al alumno buscado.
  while (v[pos].nro_alumno < num) do
    pos := pos + 1;
  buscarPosicion := pos; // Retorna la posición del alumno
end;
procedure leerAlumno(var newAlumno:alumno);
var
 nro_alumno, asistencias:integer;
 apellido, nombre:string;
begin
  Writeln('Escriba el nuevo N° de alumno'); Readln(nro_alumno); newAlumno.nro_alumno:=nro_alumno;
  Writeln('Escriba el apellido del nuevo alumno'); Readln(apellido); newAlumno.apellido:=apellido;
  Writeln('Escriba el nombre del nuevo alumno'); Readln(nombre); newAlumno.nombre:=nombre;
  Writeln('Escriba la cantidad de asistencias del nuevo alumno'); Readln(asistencias); newAlumno.asistencias:=asistencias;
end;
procedure insertarAlumno(var vectorAlumnos:vector, newAlumno:alumno, var dimL:integer); //inciso B
var 
  i, pos:integer;
begin
  pos:=1;
  if(dimL < dimF) then begin //si hay espacio
    while((pos <= dimL) AND (vectorAlumnos[pos].nro_alumno < newAlumno.nro_alumno)) do
      pos:=pos + 1;
    if(pos > dimL) then
      vectorAlumnos[pos]:=newAlumno
    else
    begin
      for i:=(dimL + 1) downto (pos + 1) do
        vectorAlumnos[i]:=vectorAlumnos[i - 1];
      vectorAlumnos[pos]:=newAlumno;
    end;
    dimL:=dimL + 1;
  end;
end;
//INCISO C
procedure eliminarAlumno(var vectorAlumnos:vector; pos:integer; var dimL:integer);
var
  i: integer;
begin
  if (pos <= dimL) then
  begin
    // Desplazar elementos a la izquierda desde la posición 'pos'
    for i := pos to (dimL - 1) do
      vectorAlumnos[i] := vectorAlumnos[i + 1];
    dimL := dimL - 1; // Reducir la dimensión lógica del vector
  end
  else
    Writeln('La posición no existe en el vector');
end;
//INCISO D
procedure eliminarAlumnoPorNroAlumno(var vectorAlumnos:vector; nro: integer; var dimL:integer);
var
  pos, i: integer;
begin
  pos:=1;
  while ((pos <= dimL) AND (vectorAlumnos[pos].nro_alumno <> nro)) do
    pos:=pos + 1;
  if (pos <= dimL) then
  begin
    // Desplazar elementos a la izquierda desde la posición 'pos'
    for i := pos to (dimL - 1) do
      vectorAlumnos[i] := vectorAlumnos[i + 1];
    dimL := dimL - 1; // Reducir la dimensión lógica del vector
  end
  else
    Writeln('El numero ingresado no corresponde a ningun alumno del vector, no se pude eliminar el alumno solicitado.');
end;
//INCISO E 
procedure eliminarPorAsistencias(var vectorAlumnos:vector, var dimL:integer);
var i, pos:integer;
begin
  i := 1;
  while (i <= dimL) do
  begin
    if (vectorAlumnos[i].asistencias = 0) then
    begin
      // Desplazar los elementos hacia la izquierda
      for pos := i to (dimL - 1) do
        vectorAlumnos[pos] := vectorAlumnos[pos + 1];
      dimL := dimL - 1;
      // No se incrementa i, porque hay un nuevo elemento en la posición actual
    end
    else
      i := i + 1; // Solo se avanza si no se eliminó
  end;
end;
//VARIABLES LOCALES DEL PROGRAMA
var 
  dimL, pos, num:integer;
  vectorAlumnos:vector;
  newAlumno:alumno;
begin
  dimL:=0;
  cargarVectorAlumnos(vectorAlumnos, dimL);
  if(dimL > 0) then begin
    Writeln('Escriba el numero de alumno que desea buscar'); Readln(num);
    Writeln('La posicion del alumno es ', buscarPosicion(vectorAlumnos, num));
    leerAlumno(newAlumno);
    insertarAlumno(vectorAlumnos, newAlumno, dimL);
    Writeln('Ingrese la posicion del alumno que desea eliminar en el vector'); Readln(pos);
    eliminarAlumno(vectorAlumnos, pos, dimL);
    Writeln('Ingrese el N° del alumno como referencia para eliminar'); Readln(num);
    eliminarAlumnoPorNroAlumno(vectorAlumnos, num, dimL);
    eliminarPorAsistencias(vectorAlumnos, dimL);
  end
  else
    Writeln('El vector se encuentra vacio, finalizando programa ...');
end.