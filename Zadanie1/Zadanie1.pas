program Zadanie1;

uses
  crt;

const
  WielkoscTablicy = 50;
  WielkoscTablicy2 = 11;

var
  ListaLiczb: array[1..WielkoscTablicy] of integer;
  ListaLiczb2: array[1..WielkoscTablicy2] of integer;
  test: integer;

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

procedure Sortowanie(var Lista: array of integer; Rozmiar: integer);
var
  i, j, t: integer;
begin
  for i := 0 to Rozmiar - 1 do
    for j := 0 to Rozmiar - i - 2 do
      if Lista[j] > Lista[j + 1] then
      begin
        t := Lista[j];
        Lista[j] := Lista[j + 1];
        Lista[j + 1] := t;
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
    ListaLiczb2[i] := losowana;
    writeln('Losowa liczba nr. ', i, ' to: ', ListaLiczb2[i]);
  end;
end;

procedure SprawdzKolejnoscDoPrzodu;
var
  i: integer;
  WKolejnosci: boolean;
begin
  WKolejnosci := true;
  for i := 1 to WielkoscTablicy - 1 do
  begin
    if ListaLiczb[i] > ListaLiczb[i + 1] then
    begin
      writeln('Blad liczby nie sa po kolei');
      WKolejnosci := false;
      break; 
    end;
  end;
  if WKolejnosci = true then
  begin
    inc(test);
    writeln('Test sprawdzenie kolejnosci do przodu zakonczony sukcesem');
  end;
end;

procedure SprawdzKolejnoscDoTylu;
var
  i: integer;
  WKolejnosci: boolean;
begin
  WKolejnosci := true;
  for i := 1 to WielkoscTablicy - 1 do
  begin
    if ListaLiczb[WielkoscTablicy - i] < ListaLiczb[WielkoscTablicy - i - 1] then
    begin
      writeln('Blad liczby nie sa po kolei');
      WKolejnosci := false;
      break; 
    end;
  end;
  if WKolejnosci = true then
  begin
    inc(test);
    writeln('Test sprawdzenie kolejnosci do tylu zakonczony sukcesem');
  end;
end;

procedure SprawdzGore(GornaGranica, IleSprawdzic: integer);
var
  i: integer;
  CzyWieksze: boolean;
begin
  CzyWieksze := false;
  for i := 1 to IleSprawdzic do
  begin
    if ListaLiczb2[i] > GornaGranica then
    begin
      CzyWieksze := true;
      writeln('Blad wystepuje liczba wieksza niz granica');
      break;
    end;
  end;
  if CzyWieksze = false then
  begin
    inc(test);
    writeln('Test sprawdzenie gornej granicy zakonczony sukcesem');
  end;
end;

procedure SprawdzDol(DolnaGranica, IleSprawdzic: integer);
var
  i: integer;
  CzyMniejsze: boolean;
begin
  CzyMniejsze := false;
  for i := 1 to IleSprawdzic do
  begin
    if ListaLiczb2[i] < DolnaGranica then
    begin
      CzyMniejsze := true;
      writeln('Blad wystepuje liczba mniejsza niz granica');
      break;
    end;
  end;
  if CzyMniejsze = false then
  begin
    inc(test);
    writeln('Test sprawdzenie dolnej granicy zakonczony sukcesem');
  end;
end;

procedure SprawdzZakres(KtoraSprawdzic: integer);
begin
  if ListaLiczb2[KtoraSprawdzic] = 0 then
  begin
    inc(test);
    writeln('Test sprawdzenie zakresu generacji zakonczony sukcesem');
  end;
end;


procedure Testy;
begin
  test := 0;
  SprawdzKolejnoscDoPrzodu;
  SprawdzKolejnoscDoTylu;
  SprawdzGore(15, 10);
  SprawdzDol(10, 10);
  SprawdzZakres(11);
  writeln('Testy zakonczone sukcesem ', test, ' z 5');
end;

begin
  randomize;
  LosoweLiczby;
  writeln('');
  Sortowanie(ListaLiczb, WielkoscTablicy);
  WypiszPosortowane;
  writeln('');
  LosoweLiczbyZakres(10,15,10);
  writeln('');
  Testy;
end.