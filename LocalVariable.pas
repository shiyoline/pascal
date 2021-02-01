Live Demo
program exLocal;
var
   a, b, c: integer;
procedure display;

var
   a, b, c: integer;
begin
   (* local variables *)
   a := 10;
   b := 20;
   c := a + b;
   
   writeln('Winthin the procedure display');
   writeln('value of a = ', a , ' b =  ',  b, ' and c = ', c);
end;

begin
   a:= 100;
   b:= 200;
   c:= a + b;
   
   writeln('Winthin the program exlocal');
   writeln('value of a = ', a , ' b =  ',  b, ' and c = ', c);
   display();
end.


(* OUTPUT

Within the program exlocal
value of a = 100 b = 200 c = 300
Within the procedure display
value of a = 10 b = 20 c = 30

Makes sense!
*)