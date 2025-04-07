//7. Realizar un programa que lea desde teclado información de autos de carrera. 
//Para cada uno de los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. 
//En la carrera participaron 100 autos. 
//Informar en pantalla:
//● Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
//● Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.

program ejercicio7;
var
  piloto, primerPuesto, segundoPuesto, penultimoPuesto, ultimoPuesto: string; 
  i, tiempo, tiempoMax1, tiempoMax2, tiempoMin1, tiempoMin2: integer;
begin
  
  tiempoMax1:=0;
  tiempoMax2:=0;
  tiempoMin1:=9999;
  tiempoMin2:=9999;
  primerPuesto:='';
  segundoPuesto:='';
  penultimoPuesto:='';
  ultimoPuesto:='';
  
  for i:=1 to 100 do
  begin
    Writeln('Ingrese el nombre del piloto: ');
    Readln(piloto);
    Writeln('Ingrese el tiempo que le tomó llegar a la meta: ');
    Readln(tiempo);
    if(tiempo < tiempoMin1) then
    begin
      tiempoMin2:=tiempoMin1;
      tiempoMin1:=tiempo;
      segundoPuesto:=primerPuesto;
      primerPuesto:=piloto;
    end
    else
      if(tiempo < tiempoMin2) then
      begin
        tiempoMin2:=tiempo;
        segundoPuesto:=piloto;
      end;
      
      
    if(tiempo > tiempoMax1) then
    begin
      tiempoMax2:=tiempoMax1;
      tiempoMax1:=tiempo;
      penultimoPuesto:=ultimoPuesto;
      ultimoPuesto:=piloto;
    end
    else
      if(tiempo > tiempoMax2) then
      begin
        tiempoMax2:=tiempo;
        penultimoPuesto:=piloto;
      end;
  end;
  Writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ',primerPuesto,' y ',segundoPuesto);
  Writeln('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos son: ',penultimoPuesto,' y ',ultimoPuesto);
end.