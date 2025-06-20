10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. 
Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.

program Hello;
type
  cliente=record
    dni:integer;
    numero:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:cliente;
    sig:lista;
  end;
procedure recibirCliente(dni:integer; var pri, ult:list);
var 
  nuevo:list;
begin
  new(nuevo); nuevo^.dato.dni:=dni; nuevo^.sig:=nil;
  if(pri = nil) then begin
    nuevo^.dato.numero:=1;
    pri:=nuevo;
    ult:=nuevo;
  end
  else begin
    nuevo^.dato.numero:=ult^.dato.numero + 1;
    ult^.sig:=nuevo;
    ult:=nuevo;
  end;
end;
procedure atenderCliente(var pri:list; var dniAtendido, numeroAtendido:integer);
var 
  actual:list;
begin
  actual:=pri;
  dniAtendido:=actual^.dato.dni;
  numeroAtendido:=actual^.dato.numero;
  pri:=actual^.sig;
  dispose(actual);
end;
//VARIABLES LOCALES DEL PROGRAMA
var
 pri, ult:list;
 dni, dniAtendido, numeroAtendido:integer;
begin
  pri:=nil;
  ult:=nil;
  Write('Ingresa el Dni del cliente'); Readln(dni);
  while(dni <> 0) do begin
    recibirCliente(dni, pri, ult); //Es lo mismo que ir llenando la lista
    Writeln('Ingresa el Dni del cliente'); Readln(dni);
  end;
  while(pri <> nil) do begin
    atenderCliente(pri, dniAtendido, numeroAtendido);
    Writeln('Pase a ventanilla el cliente con numero de atencion: ', numeroAtendido, ' y DNI: ', dniAtendido);
  end;
end.
