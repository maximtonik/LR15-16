program z3;

type
  PNode = ^Node; 
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head, Temp: PNode;
  i: integer;


function CreateNode(value: integer): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := value;
  NewNode^.next := nil;
  Result := NewNode;
end;


procedure AddNode(var Head: PNode; NewNode: PNode);
var
  Temp: PNode;
begin
  if Head = nil then
    Head := NewNode
  else
  begin
    Temp := Head;
    while Temp^.next <> nil do
      Temp := Temp^.next;
    Temp^.next := NewNode;
  end;
end;


procedure PrintList(Head: PNode);
var
  Temp: PNode;
begin
  Temp := Head;
  while Temp <> nil do
  begin
    Write(Temp^.data, ' ');
    Temp := Temp^.next;
  end;
  Writeln;
end;

begin
  Randomize; 
  Head := nil;
  
  
  for i := 1 to 10 do
    AddNode(Head, CreateNode(Random(100))); 
  
  
  PrintList(Head);
  
  
  Temp := Head;
  Writeln('Четные элементы:');
  while Temp <> nil do
  begin
    if Temp^.data mod 2 = 0 then
      Write(Temp^.data, ' ');
    Temp := Temp^.next;
  end;
end. 