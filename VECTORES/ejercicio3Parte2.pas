//3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo. 
//De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión (medida en kilómetros).
//a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
//b. Realizar un módulo que reciba el vector generado en a) e informe:
//- El monto promedio transportado de los viajes realizados
//- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
//- La cantidad de viajes realizados cada día del mes.
//c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.
//Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
program ejercicio3Parte2;
const dimF=200;
const dimF_dias=31;
type
  dias=1..31;
  infoViajes=record
    diaMes:dias;
    dinero:real;
    distancia:real;
  end;
  vector=array[1..dimF] of infoViajes;
  vectorContador=array[1..dimF_dias] of integer;
procedure cargarVector(var viajes:vector; var dimL:integer);
var
  dia:dias;
  dinero, distancia:real;
begin
  Writeln('Ingrese el día del mes'); Readln(dia);
  Writeln('Ingrese el monto de dinero transportado'); Readln(dinero);
  Writeln('Ingrese la distancia en km recorrida por el camión'); Readln(distancia);
  while ((dimL < dimF) AND (distancia <> 0)) do begin
    dimL:=dimL + 1;
    viajes[dimL].diaMes:=dia;
    viajes[dimL].dinero:=dinero;
    viajes[dimL].distancia:=distancia;
    Writeln('Ingrese el día del mes'); Readln(dia);
    Writeln('Ingrese el monto de dinero transportado'); Readln(dinero);
    Writeln('Ingrese la distancia en km recorrida por el camión'); Readln(distancia);
  end;
end;
procedure inicializarVectorContador(var arregloDias:vectorContador);
var i:integer;
begin
  for i:=1 to dimF_dias do
    arregloDias[i]:=0;
end;
procedure recorrerArregloDias(arregloDias:vectorContador);
var i:integer;
begin
  for i:=1 to dimF_dias do
    Writeln('La cantidad de viajes realizados en el dia ', i, ' fueron ', arregloDias[i]);
end;
//b.
procedure incisoB(v:vector; var arregloDias:vectorContador; dimL:integer);
var 
  suma, dist, minDinero:real;
  i, dia:integer;
begin
  suma:=0;
  minDinero:=9999;
  dist:=0;
  dia:=0;
  for i:=1 to dimL do begin
    suma:=suma + v[i].dinero;
    if(v[i].dinero < minDinero) then begin
      minDinero:=v[i].dinero;
      dist:=v[i].distancia;
      dia:=v[i].diaMes;
    end;
    arregloDias[v[i].diaMes]:=arregloDias[v[i].diaMes] + 1;
  end;
  Writeln('El monto promedio es: ', (suma / dimL));
  Writeln('El dia del mes que se transporto menos dinero fue ', dia, ' y la distancia que se recorrio fue ', dist, ' km');
  recorrerArregloDias(arregloDias);
end;
//inciso c
procedure incisoC(var v:vector; var dimL:integer);
var 
  i, pos: integer;
begin
  i := 1;  // Inicializo i para comenzar desde la primera posición del vector

  // Mientras i no supere la cantidad actual de elementos (dimL)
  while (i <= dimL) do begin

    // Verifico si en la posición i la distancia es igual a 100
    if (v[i].distancia = 100) then begin

      // Si es igual, debo eliminar ese viaje desplazando todos los siguientes
      // desde la posición i hasta la penúltima (dimL - 1)
      for pos := i to (dimL - 1) do begin
        v[pos] := v[pos + 1];  // Copio el siguiente elemento en la posición actual
      end;

      dimL := dimL - 1;  // Reduzco el tamaño lógico del vector porque eliminé un elemento
      // NO incremento i aquí para revisar el nuevo elemento que ahora está en la posición i

    end
    else
      i := i + 1;  // Si no es 100, paso a la siguiente posición
  end;
end;
var
  viajes:vector;
  dimL:integer;
  arregloDias:vectorContador;
begin
  dimL:=0;
  cargarVector(viajes, dimL);
  inicializarVectorContador(arregloDias);
  if(dimL > 0) then begin
    incisoB(viajes, arregloDias, dimL);
    incisoC(viajes, dimL);
  end
  else 
    writeln ('El vector esta vacio, finalizando programa ....')
end.
