program z1;
var
  i: integer;
  i_ptr: ^integer; 
  
begin
  i:=5;
  i_ptr:=@i; 
  writeln('значение: ', i_ptr^);
end.