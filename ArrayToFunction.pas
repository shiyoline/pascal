program arrayToFunction;
const
   size = 5;
type
   a = array [1..size] of integer;
var
   balance:  a = (1000, 2, 3, 17, 50);
   average: real;  

{ Function begins }
function avg( var arr: a) : real;
var
   i :1..size;
   sum: integer;

begin
   sum := 0;
   for i := 1 to size do
      sum := sum + arr[i];
   avg := sum / size;
end;


{ Main function }
begin  
   (*  Passing the array to the function  *)
   average := avg( balance ) ;
   
   (* output the returned value *)
   writeln( 'Average value is: ', average:7:2);
end.