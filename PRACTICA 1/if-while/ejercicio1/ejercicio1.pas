//Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos
//números es el mayor. Si son iguales debe informar en pantalla lo siguiente:

program ejercicio1;
var
    num1, num2 : integer;
begin
    WriteLn('Ingrese el primer número: ');
    ReadLn(num1);
    WriteLn('Ingrese un segundo número: ');
    ReadLn(num2);
    if(num1 = num2) then
        WriteLn('Los números leídos son iguales')
    else
      begin
        if (num1 > num2) then
            WriteLn('El primer número es el mayor')
        else
          WriteLn('El segundo numero es el mayor')
      end;
end.