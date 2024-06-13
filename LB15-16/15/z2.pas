program lr15_2;

type
  TWord = record
    Word: string;
    Frequency: Integer;
  end;

var
  Dictionary: array of TWord; // массив для хранения слов и их частоты в файле
  WordCount: Integer;
  Word: string;
  F: Text;

function TakeWord(F: Text): string; 
var
  c: char;
begin
  Result := '';
  c := ' '; 
  
  while not Eof(F) and (c <= ' ') do 
    Read(F, c);
  
  while not Eof(F) and (c > ' ') do begin 
    Result := Result + c;
    Read(F, c);
  end;
end;

function FindWordIndex(Word: string): Integer; 
var
  i: Integer;
begin
  for i := 0 to WordCount - 1 do begin 
    if Dictionary[i].Word = Word then begin 
      Result := i; 
      Exit;
    end;
  end;
  
  Result := -1;
end;

procedure AddWord(Word: string);
var
  Index: Integer;
begin
  Index := FindWordIndex(Word); 
  
  if Index = -1 then begin
    SetLength(Dictionary, WordCount + 1);
    Dictionary[WordCount].Word := Word;
    Dictionary[WordCount].Frequency := 1;
    Inc(WordCount);
  end
  else begin
    Inc(Dictionary[Index].Frequency);
  end;
end;

procedure PrintDictionary;
var
  i: Integer;
begin
  for i := 0 to WordCount - 1 do begin 
    WriteLn(Dictionary[i].Word, ': ', Dictionary[i].Frequency);
  end;
end;

begin
  Assign(F, 'input.txt');
  Reset(F);
  
  WordCount := 0;
  
  while not Eof(F) do begin
    Word := TakeWord(F);
    AddWord(Word); 
  end;
  
  Close(F);
  
  WriteLn('Количество различных слов: ', WordCount);
 
end.
