//7. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de ellos no lo era.
//Por ejemplo:
//* Si se leen los caracteres “a e o”, deberá informar: Los tres son vocales
//* Si se leen los caracteres “z a g”, deberá informar: Al menos un carácter no era vocal

program ejercicio7;
var 
  char1, char2, char3 : char;
  verif1, verif2, verif3 : boolean;
begin
  verif1:=false;
  verif2:=false;
  verif3:=false;
  Writeln('Primer caracter: ');
  Readln(char1);
  if((char1 ='a') or (char1='e') or (char1='i') or (char1='o') or (char1='u')) then
    verif1:=true;
  Writeln('Segundo caracter: ');
  Readln(char2);
  if((char2 ='a') or (char2='e') or (char2='i') or (char2='o') or (char2='u')) then
    verif2:=true;
  Writeln('Tercer caracter: ');
  Readln(char3);
  if((char3 ='a') or (char3='e') or (char3='i') or (char3='o') or (char3='u')) then
    verif3:=true;
  if(verif1 and verif2 and verif3) then
    Writeln('Los 3 son vocales')
  else
    Writeln('Al menos un carácter no era vocal');
end.
