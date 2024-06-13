program z4; 

type
NodePtr = ^Node;
Node = record
data: Integer;
next: NodePtr;
end;

function FindMaxElement(head: NodePtr): Integer; 
var
current: NodePtr;
maxElement: Integer;
begin
current := head;
maxElement := head^.data;

while current <> nil do 
begin
if current^.data > maxElement then
maxElement := current^.data;

current := current^.next;
end;

FindMaxElement := maxElement;
end;

function FindMinElement(head: NodePtr): Integer; 
var
current: NodePtr;
minElement: Integer;
begin
current := head;
minElement := head^.data;

while current <> nil do
begin
if current^.data < minElement then
minElement := current^.data;

current := current^.next;
end;

FindMinElement := minElement; 
end;

var
head, current, newNode: NodePtr;
f: TextFile;
i, value: Integer;
begin
AssignFile(f, 'num.txt');
Reset(f);

New(head);
current := head;

while not EOF(f) do
begin
Readln(f, value);
New(newNode);
newNode^.data := value;
newNode^.next := nil;

current^.next := newNode;
current := newNode;
end;

CloseFile(f);

current := head^.next;
writeln('Список:');
while current <> nil do
begin
write(current^.data, ' ');
current := current^.next;
end;
writeln;

writeln('Максимальный элемент: ', FindMaxElement(head^.next));
writeln('Минимальный элемент: ', FindMinElement(head^.next));
end.