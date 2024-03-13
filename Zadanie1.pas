program Zadanie1;

uses
  crt;

const
  WielkoscTablicy = 50;

var
  ListaLiczb: array[1..WielkoscTablicy] of integer;

procedure LosoweLiczby;
var
  i, losowana: integer;
begin
  for i := 1 to 50 do
  begin
    losowana := random(101);
    ListaLiczb[i] := losowana;
    writeln('Losowa liczba nr. ', i, ' to: ', losowana);
  end;
end;

procedure Sortowanie(var A: array of integer; Size: integer);
var
  i, j, temp: integer;
begin
  for i := 0 to Size - 1 do
    for j := 0 to Size - i do
      if A[j] > A[j + 1] then
      begin
        temp := A[j];
        A[j] := A[j + 1];
        A[j + 1] := temp;
      end;
end;

procedure WypiszPosortowane;
var
  i: integer;
begin
  writeln('Posortowane liczby to:');
  for i := 1 to WielkoscTablicy do
    writeln('Liczba nr. ', i, ' to: ', ListaLiczb[i]);
end;

procedure LosoweLiczbyZakres(odilu, doilu, ile: integer);
var
  i, losowana: integer;
begin
  for i := 1 to ile do
  begin
    losowana := random(doilu - odilu + 1) + odilu;
    ListaLiczb[i] := losowana;
    writeln('Losowa liczba nr. ', i, ' to: ', losowana);
  end;
end;


begin
  randomize;
  LosoweLiczby;
  Sortowanie(ListaLiczb, WielkoscTablicy);
  WypiszPosortowane;
  LosoweLiczbyZakres(10,15,5);
end.