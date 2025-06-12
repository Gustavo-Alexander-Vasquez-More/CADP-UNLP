//7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no debe procesarse) e informe:
//a. la cantidad de ocurrencias de cada dígito procesado.
//b. el dígito más leído.
//c. los dígitos que no tuvieron ocurrencias.
//Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
//Número 3: 2 veces
//Número 4: 2 veces
//Número 6: 2 veces
//Número 9: 4 veces
program ejercicio7;
const dimF=9;
type
  vector=array[0..dimF] of integer;
procedure inicializarVector(var vectorDeOcurrencias:vector);
var i:integer;
begin
  for i:=0 to dimF do
    vectorDeOcurrencias[i]:=0; //ponemos en cero todas las posiciones
end;
//Lee los numeros que voy ingresando por pantalla hasta el -1
procedure leerNumeros(var vectorDeOcurrencias:vector);
var num:integer;
begin
  Writeln('Ingresa un numero entero, para finalizar ingresa -1'); Readln(num);
  while(num <> -1) do begin
   cargar_vector_ocurrencias(num, vectorDeOcurrencias);
   Writeln('Ingresa un numero entero, para finalizar ingresa -1'); Readln(num);
  end;
end;
// Módulo que descompone un número en sus dígitos y cuenta cuántas veces aparece cada dígito (0 a 9),
// incrementando la posición correspondiente en un vector de ocurrencias.
procedure cargar_vector_ocurrencias(num:integer, var vectorDeOcurrencias:vector);
var numero, digito:integer;
begin
  numero:=num; //guarda el numero inicial y se va actualizando cada vez que se quita un digito
  if(num = 0) then begin
    vectorDeOcurrencias[0]:=vectorDeOcurrencias[0] + 1;
  end
  else
    while(numero <> 0) do begin
      digito:=numero MOD 10;
      vectorDeOcurrencias[digito]:=vectorDeOcurrencias[digito] + 1;
      numero:=numero DIV 10;
    end;
end;
//modulo que recorre el vector de ocurrencias cargado e informa cuantas ocurrencias tiene cada digito procesado, los no procesados no se informan.
procedure informarOcurrencias(vectorDeOcurrencias:vector);
var i:integer;
begin
  for i:=0 to dimF do begin
    if(vectorDeOcurrencias[i] <> 0) then
      Writeln('Numero ', i, ': ',vectorDeOcurrencias[i], ' veces.');
  end;
end;
//b. el dígito más leído.
function digitoMasLeido(vectorDeOcurrencias:vector):integer;
var i, maximo, posMax:integer;
begin
  maximo:=-1;
  posMax:=0;
  for i:=0 to dimF do begin
    if(vectorDeOcurrencias[i] > maximo) then begin
      maximo:=vectorDeOcurrencias[i];
      posMax:=i;
    end;
  end;
  digitoMasLeido:=posMax;
end;
//c. los dígitos que no tuvieron ocurrencias.
procedure digitosSinOcurrencias(vectorDeOcurrencias:vector);
var i:integer;
begin
  for i:=0 to dimF do begin
    if(vectorDeOcurrencias[i] = 0) then
      Writeln('El dígito ', i, ' no tuvo ocurrencias');
  end;
end;
var
  vectorDeOcurrencias:vector;
begin
  inicializarVector(vectorDeOcurrencias);
  leerNumeros(vectorDeOcurrencias);
  informarOcurrencias(vectorDeOcurrencias);
  Writeln('El digito mas leido fue el: ',digitoMasLeido(vectorDeOcurrencias));
  digitosSinOcurrencias(vectorDeOcurrencias);
end.
