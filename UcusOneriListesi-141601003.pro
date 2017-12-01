Domains
	listem = symbol*.
Predicates
	nondeterm ucus(symbol,symbol).
	nondeterm rota(symbol,symbol,listem).
	nondeterm rota(symbol,symbol,listem,listem).
	nondeterm uye(symbol,listem).
	
Clauses
	%uye
	uye(X,[X|_]).
	uye(X,[_|T]):-
		uye(X,T).
	
	
	%ucus
	ucus(istanbul, denizli).
	ucus(istanbul, trabzon).
	ucus(istanbul, bodrum).
	ucus(istanbul,antalya).
	ucus(istanbul,bodrum).
	ucus(istanbul,dalaman).
	ucus(bodrum, istanbul).
	ucus(bodrum, ankara).
	ucus(dalaman,ankara).
	ucus(dalaman,istanbul).
	ucus(denizli, istanbul).
	ucus(denizli, ankara).
	ucus(trabzon,istanbul).
	ucus(trabzon, ankara).
	ucus(ankara,istanbul).
	ucus(ankara,bodrum).
	ucus(gaziantep,istanbul).
	ucus(gaziantep,ankara).
	ucus(izmir,ankara).
	ucus(izmir,istanbul).
	ucus(izmir,gaziantep).
	ucus(antalya,istanbul).
	ucus(antalya,ankara).
	ucus(antalya,gaziantep).
	
	%rota
	rota(Sehir1,Sehir2,UcusListem):-
		rota(Sehir1,Sehir2,UcusListem,[]).
	rota(Sehir1,Sehir2,[Sehir1,Sehir2],UcusListem):-
		ucus(Sehir1,Sehir2),
		not(uye(Sehir2,UcusListem)).
	rota(Sehir1,Sehir2,[Sehir1|Dinlenme],UcusListem):-
		Listem1 = [Sehir1|UcusListem],
		ucus(Sehir1,Sehir3),
		not(uye(Sehir3,UcusListem)),
		rota(Sehir3,Sehir2,Dinlenme,Listem1).
Goal
	rota(istanbul, gaziantep, UcusListem).