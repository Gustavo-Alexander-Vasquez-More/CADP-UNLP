//5. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. 
//La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
//Al finalizar la lectura, informar:
//a. La cantidad de alumnos leída..
//b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
//c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 (en el ejemplo anterior, se debería informar 0%).

program ejercicio5;
var
  cantAlumnos, mayorPromedio, alumnosLegajoCumplen, alumnosDestacados, legajo: integer;
  porcentaje, promedio : real;
begin
  cantAlumnos:=0;
  mayorPromedio:=0;
  alumnosLegajoCumplen:=0;
  alumnosDestacados:=0;
  porcentaje:=0;
  Writeln('Ingresá el número de legajo');
  Readln(legajo);
  
  while(legajo <> -1) do
  begin
    Writeln('Ingresá el promedio del alumno');
    Readln(promedio);
    cantAlumnos:=cantAlumnos + 1;
    if(promedio > 8.5) then
    begin
      alumnosDestacados:=alumnosDestacados + 1;
      if(legajo < 2500) then
      alumnosLegajoCumplen:=alumnosLegajoCumplen + 1;
    end;
    if(promedio > 6.5) then
      mayorPromedio:=mayorPromedio + 1;
    Writeln('Ingresá el número de legajo');
    Readln(legajo);
  end;
  
  Writeln('Cantidad de alumnos leídos: ', cantAlumnos);
  Writeln('Cantidad de alumnos con promedio mayor a 6.5: ', mayorPromedio);
  
  if (alumnosDestacados > 0) then
  begin
    porcentaje := (alumnosLegajoCumplen * 100) / alumnosDestacados;
    Writeln('Porcentaje de alumnos destacados con legajo < 2500: ', porcentaje, '%');
  end
  else
    Writeln('No hubo alumnos destacados, porcentaje: 0%');
end.
