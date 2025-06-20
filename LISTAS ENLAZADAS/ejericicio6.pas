//6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al espacio en la última década. 
//De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de meses que permanecerá activa), 
//el costo de construcción, el costo de mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios.
//Dicho rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma.
//Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
//Una vez finalizada la lectura, informar:
//a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
//b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
//c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
//d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
//Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible

program ejercicio6;
type
  rangoEspectral=1..7;
  vector=array[rangoEspectral] of integer;
  sonda=record
    nombre:string;
    duracion:integer;
    costo_construccion:real;
    costo_mantenimiento_mensual:real;
    rango:rangoEspectral;
  end;
  list=^nodo;
  nodo=record
    dato:sonda;
    sig:list;
  end;
procedure leerSonda(var nombre:string; var duracion:integer; var costo_construccion, costo_mantenimiento_mensual:real; var rango:rangoEspectral);
begin
  Writeln('Nombre de la Sonda espacial:'); Readln(Nombre);
  Writeln('Duración de la misión:'); Readln(duracion);
  Writeln('Costo de contrucción:'); Readln(costo_construccion);
  Writeln('Costo de mantenimiento mensual:'); Readln(costo_mantenimiento_mensual);
  Writeln('Categoria del Rango espectral en el que opera:'); Writeln('Nota. Las categorias son: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma.'); Readln(rango);
end;
procedure cargarLista(var pri:list; nombre:string; duracion:integer; costo_construccion, costo_mantenimiento_mensual:real; rango:rangoEspectral);
var 
  nuevo:list;
begin
  new(nuevo); nuevo^.dato.nombre:=nombre; nuevo^.dato.duracion:=duracion; nuevo^.dato.costo_construccion:=costo_construccion; 
  nuevo^.dato.costo_mantenimiento_mensual:=costo_mantenimiento_mensual; nuevo^.dato.rango:=rango; nuevo^.sig:=nil;
  if(pri = nil) then
    pri:=nuevo
  else begin
    nuevo^.sig:=pri;
    pri:=nuevo;
  end;
end;
//INCISO A
function sondaMasCostosa(pri:list):string;
var 
  total, max:real;
  maxNombre:string;
begin
  max:=0;
  maxNombre:='';
  while(pri <> nil) do begin
    total := pri^.dato.costo_construccion + (pri^.dato.costo_mantenimiento_mensual * pri^.dato.duracion);
    if(total > max) then begin
      max:=total;
      maxNombre:=pri^.dato.nombre;
    end;
    pri:=pri^.sig;
  end;
  sondaMasCostosa:=maxNombre;
end;
procedure iniciarVectorContador(var vectorContador:vector);
var i:integer;
begin
  for i:=1 to 7 do
    vectorContador[i]:=0;
end;
//INCISO B 
procedure contarPorCategorias(var vectorContador:vector; pri:list);
var i:integer;
begin
  while(pri <> nil) do begin
    vectorContador[pri^.dato.rango]:=vectorContador[pri^.dato.rango] + 1;
    pri:=pri^.sig;
  end;
  for i:=1 to 7 do
    Writeln('Para el espectro de categoria ', i, ' se estudiaran ', vectorContador[i], ' sondas');
end;
//INCISO C
function superanPromedio(pri:list):integer;
var 
  cantSondas, sumaDuraciones, sondasSuperan:integer;
  aux:list;
begin
  aux:=pri;
  sondasSuperan:=0;
  cantSondas:=0;
  sumaDuraciones:=0;
  while(pri <> nil) do begin
    cantSondas:=cantSondas + 1;
    sumaDuraciones:=sumaDuraciones + pri^.dato.duracion;
    pri:=pri^.sig;
  end;
  while(aux <> nil) do begin
    if((aux^.dato.duracion) > (sumaDuraciones / cantSondas)) then
      sondasSuperan:=sondasSuperan + 1;
    aux:=aux^.sig;
  end;
  superanPromedio:=sondasSuperan;
end;
//INCISO D 
procedure superanCostoConstruccionPromedio(pri:list);
var 
  cantSondas:integer;
  sumaCosto:real;
  aux:list;
begin
  aux:=pri;
  cantSondas:=0;
  sumaCosto:=0;
  while(pri <> nil) do begin
    cantSondas:=cantSondas + 1;
    sumaCosto:=sumaCosto + pri^.dato.costo_construccion;
    pri:=pri^.sig;
  end;
  while(aux <> nil) do begin
    if((aux^.dato.costo_construccion) > (sumaCosto / cantSondas)) then
      Writeln(aux^.dato.nombre);
    aux:=aux^.sig;
  end;
end;
//VARIABLES LOCALES
var
  nombre:string;
  duracion:integer;
  costo_construccion, costo_mantenimiento_mensual:real;
  rango:rangoEspectral;
  pri:list;
  vectorContador:vector;
begin
  pri:=nil; // declraro la lista vacia;
  repeat
    leerSonda(nombre, duracion, costo_construccion, costo_mantenimiento_mensual, rango);
    cargarLista(pri, nombre, duracion, costo_construccion, costo_mantenimiento_mensual, rango);
  until (nombre = 'GAIA');
  Writeln('La sonda mas costosa es: ', sondaMasCostosa(pri));
  iniciarVectorContador(vectorContador);
  contarPorCategorias(vectorContador, pri);
  Writeln('Las sondas que superan la duracion promedio son: ', superanPromedio(pri));
  superanCostoConstruccionPromedio(pri);
end.
