%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Personen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

personen([albert, berta, chris, detlef, emma, felix]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Positionen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vorsitzender(X, Leitung)   :- nth0(0, Leitung, X).
stellvertreter(X, Leitung) :- nth0(1, Leitung, X).
sekretaer(X, Leitung)      :- nth0(2, Leitung, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% X ueber Y in der Leitung %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ist_ueber(X, Y, Leitung) :- zur_leitung_gehoeren(X, Leitung),
                            zur_leitung_gehoeren(Y, Leitung),
                            nth0(IndexX, Leitung, X),
                            nth0(IndexY, Leitung, Y),
                            IndexX < IndexY.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zur leitung gehoeren %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zur_leitung_gehoeren(X, Leitung)       :- member(X, Leitung).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nicht zur leitung gehoeren %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nicht_zur_leitung_gehoeren(X, Leitung) :- not(zur_leitung_gehoeren(X, Leitung)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Regeln %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Albert will nicht zur Leitung geh�ren, wenn Emma nicht Vorsitzende wird.%%%%%%%%%%%%%%%%%%%%%%%%%

a(Leitung) :- vorsitzender(emma, Leitung);
			  nicht_zur_leitung_gehoeren(albert, Leitung).

% Berta will nicht zur Leitung geh�ren, wenn sie �ber Chris stehen soll.%%%%%%%%%%%%%%%%%%%%%%%%%%%

b(Leitung) :- ist_ueber(chris, berta, Leitung);
			  nicht_zur_leitung_gehoeren(berta, Leitung).


% Berta will unter gar keinen Umst�nden zusammen mit Felix arbeiten.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c(Leitung) :- nicht_zur_leitung_gehoeren(berta, Leitung).
c(Leitung) :- nicht_zur_leitung_gehoeren(felix, Leitung).

% Chris will nicht mitarbeiten, wenn der Leitung Emma und Felix zusammen angeh�ren.%%%%%%%%%%%%%%%%

d(Leitung) :- nicht_zur_leitung_gehoeren(emma, Leitung).
d(Leitung) :- nicht_zur_leitung_gehoeren(felix, Leitung).
d(Leitung) :- nicht_zur_leitung_gehoeren(chris, Leitung).

% Chris wird nicht mitarbeiten, wenn Felix Vorsitzender oder Berta Sekret�r ist.%%%%%%%%%%%%%%%%%%%

e(Leitung) :- vorsitzender(Vorsitzender, Leitung), Vorsitzender \= felix;
              sekretaer(Sekretaer, Leitung), Sekretaer \= berta.
e(Leitung) :- nicht_zur_leitung_gehoeren(chris, Leitung).

% Detlef wird nicht mit Chris oder Emma arbeiten, wenn er dem einen oder anderen unterstellt ist.%%

f(Leitung) :- nicht_zur_leitung_gehoeren(detlef, Leitung).
f(Leitung) :- ist_ueber(detlef, chris, Leitung);
              ist_ueber(detlef, emma, Leitung).

% Emma will nicht Stellvertreter sein.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g(Leitung) :- stellvertreter(Stellvertreter, Leitung), Stellvertreter \= emma.

% Emma will nicht Sekret�r sein, wenn Detlef Mitglied der Leitung ist.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h(Leitung) :- nicht_zur_leitung_gehoeren(detlef, Leitung).
h(Leitung) :- sekretaer(Sekretaer, Leitung), Sekretaer \= emma.

% Emma will nicht zusammen mit Albert arbeiten, wenn Felix nicht der Leitung angeh�rt.%%%%%%%%%%%%%

i(Leitung) :- zur_leitung_gehoeren(felix, Leitung).
i(Leitung) :- nicht_zur_leitung_gehoeren(emma, Leitung).
i(Leitung) :- nicht_zur_leitung_gehoeren(albert, Leitung).

% Felix will nur mitarbeiten, wenn er oder Chris Vorsitzender wird.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

j(Leitung) :- vorsitzender(chris, Leitung);
			  vorsitzender(felix, Leitung).
j(Leitung) :- nicht_zur_leitung_gehoeren(felix, Leitung).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Leitung belegen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

leitung(Leitung) :-
        % Auswahl von drei Personen.
        personen(Personen),
        member(Vorsitzender, Personen),
        member(Stellvertreter, Personen),
        member(Sekretaer, Personen),

        % Die drei Personen muessen sich unterscheiden.
        Vorsitzender \= Stellvertreter,
        Stellvertreter \= Sekretaer,
        Vorsitzender \= Sekretaer,

        % Zuweisung der Positionen
        Leitung = [Vorsitzender, Stellvertreter, Sekretaer],

        % Es muessen folgende Regeln gelten
        a(Leitung),
        b(Leitung),
        c(Leitung),
        d(Leitung),
        e(Leitung),
        f(Leitung),
        g(Leitung),
        h(Leitung),
        i(Leitung),
        j(Leitung),
!.

%%member(?Elem, ?List)
%%True if Elem is a member of List. The SWI-Prolog definition differs from the classical one. 
%%Our definition avoids unpacking each list element twice and provides 
%%determinism on the last element. E.g. this is deterministic: 

%%nth0(?Index, ?List, ?Elem)
%%True when Elem is the Index'th element of List. Counting starts at 0.

%%!
%%A cut (!) inside a rule will prevent Prolog from backtracking any predicates behind the cut: