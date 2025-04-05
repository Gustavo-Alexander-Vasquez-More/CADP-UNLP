//3. Realizar un programa que lea un número real X. 
//Luego, deberá leer números reales hasta que se ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).
program ejercicio2;
var
    num1, num2 : real;
begin
    WriteLn('Ingrese un número: ');
    ReadLn(num1);
    WriteLn('Ingrese otro número: ');
    ReadLn(num2);
    while num2 <> (num1 * 2) do
      begin
        WriteLn('Escriba otro número');
        ReadLn(num2)
      end;
end.