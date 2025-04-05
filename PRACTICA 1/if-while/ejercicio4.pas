//4. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales.
//La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, en cuyo 
//caso deberá informarse: No se ha ingresado el doble de X

program ejercicio4;
var
    i : integer;
    num1, num2 : real;
begin
    WriteLn('Ingrese un número: ');
    ReadLn(num1);
    WriteLn('Ingrese otro número');
    ReadLn(num2);
    i:=1;
    while ((i <= 10) and (num2 <> (num1 * 2))) do
      begin
        WriteLn('Ingrese otro numero');
        ReadLn(num2);
        i:= i + 1;
      end;
    if(num2 <> (num1 * 2)) then
     WriteLn('No se ha ingresado el doble de X');
end.