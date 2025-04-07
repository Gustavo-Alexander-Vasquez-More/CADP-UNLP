//8. Un local de ropa desea analizar las ventas realizadas en el último mes. 
//Para ello se lee por cada día del mes, los montos de las ventas realizadas. 
//La lectura de montos para cada día finaliza cuando se lee el monto 0. 
//Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.

program ejercicio8;
var
 i, monto_x_dia, monto, venta_x_dia, monto_x_mes :integer;
begin
  monto_x_dia:=0;
  monto_x_mes:=0;
  venta_x_dia:=0;

  for i:=1 to 31 do
  begin
    Writeln('dia(',i,')Escriba el monto de venta: ');
    Readln(monto);
    while (monto <> 0) do
    begin
      monto_x_dia:=monto_x_dia + monto;
      venta_x_dia:=venta_x_dia + 1;
      Writeln('dia(',i,')Escriba el monto de venta');
      Readln(monto);
    end;
    Writeln('Las cantidad de ventas del dia ',i,' fueron: ',venta_x_dia);
    monto_x_mes:=monto_x_mes + monto_x_dia;
    monto_x_dia:=0;
    venta_x_dia:=0;
  end;
  Writeln('El monto total de ventas en el mes fueron: ',monto_x_mes);
end.