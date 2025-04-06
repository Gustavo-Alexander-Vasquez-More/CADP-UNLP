//3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC. 
//De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
//La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. 
//Al finalizar la lectura informar:
//● La cantidad de alumnos aprobados (nota 8 o mayor).
//● La cantidad de alumnos que obtuvieron un 7 como nota.

program ejercicio3;
var 
  nombre: string;
  nota, cantAproveMax, cantAprove7: integer;
begin
  cantAproveMax:=0;
  cantAprove7:=0;
  repeat
      Writeln('Ingrese el nombre del alumno: ');
      Readln(nombre);
      Writeln('Ingrese la nota obtenida del alumno en el módulo EPA: ');
      Readln(nota);
      if(nota >= 8) then
        cantAproveMax:=cantAproveMax + 1;
      if(nota = 7) then
        cantAprove7:=cantAprove7 + 1;
  until nombre = 'Zidane Zinedine';
  Writeln('Alumnos que aprobaron con 8 o más: ',cantAproveMax);
  Writeln('Alumnos que aprobaron con 7: ',cantAprove7);
end.
