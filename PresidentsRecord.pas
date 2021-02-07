program PresidentsRecordProgram;
Uses sysutils, strutils; { libraries to help manipulate strings }

const
  FILE_NAME = '/uploads/presidents.txt';

{ define the type of record }
type
    PresidentRecord = record
       startYear: integer;
       endYear: integer;
       firstName: string;
       middleInitials: string;
       lastName: string;
    end;

(* variables Presidents is an array of president records,
    inputFile stores the text file
    line, word, yearInput, i and size are there
    to support looping and extracting information from the text file*)
var
    Presidents: array of PresidentRecord;
    inputFile: text;
    line, word, yearInput: string;
    i, size: integer;

{----------------PROCEDURE READ ALL PRESIDENTS FROM A TEXT FILE-----}
(* this procedure reads from the text file line by line,
    for each line, it extracts each word and store them in the record *)
procedure readPresidents();
begin
    i := 0;
    size := 0;
    
    Assign(inputFile, FILE_NAME);
    reset(inputFile); 
    repeat
        begin
            repeat
                read(inputFile, line);
                
                if (line = '-1') then 
                begin
                    readln(inputFile, line);
                    read(inputFile, yearInput);
                    break;
                end;
                
                word := ExtractWord(1, line, [' ']);
                Presidents[i].startYear := strToInt(word);
                
                word := ExtractWord(2, line, [' ']);
                Presidents[i].endYear := strToInt(word);
                
                word := ExtractWord(3, line, [' ']);
                Presidents[i].firstName := word;
                
                
                if (ExtractWord(5, line, [' ']) = '') then
                    begin
                        word:=ExtractWord(4, line, [' ']);
                        Presidents[i].lastName := word;
                    end
                else
                    begin
                        word := ExtractWord(4, line, [' ']);
                        Presidents[i].middleInitials := word;
                        
                        word := ExtractWord(5, line, [' ']);
                        Presidents[i].lastName := word;
                    end;
		        
		        size := size + 1;
		    until Eoln(inputFile);
		    
		    i := i + 1;

		    readln(inputFile, line);
        end
	until Eof(inputFile); 
	close(inputFile);
end;

{----------------PROCEDURE SORT ALL PRESIDENTS----------------------}
(* this procedure uses selection sort as the underlying sort to sort the array of president records*)
procedure sortPresidents();
(* these variables are used mainly to aid with the sorting algorithm*)
var
    temp: PresidentRecord;
    a, b, min: integer;

begin   
    for a := 0 to (size - 3) do
    begin
        min := a;
        for b := (a + 1) to (size - 2) do
        begin
            if (Presidents[min].startYear > Presidents[b].startYear) then
            begin
                min := b;
            end;
        end;
        
        temp := Presidents[a];
        Presidents[a] := Presidents[min];
        Presidents[min] := temp;
    end;
end;

{----------------PROCEDURE PRINT ALL PRESIDENTS----------------------}
(* this procedure prints all presidents using a for loop*)
procedure printPresidents();
var
    a: integer;
    
begin
    for a := 0 to (size - 2) do
        begin
            write(Presidents[a].startYear, ' ');
            write(Presidents[a].endYear, ' ');
            write(Presidents[a].firstName, ' ');
            
            if (Presidents[a].middleInitials <> '') then
                write(Presidents[a].middleInitials, ' ');
                
            writeln(Presidents[a].lastName, ' ');
        end;
end;

{----------------PROCEDURE PRINT ALL PRESIDENTS IN OFFICE------------}
(*this procedure prints all presidents in office during the year read from the text file*)
procedure printPresidentsInOfficeDuringYear();
(*these variables help with the looping process*)
var
    a, b, year : integer;
    yearString: string;
    noMatch: boolean;   {noMatch is used to see if there any record found during a year}

begin
    a := 1;

    while (true) do
    begin
        yearString := ExtractWord(a, yearInput, [' ']);
        year := strToInt(yearString);
        
        if (year = -1) then break;  {-1 indicates end of file}
        
        noMatch := true;
        writeln('Year ', year, ':');
        for b := 0 to (size - 2) do
        begin
            {president is found if he is in the year recorded}
            if ((Presidents[b].startYear <= year) and (Presidents[b].endYear >= year)) then
            begin
                noMatch := false;   {noMatch becomes false if a president is found}

                write(Presidents[b].firstName, ' ');
                if (Presidents[b].middleInitials <> '') then
                    write(Presidents[b].middleInitials, ' ');
                    
                writeln(Presidents[b].lastName, ' ');
            end;
        end;
        
        if (noMatch) then
            writeln('No match');
            
        writeln();
        a := a + 1;
    end;
end;


{-------------------------------MAIN---------------------------------}
begin
    {these print statements help with reading the consoles}
    writeln();
    writeln('===================OUTPUT======================');
    writeln('Reading the contents of file: ', FILE_NAME);
    writeln('===============================================');
    writeln();
    
    {the array of records can store up to 20 presidents}
    setLength(Presidents, 20);
    
    {read all presidents and store in an array of records}
    readPresidents();
    
    {prints all presidents unsorted}
    writeln(); writeln('======Original Order======');
    printPresidents();  
    
    
    {sort all presidents by start year}
    sortPresidents(); 


    {prints all presidents sorted}
    writeln(); writeln('======Sorted Order========');
    printPresidents();
    
    {prints all presidents in office during given years}
    writeln(); writeln('======Presidents in Office========');
    printPresidentsInOfficeDuringYear();
    
    {these print statements indicate the end of the program}
    writeln('===============================================');
    writeln('File ', FILE_NAME, ' was probably read.');
    writeln('===============================================');
  
end.