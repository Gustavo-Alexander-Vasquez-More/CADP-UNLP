//10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 empleados). 
//La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. 
//Una vez finalizada la carga de datos se pide:
//a. Realizar un módulo que incremente el salario de cada empleado en un 15%. 
//Para ello, implementar un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión
//lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
//b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
program ejercicio10;
const dimF=300;
type
  vector=array[1..dimF] of real;
//MODULOS
procedure cargarVectorSalarios(var vectorSalarios:vector; var dimL:integer);
var salario:real;
begin
  Writeln('Ingrese el salario de un empleado: '); Readln(salario);
  while ((dimL < dimF) AND salario <> 0) do begin
    dimL:=dimL + 1;
    vectorSalarios[dimL]:=salario;
    Writeln('Ingrese el salario de un empleado: '); Readln(salario);
  end;
end;
procedure aumentoDeSalarios(x:real; var vectorSalarios:vector; dimL:integer);
var i:integer;
begin
  for i:=1 to dimL do begin
    vectorSalarios[i]:=vectorSalarios[i] + (vectorSalarios[i] * x);
  end;
end;
function sueldoPromedio(vectorSalarios:vector; dimL:integer):real;
var
  i:integer;
  suma:real;
begin
  suma:=0;
  for i:=1 to dimL do
    suma:=suma + vectorSalarios[i];
  sueldoPromedio:=suma / dimL;
end;
//VARIABLES LOCALES DEL PROGRAMA
var
  vectorSalarios:vector;
  dimL:integer;
  x:real;
//COMIENZO DEL PROGRAMA
begin
  dimL:=0;
  x:=0.15; // es el 15%
  cargarVectorSalarios(vectorSalarios, dimL);
  if(dimL > 0) then begin
  aumentoDeSalarios(x,vectorSalarios,dimL);
  Writeln('El sueldo promedio de todos los empleados es: ', sueldoPromedio(vectorSalarios, dimL));
  end 
  else
    Writeln('No se cargo el vector, cancelando el programa ...');
end.
