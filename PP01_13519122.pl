/*Untuk File .pl*/

/* Bagian I */
/* Deklarasi Fakta */
pria(yoga).
pria(zaynmalik).
pria(padil).
pria(jovan).
pria(zunan).
pria(farras).
pria(william).
pria(smallfaris).
pria(babythajeb).

wanita(lisa).
wanita(asin).
wanita(rikha).
wanita(siti).
wanita(nurbaya).

usia(yoga,71).
usia(lisa,65).
usia(zaynmalik,56).
usia(asin,51).
usia(padil,58).
usia(rikha,40).
usia(jovan,24).
usia(zunan,30).
usia(farras,32).
usia(siti,26).
usia(william,28).
usia(nurbaya,24).
usia(smallfaris,6).
usia(babythajeb,3).

menikah(yoga,lisa).
menikah(lisa,yoga).
menikah(zaynmalik,asin).
menikah(asin,zaynmalik).
menikah(padil,rikha).
menikah(rikha,padil).
menikah(farras,siti).
menikah(siti,farras).
menikah(william,nurbaya).
menikah(nurbaya,william).

anak(jovan,yoga).
anak(jovan,lisa).
anak(zunan,yoga).
anak(zunan,lisa).
anak(farras,yoga).
anak(farras,lisa).
anak(siti,zaynmalik).
anak(siti,asin).
anak(william,zaynmalik).
anak(william,asin).
anak(nurbaya,padil).
anak(nurbaya,rikha).
anak(smallfaris,farras).
anak(smallfaris,siti).
anak(babythajeb,william).
anak(babythajeb,nurbaya).

saudara(jovan,zunan).
saudara(jovan,farras).
saudara(zunan,jovan).
saudara(zunan,farras).
saudara(farras,jovan).
saudara(farras,zunan).
saudara(siti,william).
saudara(william,siti).

/* Deklarasi Rules */
kakak(X,Y) :- saudara(X,Y), usia(X,A), usia(Y,B), A > B.
keponakan(X,Y) :- anak(X,Z), saudara(Y,Z).
suami(X,Y) :- menikah(X,Y), pria(X).
sepupu(X,Y) :- anak(X,A), anak(Y,B), saudara(A,B).
mertua(X,Y) :- anak(Z,X), menikah(Y,Z).
bibi(X,Y) :- anak(Y,Z), saudara(X,Z), wanita(X).
cucu(X,Y) :- anak(X,Z), anak(Z,Y).
anaksulung(X) :- saudara(X,Y), kakak(X,Y).


/* Bagian II */
faktorial(1,1).
faktorial(N,X) :- A is N - 1, faktorial(A,B), X is B * N.

gcd(0,X,X) :- X > 0, !.
gcd(A,B,X) :- A >= B, C is A - B, gcd(C,B,X).
gcd(A,B,X) :- A < B, C is B - A, gcd(C,A,X).

power(X,1,X).
power(A,B,X) :- Y is B - 1, power(A,Y,Z), X is Z * A.

countDigit(0,0).
countDigit(X,X) :- X > 0, X < 10.
countDigit(X,Y) :- A is (X div 10), countDigit(A,B), Y is B + (X mod 10).

