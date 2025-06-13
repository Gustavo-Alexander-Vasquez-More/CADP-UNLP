//8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de Informática de la UNLP en el año 2020. 
//De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de nacimiento. 
//Una vez leída y almacenada toda la información, calcular e informar:
//a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
//b. Apellido y nombre de los dos alumnos de mayor edad.
program ejercicio8;
const dimF=400;
type
  registro=record
    num_inscripcion:integer;
    dni:integer;
    apellido:string;
    nombre:string;
    año_nacimiento:integer;
  end;
  vector=array[1..dimF] of registro;
//MODULOS
procedure cargarVector(var vectorAlumnos:vector);
var 
  i, dni, inscripcion, nacimiento:integer;
  apellido, nombre:string;
begin
  for i:=1 to dimF do begin
    Writeln('ingresar el N° de inscripcion del alumno'); Readln(inscripcion);
    Writeln('ingresar el N° de dni del alumno'); Readln(dni);
    Writeln('ingresar el apellido del alumno'); Readln(apellido);
    Writeln('ingresar el nombre del alumno'); Readln(nombre);
    Writeln('ingresar la fecha de nacimiento del alumno'); Readln(nacimiento);
    vectorAlumnos[i].num_inscripcion:=inscripcion;
    vectorAlumnos[i].dni:=dni;
    vectorAlumnos[i].apellido:=apellido;
    vectorAlumnos[i].nombre:=nombre;
    vectorAlumnos[i].año_nacimiento:=nacimiento;
  end;
end;
//funcion que retorna los alumnos que su Dni estan compuestos solo por numeros pares
function alumnosDniDigitosPares(vectorAlumnos:vector):integer;
var
  i, alumnosCumplen, numeroDni:integer;
  ok:boolean;
begin
  alumnosCumplen:=0;
  for i:=1 to dimF do begin
    numeroDni:=vectorAlumnos[i].dni; //va guardando el numero
    ok:=true;
    while ((numeroDni <> 0) AND ok) do begin
      if((numeroDni MOD 10) MOD 2 = 0) then begin //si el ultimo digito que analizo al dividirlo por 2 su resto es cero 
        numeroDni:= numeroDni DIV 10;
      end
      else begin
        ok:=false;
        numeroDni:= numeroDni DIV 10;
      end;
    end;
    if(ok) then
      alumnosCumplen:=alumnosCumplen + 1;
  end;
  alumnosDniDigitosPares:=alumnosCumplen;
end;
//Funcion que calcula el porcentaje de alumnos con dni compuesto solo por digitos pares
function calcularPorcentaje(vectorAlumnos:vector):real;
begin
  calcularPorcentaje:=(alumnosDniDigitosPares(vectorAlumnos) * 100) / dimF;
end;
//Modulo que devuelve el nombre y apellido de los 2 alumnos con mayor edad
procedure alumnosMayores(vectorAlumnos:vector);
var 
  i, anioMin1, anioMin2:integer;
  nombreMax1, nombreMax2, apellidoMax1, apellidoMax2:string;
begin
  anioMin1:= 9999;
  anioMin2:=9999;
  nombreMax1:='';
  nombreMax2:='';
  apellidoMax1:='';
  apellidoMax2:='';
  for i:=1 to dimF do begin
    if(vectorAlumnos[i].año_nacimiento < anioMin1) then begin
      anioMin2:=anioMin1;
      nombreMax2:=nombreMax1;
      apellidoMax2:=apellidoMax1;
      anioMin1:=vectorAlumnos[i].año_nacimiento;
      nombreMax1:=vectorAlumnos[i].nombre;
      apellidoMax1:=vectorAlumnos[i].apellido;
    end
    else if(vectorAlumnos[i].año_nacimiento < anioMin2) then begin
      anioMin2:=vectorAlumnos[i].año_nacimiento;
      nombreMax2:=vectorAlumnos[i].nombre;
      apellidoMax2:=vectorAlumnos[i].apellido;
    end;
  end;
  Writeln('Los alumnos con mayor edad son: ');
  Writeln(nombreMax1, ' ', apellidoMax1);
  Writeln(nombreMax2, ' ', apellidoMax2);
end;
//VARIABLES LOCALES DEL PROGRAMA
var
  vectorAlumnos:vector;
//COMIENZO DEL PROGRAMA
begin
  cargarVector(vectorAlumnos);
  Writeln('El porcentaje de alumnos que tienen Dni compuesto solo con numeros pares es: ', calcularPorcentaje(vectorAlumnos));
  alumnosMayores(vectorAlumnos);
end.
