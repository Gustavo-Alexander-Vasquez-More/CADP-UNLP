//2. Realizar un programa que lea un número real e imprima su valor absoluto. 
//El valor absoluto de un número X, se escribe |X| y se define como:
//|X| = X cuando X es mayor o igual a cero
//|X| = -X cuando X es menor a cero
program ejercicio2;
var
    num : real;
begin
    WriteLn('Ingrese un número: ');
    ReadLn(num);
    if((num > 0) or (num = 0)) then
        WriteLn('Valor absoluto: ',num)
    else
      WriteLn('Valor absoluto: ', num * -1)
end.