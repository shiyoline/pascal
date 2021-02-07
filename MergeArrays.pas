program MergeArrays;
type
    arr = array of integer;    
     
(*Params: arr1, arr2, arr3 are arrays of integer,
    arr1Size, arr2Size, arr2Size are the sizes of the arrays above, respecitively,
    integer i and n are helper variables used for looping*)
var 
    arr1, arr2, arr3 : arr;
    arr1Size, arr2Size, arr3Size : integer;
    i, n : integer;

{--------------PROCEDURE PRINT---------------}
(*This procedure prints the array and size given as the params*)
procedure print(var arrParam : arr; size : integer);
begin
    (* this loop iterates until the end of the array, (size - 1) indicates the end,
        each iteration prints the value at the current index *)
    for n:= 0 to (size - 1) do
        write(arrParam[n], ' ');
    writeln();
end;

{--------------PROCEDURE MERGE---------------}
(*Params: arrParam1, arrParam2, arrParam3 are pass by reference*)
procedure merge(var arrParam1, arrParam2, arrParam3 : arr);
var
    p1, p2 : integer;

begin
    (* integers p1 and p2 are helper variables,
        p1 keeps track of the first array's index
        and p2 keeps tarck of second array's index during the merge process *)
    p1 := 0;
    p2 := 0;
    
    (* this loop iterates through the array 3,
        each iteration compares the two values of sub-arrays 1 and 2,
        the smaller value is set to the 3rd array until the array is sorted. *)
    for n := 0 to (arr3Size - 1) do
        begin
            if ((p2 = (arr2Size)) or (arrParam1[p1] < arrParam2[p2]) and (p1 < (arr1Size))) then
                begin
                arrParam3[n] := arrParam1[p1];
                p1 := p1 + 1;
                end
            else
                begin
                arrParam3[n] := arrParam2[p2];
                p2 := p2 + 1;
                end
        end;
end;


{-----------------MAIN-----------------}
begin
    (* set initial size for three arrays:
        array 1 and 2 have a max size of 20, 
        array 3 has a max size of 30 *)
    setLength(arr1, 20); 
    setLength(arr2, 20);
    setLength(arr3, 40);
    
    { read 1st input line and stores elements in 1st array }
    i:= 0;
    while not EOLn do
    begin
        read(arr1[i]);
        i:= i+1;
    end;
    
    arr1Size := i;  { caching size of array 1 }
    
    readln();   { start reading new line }
    
    { read 2nd input line and stores elements in 2nd array }
    i:= 0;
    while not EOLn do
    begin
        read(arr2[i]);
        i:= i+1;
    end;
        
    arr2Size := i; {caching size of array 1}
    
    arr3Size := arr1Size + arr2Size;    {calculate size of array 3}
    
    {merge sub-arrays 1 and 2 into array 3}
    merge(arr1, arr2, arr3);
    
    { print statements to indicate start of the program output }
    writeln();
    writeln('===================OUTPUT======================');
    writeln();
    
    {print statements to check the size of each arrays}
    writeln('Size 1: ', arr1Size);
    writeln('Size 2: ', arr2Size);
    writeln('Size 3: ', arr3Size);
    writeln();
    
    {print all three arrays elements}
    write('Array 1: '); 
    print(arr1, arr1Size);
    write('Array 2: ');
    print(arr2, arr2Size);
    write('Merged array 3: ');
    print(arr3, arr3Size);
    
    { print statements to indicate end of program }
    writeln();
    writeln('=====================END=======================');
    writeln();
    
end.