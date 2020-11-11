/*Untuk File .pl*/

/* Bagian I */
/* Deklarasi Fakta */
pria(yoga).
pria(zayn_malik).
pria(padil).
pria(jovan).
pria(zunan).
pria(farras).
pria(william).
pria(smallfaris).
pria(baby_thajeb).

wanita(lisa).
wanita(asin).
wanita(rikha).
wanita(siti).
wanita(nurbaya).

usia(yoga,71).
usia(lisa,65).
usia(zayn_malik,56).
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
usia(baby_thajeb,3).

menikah(yoga,lisa).
menikah(lisa,yoga).
menikah(zayn_malik,asin).
menikah(asin,zayn_malik).
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
anak(siti,zayn_malik).
anak(siti,asin).
anak(william,zayn_malik).
anak(william,asin).
anak(nurbaya,padil).
anak(nurbaya,rikha).
anak(smallfaris,farras).
anak(smallfaris,siti).
anak(baby_thajeb,william).
anak(baby_thajeb,nurbaya).

saudara(jovan,zunan).
saudara(jovan,farras).
saudara(zunan,jovan).
saudara(zunan,farras).
saudara(farras,jovan).
saudara(farras,zunan).
saudara(siti,william).
saudara(william,siti).

/* Deklarasi Rules */
kakak(X,Y) :- 
    saudara(X,Y), 
    usia(X,A), 
    usia(Y,B), 
    A > B.
keponakan(X,Y) :- 
    anak(X,Z), 
    saudara(Y,Z).
suami(X,Y) :- 
    menikah(X,Y), 
    pria(X).
sepupu(X,Y) :- 
    anak(X,A), 
    anak(Y,B), 
    saudara(A,B).
mertua(X,Y) :- 
    anak(Z,X), 
    menikah(Y,Z).
bibi(X,Y) :- 
    anak(Y,Z), 
    saudara(X,Z), 
    wanita(X).
cucu(X,Y) :- 
    anak(X,Z), 
    anak(Z,Y).
anaksulung(X) :- 
    anak(X,Y),
    \+kakak(_,X).
anakbungsu(X) :-
    anak(X,Y),
    \+kakak(X,_).


/* Bagian II */
faktorial(0,1) :- !.
faktorial(N,X) :- 
    N1 is N - 1, 
    faktorial(N1,X1), 
    X is X1 * N.

gcd(X,0,X) :- !.
gcd(0,X,X) :- !.
gcd(A,B,X) :-
    A1 is A mod B,
    gcd(B,A1,X).

power(A,0,1) :- A\=0, !.
power(A,B,X) :- B>0, B1 is B-1, power(A,B1,X1), X is A*X1.
power(A,B,X) :- B<0, A1 is 1/A, B1 is B*(-1), power(A1,B1,X).

countDigit(A,X) :- A<10, X is 1, !.
countDigit(A,X) :- A1 is A div 10, countDigit(A1,X1), X is X1+1.

printLine(0) :- n1, !.
printLine(Y) :- 
    write('*'),
    Y1 is Y-1,
    printLine(Y1).
createTriangle(0) :- !.
createTriangle(X) :- 
    X>0,
    printLine(X),
    X1 is X-1,
    createTriangle(X1).

/* Bagian III */
push(X,[],[X]).
push(Z,[X|Y],[X|W]) :- push(Z,Y,W).

pop([_|X],X).

front([X|_],X).

back([X],X).
back([_|Z],X) :- back(Z,X).

add(_,0,[]) :- !.
add([X|Y],Count,[X|W]) :-
    NewCount is Count-1,
    add(Y,NewCount,W).
concatList([],X,X).
concatList([X|Y],Z,[X|W]) :- concatList(Y,Z,W).
concatenate(FList,SList,X,Y,Result) :-
    add(FList,X,Result1),
    add(SList,Y,Result2),
    concatList(Result1,Result2,Result).

reverseList(X,Y) :- reverseList(X,[],Y).
reverseList([],X,X).
reverseList([X|Y],Z,T) :- reverseList(Y,[X|Z],T).
palindrom(X) :-
    reverseList(X,NewList),
    X = NewList.

