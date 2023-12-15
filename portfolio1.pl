/*----------------------------------------------------------------------------
  CCS2200 Logic Programming
  Porfolio Submission Fall 2023
  Student ID: CSY22077
  Date of submission:
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  EXERCISE NUMBER: 1  
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: pc/4
  TEXTUAL DECRIPTION: Facts representing each computer and its properties
  QUERIES & ANSWERS:
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% Facts representing each computer and its properties

pc(id1, windows, intel, 500).
pc(id2, linux, amd, 256).
pc(id3, macos, apple, 1000).
pc(id4, windows, amd, 512).
pc(id5, linux, intel, 256).
pc(id6, macos, apple, 500).
pc(id7, windows, amd, 512).
pc(id8, linux, amd, 1000).
pc(id9, macos, intel, 500).
pc(id10, windows, intel, 512).



/*----------------------------------------------------------------------------
  PREDICATE: connected/2
  TEXTUAL DECRIPTION: Facts that represent the connections between the computers
  QUERIES & ANSWERS:
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% Facts that represent the connections between the computers

connected(id1, id4).
connected(id2, id5).
connected(id3, id6).
connected(id4, id7).
connected(id5, id8).
connected(id6, id9).
connected(id7, id10).
connected(id8, id1).
connected(id9, id2).
connected(id10, id3).


/*----------------------------------------------------------------------------
  PREDICATE: part_of/2
  TEXTUAL DECRIPTION: Facts that represent the subnets of the Pcs
  QUERIES & ANSWERS:
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/


% Facts that represent the subnets of the Pcs

part_of(id1, subnet1).
part_of(id2, subnet1).
part_of(id3, subnet1).
part_of(id2, subnet2).
part_of(id4, subnet2).
part_of(id5, subnet2).
part_of(id6, subnet2).
part_of(id1, subnet3).
part_of(id7, subnet3).
part_of(id8, subnet3).
part_of(id3, subnet4).
part_of(id9, subnet4).
part_of(id10, subnet4).


/*----------------------------------------------------------------------------
  PREDICATE: recommended/2
  TEXTUAL DECRIPTION: Facts that represent the processor types and their recommended OS
  QUERIES & ANSWERS:
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% Facts that represent the processor types and their recommended OS

recommended(intel, windows).
recommended(amd, linux).
recommended(apple, macos).


/*----------------------------------------------------------------------------
  PREDICATE: pcs_above_500gb/1
  TEXTUAL DECRIPTION: Lists all Pcs with storage greater than 500 GB
  QUERIES & ANSWERS: 
  ?- pcs_above_500gb(ID).
ID = id3 ;
ID = id4 ;
ID = id7 ;
ID = id8 ;
ID = id10.
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% This rule Lists all Pcs with storage greater than 500 GB

pcs_above_500gb(ID) :-
pc(ID, _, _, Storage),
Storage > 500.


/*----------------------------------------------------------------------------
  PREDICATE: show_subnet/2
  TEXTUAL DECRIPTION: Shows all PCs in a given subnet
  QUERIES & ANSWERS: 
?- show_subnet('subnet1', ID).
ID = id1 ;
ID = id2 ;
ID = id3.

?- show_subnet('subnet2', ID).
ID = id2 ;
ID = id4 ;
ID = id5 ;
ID = id6.

?- show_subnet('subnet3', ID).
ID = id1 ;
ID = id7 ;
ID = id8.

?- show_subnet('subnet4', ID).
ID = id3 ;
ID = id9 ;
ID = id10.
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% This rule shows all PCs in a given subnet

show_subnet(Subnet, ID) :-
part_of(ID, Subnet).


/*----------------------------------------------------------------------------
  PREDICATE: upgradable/1
  TEXTUAL DECRIPTION: Suggests which PCs need upgrading
  QUERIES & ANSWERS: 
  ?- upgradable(ID).
ID = id4 ;
ID = id5 ;
ID = id7 ;
ID = id9 ;
  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

% This rule suggests which PCs need upgrading

upgradable(ID) :-
pc(ID, OS, Processor, _),
recommended(Processor, RecommendedOS),
OS \= RecommendedOS.

/*----------------------------------------------------------------------------
  PREDICATE: part_of/2
  TEXTUAL DECRIPTION: This query returns the computers that belong to more than one
  subnet

  QUERIES & ANSWERS: 
  ?- part_of(ID, Subnet1), part_of(ID, Subnet2), Subnet1 \= Subnet2.
  ID = id1,
  Subnet1 = subnet1,
  Subnet2 = subnet3 ;
  ID = id2,
  Subnet1 = subnet1,
  Subnet2 = subnet2 ;
  ID = id3,
  Subnet1 = subnet1,
  Subnet2 = subnet4 ;

  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------
  PREDICATE: connected/2
  TEXTUAL DECRIPTION: This query returns all computers that are linked to only one other
  computer.

  QUERIES & ANSWERS: 
  ?- connected(ID, OtherID), \+ (connected(ID, AnotherID), OtherID \= AnotherID).
  ID = id1,
  OtherID = id4 ;
  ID = id2,
  OtherID = id5 ;
  ID = id3,
  OtherID = id6 ;
  ID = id4,
  OtherID = id7 ;
  ID = id5,
  OtherID = id8 ;
  ID = id6,
  OtherID = id9 ;

  ADDITIONAL COMMENTS:
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  2
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: db/2
  TEXTUAL DECRIPTION: Facts that map a decimal number to the corresponding binary
  QUERIES & ANSWERS:
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

% Set of Facts that map a decimal number to the corresponding binary

db(0, 0, 0, 0).
db(1, 0, 0, 1).
db(2, 0, 1, 0).
db(3, 0, 1, 1).
db(4, 1, 0, 0).
db(5, 1, 0, 1).
db(6, 1, 1, 0).
db(7, 1, 1, 1).


/*----------------------------------------------------------------------------
  PREDICATE: not/2
  TEXTUAL DECRIPTION: NOT logic gate
  QUERIES & ANSWERS:
  
  
  ADDITIONAL COMMENTS: 
  1st & 2nd argument: input of gate
  3rd argument: output of gate
----------------------------------------------------------------------------*/

not(0, 1).
not(1, 0).


/*----------------------------------------------------------------------------
  PREDICATE: and/4
  TEXTUAL DECRIPTION: AND logic gate
  QUERIES & ANSWERS:
  
  ADDITIONAL COMMENTS: 
  1st, 2nd & 3rd argument: input of gate
  4th argument: output of gate
----------------------------------------------------------------------------*/

and(0, 0, 0, 0).
and(0, 0, 1, 0).
and(0, 1, 0, 0).
and(0, 1, 1, 0).
and(1, 0, 0, 0).
and(1, 0, 1, 0).
and(1, 1, 0, 0).
and(1, 1, 1, 1).



/*----------------------------------------------------------------------------
  PREDICATE: decoder/11
  TEXTUAL DECRIPTION: Rule that simulates a 3-to-8 decoder
  QUERIES & ANSWERS:
  ?- decoder(0, 0, 1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  Z0 = Z2, Z2 = Z3, Z3 = Z4, Z4 = Z5, Z5 = Z6, Z6 = Z7, Z7 = 0,
  Z1 = 1 ;
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/


decoder(A2, A1, A0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7) :-
not(A2, NA2),
not(A1, NA1),
not(A0, NA0),
and(NA2, NA1, NA0, Z0),
and(NA2, NA1, A0, Z1),
and(NA2, A1, NA0, Z2),
and(NA2, A1, A0, Z3),
and(A2, NA1, NA0, Z4),
and(A2, NA1, A0, Z5),
and(A2, A1, NA0, Z6),
and(A2, A1, A0, Z7).


/*----------------------------------------------------------------------------
  PREDICATE: decoder/9
  TEXTUAL DECRIPTION: Queries that output the whole truth table
  QUERIES & ANSWERS:
  ?- decoder(0, 0, 0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(0, 0, 1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(0, 1, 0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(0, 1, 1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(1, 0, 0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(1, 0, 1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(1, 1, 0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  ?- decoder(1, 1, 1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: rc/9
  TEXTUAL DECRIPTION: Rule which simulates the remote control, that is, given a decimal
  number 0 to 7 returns the binary values 0 or 1 of all eight channels depending
  on the button pressed.
  QUERIES & ANSWERS:
  ?- rc(3, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).
  Z0 = Z1, Z1 = Z2, Z2 = Z4, Z4 = Z5, Z5 = Z6, Z6 = Z7, Z7 = 0,
  Z3 = 1 ;
  
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

rc(Decimal, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7) :-
  db(Decimal, A2, A1, A0),
  decoder(A2, A1, A0, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7).



/*----------------------------------------------------------------------------
  PREDICATE: rc/9
  TEXTUAL DECRIPTION: Query that proves if it's possible to have two channels activated 
  simultaneously when you press abutton
  QUERIES & ANSWERS:
  ?- rc(Decimal, 0, 0, 0, 0, 1, 0, 1, 0).
  false.
  
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: rc/9
  TEXTUAL DECRIPTION: Query that, given all eight channels with 0 or 1 as values, returns
  which button should be pressed in order to activate this channel.
  QUERIES & ANSWERS:
  ?- rc(Decimal ,0, 0, 0, 0, 1, 0, 0, 0).
  Decimal = 4 ;
  
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: or/5
  TEXTUAL DECRIPTION: OR logic gate
  QUERIES & ANSWERS:
  
  ADDITIONAL COMMENTS: 
  1st, 2nd, 3rd & 4th argument: input of gate
  5th argument: output of gate
----------------------------------------------------------------------------*/

or(0, 0, 0, 0, 0).
or(_,_,_, 1, 1).
or(_,_, 1,_, 1).
or(_, 1,_,_, 1).
or(1,_,_,_, 1).


/*----------------------------------------------------------------------------
  PREDICATE: eight-to-three-encoder/10
  TEXTUAL DECRIPTION: 8-to-3 encoder, that is given an input of
  8 binary in which only one is 1 while the rest are 0, it outputs the binary
  number that corresponds to the position of the input 1.
  QUERIES & ANSWERS:
  ?- eight-to-three-decoder(0,0,0,0,1,0,0,Z2,Z1,Z0).
  Z2 = Z0, Z0 = 1,
  Z1 = 0 .
  
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/


eight-to-three-encoder(A1, A2, A3, A4, A5, A6, A7, Z2, Z1, Z0) :-
or(A1, A3, A5, A7, Z0),
or(A2, A3, A6, A7, Z1),
or(A4, A5, A6, A7, Z2).





/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  3
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: product/4
  TEXTUAL DECRIPTION: Facts that show available products
  QUERIES & ANSWERS:
  
  ADDITIONAL COMMENTS: 
  First argument is the brand 
  Second argument is the product 
  Third argument is the type of the product
  Fourth argument is product the price
----------------------------------------------------------------------------*/

product(
  cannon,
  xlc450,
  type(camera),
  price(250)
).
product(
  penguin_books,
  1984,
  type(book),
  price(80)
).
product(
  scribner,
  the_great_gatsby,
  type(book),
  price(90)
).
product(
  bloomsbury,
  harry_potter_and_the_sorcerers_stone,
  type(book),
  price(10)
).
product(
  little_brown_and_company,
  the_catcher_in_the_rye,
  type(book),
  price(60)
).
product(
  nikon,
  d850,
  type(camera),
  price(800)
).
product(
  leica,
  q2,
  type(camera),
  price(900)
).
product(
  george_allen_and_unwin,
  the_hobbit,
  type(book),
  price(10)
).
product(
  doubleday,
  the_da_vinci_code,
  type(book),
  price(15)
).
product(
  gopro,
  hero9 ,
  type(camera),
  price(100)
).
product(
  fujifilm,
  x-t4,
  type(camera),
  price(100)
).


/*----------------------------------------------------------------------------
  PREDICATE: purchase/3
  TEXTUAL DECRIPTION: Facts that show the purhceses that customers have made
  QUERIES & ANSWERS:

  ADDITIONAL COMMENTS: 
  1st argument the name of the user
  2nd argument what the user has bought
  3rd argument the date when the user has bought 
----------------------------------------------------------------------------*/

purchase(
  user(lukas_stojanovski),
  bought(fujifilm, x-t4),
  date(17, 09, 2021)
).
purchase(
  user(gorjan_sharkovski),
  bought(doubleday, the_da_vinci_code),
  date(04, 07, 2022)
).
purchase(
  user(gorjan_sharkovski),
  bought(gopro, hero9),
  date(07, 10, 2022)
).
purchase(
  user(mihail_markovski),
  bought(nikon, d850),
  date(10, 02, 2022)
).
purchase(
  user(nikola_trajkovski),
  bought(cannon, xlc450),
  date(17, 08, 2023)
).


/*----------------------------------------------------------------------------
  PREDICATE: rp/2
  TEXTUAL DECRIPTION: Predicate that If called with the name of the buyer, it recommends
  products of the same type as those bought in the past.
  QUERIES & ANSWERS:
  ?- rp(lukas_stojanovski, Buy).
  Buy = (cannon, xlc450, price(250)) ;
  Buy = (nikon, d850, price(800)) ;
  Buy = (leica, q2, price(900)) ;
  Buy = (gopro, hero9, price(100)) ;  

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

rp(User, NewProduct) :-
purchase(user(User), bought(Brand, ProductID), _),
product(Brand, ProductID, Type, _),
product(NewBrand, NewProductID, Type, Price),
NewProduct = (NewBrand, NewProductID, Price),
Brand \= NewBrand. 

/*----------------------------------------------------------------------------
  PREDICATE: product_year/3
  TEXTUAL DECRIPTION: A predicate that if called with the name of the buyer and a year, it
  outputs all products bought only in that year.
  QUERIES & ANSWERS:
  ?- product_year(gorjan_sharkovski, 2022, Product).
  Product = (doubleday, the_da_vinci_code) ;
  Product = (gopro, hero9).


  ADDITIONAL COMMENTS: 
  I used the same predicate for part d) and e)
----------------------------------------------------------------------------*/

product_year(User, Year, Product) :-
purchase(user(User), bought(Brand, ProductID), date(_, _, Year)),  
buyerName = User,
Product = (Brand, ProductID). 


/*----------------------------------------------------------------------------
  PREDICATE: product_year/3
  TEXTUAL DECRIPTION: A predicate that if called with the name of the buyer and a year, it
  outputs all products bought only in that year.
  QUERIES & ANSWERS:
  ?- product_year(User, 2022, Product).
  User = gorjan_sharkovski,
  Product = (doubleday, the_da_vinci_code) ;

  User = gorjan_sharkovski,
  Product = (gopro, hero9) ;

  User = mihail_markovski,
  Product = (nikon, d850) ;


  ADDITIONAL COMMENTS: 
  I used the same predicate for part d) and e)
----------------------------------------------------------------------------*/

product_year(User, Year, Product) :-
purchase(user(User), bought(Brand, ProductID), date(_, _, Year)),  
buyerName = User,
Product = (Brand, ProductID).     





/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  4 NE ZAVRSENA
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: pp/4
  TEXTUAL DECRIPTION: Predicate which given two numbers X and Y where X<Y and
  another positive number N, returns the product of:
  X^N *(X+1)^N *(X+2)^N *...*(Y-1)^N *Y^N
  QUERIES & ANSWERS:
  ?- pp(2, 5, 2, Result).
  Result = 14400 .
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

pp(X, Y, N, Result) :-
    Y < X,
    Result is 1.

pp(X, Y, N, Result) :-
    Y =:= X,
    Result is X^N.

pp(X, Y, N, Result) :-
    X < Y,
    X1 is X + 1,
    pp(X1, Y, N, Remaining),
    Result is (X^N) * Remaining.


    



/*----------------------------------------------------------------------------
  PREDICATE: sr/3
  TEXTUAL DECRIPTION: Facts that simplify some rules
  QUERIES & ANSWERS:
  
  ADDITIONAL COMMENTS: 
  1st argument is input
  2nd argument is input
  3rd argument is output
----------------------------------------------------------------------------*/

sr(x,1,x).
sr(x,0,x).
sr(x,0,0).
sr(x,x,1).
sr(0,x,x).
sr(x,1,x).
sr(x,0,1).
sr(1,x,1).
sr(0,x,0).



/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  5
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: average_fmf/2
  TEXTUAL DECRIPTION: This predicate finds the average of the first, middle one
  or middle two elements depends on the list if it contains an odd or even number 
  of elements and the last element, if the list is empty it returns a warning message
  that the list is empty

  QUERIES & ANSWERS:
  ?- average_fmf([], Avg).
  Avg = 'Warning: Empty list' ;
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

average_fmf(List, Result) :-
length(List, Len),
Len =:= 0,
Result = 'Warning: Empty list'.


/*----------------------------------------------------------------------------
  PREDICATE: average_fmf/2
  TEXTUAL DECRIPTION: This predicate finds the average of the first, middle one
  and the last element in the a odd number of elements list
  QUERIES & ANSWERS:
  ?- average_fmf([1,2,3,4,5], Avg).
  First: 1, Middle: 3, Last: 5
  Avg = 3 ;
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

average_fmf(List, Average) :-
length(List, Len),
Len > 0,
1 =:= Len mod 2,
append([First], MiddleLast, List),
append(Middle, [Last], MiddleLast),
length(Middle, MiddleLen),
MiddleLenDiv2 is MiddleLen // 2,
length(FirstPart, MiddleLenDiv2),
append(FirstPart, [MiddleElement | _], Middle),
Average is (First + MiddleElement + Last) / 3,
format('First: ~w, Middle: ~w, Last: ~w~n', [First, MiddleElement, Last]).


/*----------------------------------------------------------------------------
  PREDICATE: average_fmf/2
  TEXTUAL DECRIPTION: This predicate finds the average of the first, middle two 
  elements and the last element in a even number of elements list
  QUERIES & ANSWERS:
  ?- average_fmf([1,2,3,4,5,6], Avg).
  First: 1, Middle1: 3, Middle2: 4, Last: 6
  Avg = 3.5 ;
  
  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

average_fmf(List, Average) :-
length(List, Len),
Len > 0,
0 =:= Len mod 2,
append([First], MiddleLast, List),
append(Middle, [Last], MiddleLast),
find_middle_elements(List, Element1, Element2),
length(List, Len),                    
Len > 1,                              
MiddleRightIndex is Len // 2,         
MiddleLeftIndex is MiddleRightIndex - 1,  
nth0(MiddleLeftIndex, List, Element1),   
nth0(MiddleRightIndex, List, Element2), 
Average is (First + Element1 + Element2 + Last) / 4,
format('First: ~w, Middle1: ~w, Middle2: ~w, Last: ~w~n', [First, Element1, Element2, Last]).

/*----------------------------------------------------------------------------
  PREDICATE: find_middle_elements/3
  TEXTUAL DECRIPTION: This predicate find the two middle elements in a list 
  with even number of elements

  QUERIES & ANSWERS:
  ?- find_middle_elements([1,2,3,4,5,6],E1, E2).
  E1 = 3,
  E2 = 4.

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

find_middle_elements(List, Element1, Element2) :-
length(List, Len),                    
Len > 1,                              
MiddleRightIndex is Len // 2,         
MiddleLeftIndex is MiddleRightIndex - 1,  
nth0(MiddleLeftIndex, List, Element1),   
nth0(MiddleRightIndex, List, Element2), 
Element1 \= Element2. 




/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  6 NE ZAVRSENA
----------------------------------------------------------------------------*/

/*------------------------------------------------------------------------
  CC2200 Logic Programming
  Help file for the purposes of labs

  string_to_listofletters/2: takes a string and transforms it
  into a list of lower case letters.

  Comments: 
  - It accepts only upper and lower case letters in the string
  - A space is left as a space
  - All other characters are marked as invalid.
------------------------------------------------------------------------*/

string_to_listofletters(String,ListOfLetters):-
	string_codes(String,AsciiList),		% built-in
	asciitoletters(AsciiList,ListOfLetters).
	
asciitoletters([],[]).
asciitoletters([32|AsciiT],[' '|T]):-		% a space
	asciitoletters(AsciiT,T).
asciitoletters([AsciiH|AsciiT],[H|T]):-		% a lower case
	AsciiH>=97, 
	AsciiH=<122,!,
	name(H,[AsciiH]),			% built-in
	asciitoletters(AsciiT,T).
asciitoletters([AsciiH|AsciiT],[H|T]):-		% an upper case
	AsciiH>=65, 
	AsciiH=<90,!,
	LowerAsciiH is AsciiH+32,
	name(H,[LowerAsciiH]),			% built-in	
	asciitoletters(AsciiT,T).
asciitoletters([_|AsciiT],[invalid|T]):-	% all others
	asciitoletters(AsciiT,T).

/*------------------------------------------------------------------------
  string_to_listofwords/2: takes a string and transforms it
  into a list of words which are lists of letters.

  Comments: 
  - It accepts only upper and lower case letters in the string
------------------------------------------------------------------------*/

string_to_listofwords(String,ListOfWords):-
	string_to_listofletters(String,ListOfLetters),
	letters_to_wordlists(ListOfLetters, ListOfWordsTemp),
	get_rid_of_spaces(ListOfWordsTemp,ListOfWords).

letters_to_wordlists(ListOfLetters, [Word|RestListOfWords]):-
	append(Word,[' '|Rest],ListOfLetters),!,
	letters_to_wordlists(Rest,RestListOfWords).	
letters_to_wordlists(X,[X]).

get_rid_of_spaces([],[]).			% get rid of []s
get_rid_of_spaces([[]|T],R):-
	get_rid_of_spaces(T,R).
get_rid_of_spaces([H|T],[H|R]):-
	H\=[],
	get_rid_of_spaces(T,R).


/*----------------------------------------------------------------------------
  PREDICATE: braille/2
  TEXTUAL DECRIPTION: Facts that represent braille for each letter

  QUERIES & ANSWERS:

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/
  % Braille representation for each letter
braille(a, [1,0,0,0,0,0]).
braille(b, [1,0,1,0,0,0]).
braille(c, [1,1,0,0,0,0]).
braille(d, [1,1,0,1,0,0]).
braille(e, [1,0,0,1,0,0]).
braille(f, [1,1,1,0,0,0]).
braille(g, [1,1,1,1,0,0]).
braille(h, [1,0,1,1,0,0]).
braille(i, [0,1,1,0,0,0]).
braille(j, [0,1,1,1,0,0]).
braille(k, [1,0,0,0,1,0]).
braille(l, [1,0,1,0,1,0]).
braille(m, [1,1,0,0,1,0]).
braille(n, [1,1,0,1,1,0]).
braille(o, [1,0,0,1,1,0]).
braille(p, [1,1,1,0,1,0]).
braille(q, [1,1,1,1,1,0]).
braille(r, [1,0,1,1,1,0]).
braille(s, [0,1,1,0,1,0]).
braille(t, [0,1,1,1,1,0]).
braille(u, [1,0,0,0,1,1]).
braille(v, [1,0,1,0,1,1]).
braille(w, [0,1,1,1,0,1]).
braille(x, [1,1,0,0,1,1]).
braille(y, [1,1,0,1,1,1]).
braille(z, [1,0,0,1,1,1]).
braille(' ', [0,0,0,0,0,0]).

/*----------------------------------------------------------------------------
  PREDICATE: ltb/2
  TEXTUAL DECRIPTION: This predicate converts a list of letters to Braille

  QUERIES & ANSWERS:
  ?- ltb(['l','u'], R).
  R = [[1, 0, 1, 0, 1, 0], [1, 0, 0, 0, 1, 1]].

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

% Predicate to convert a list of letters to Braille

ltb([], []).
ltb([Letter|Letters], [Braille|Brailles]) :-
    braille(Letter, Braille),
    ltb(Letters, Brailles).

/*----------------------------------------------------------------------------
  PREDICATE: stb/2
  TEXTUAL DECRIPTION: This predicate converts a sentance to Braille

  QUERIES & ANSWERS:
  ?- stb('lukas', R).
  R = [[1, 0, 1, 0, 1, 0], [1, 0, 0, 0, 1, 1], [1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 0|...], [0, 1, 1, 0|...]].

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

% Predicate to convert a sentence to Braille

stb(Sentence, BrailleCode) :-
    string_to_listofwords(Sentence, ListOfWords),
    flatten(ListOfWords, ListOfLetters),
    ltb(ListOfLetters, BrailleCode).




/*----------------------------------------------------------------------------
  PREDICATE: 
  TEXTUAL DECRIPTION: 

  QUERIES & ANSWERS:
  

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

word(apple).
word(banana).
word(cucumber).
word(dragonfruit).
word(elephant).
word(grape).
word(helicopter).
word(iguana).
word(jasmine).
word(kangaroo).
word(lion).
word(mango).
word(nectarine).
word(octopus).
word(pineapple).
word(quetzal).
word(raspberry).
word(strawberry).
word(tomato).
word(umbrella).

/*----------------------------------------------------------------------------
  PREDICATE: 
  TEXTUAL DECRIPTION: 

  QUERIES & ANSWERS:
  

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  7 
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: menu/2
  TEXTUAL DECRIPTION: A Prolog program that implements a menu list and returns a valid choice
  among a list.

  QUERIES & ANSWERS:
  ?- menu(["Example", "Another example", "Final choice"], C).
  Choose one of the following:
  1. Example
  2. Another example
  3. Final choice
  Your choice: 4.
  There is no such option. Choose again!
  Your choice: |: 3.
  You selected "Final choice"
  C = 3 .

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/

% This predicate displays a menu of options and captures the users choice

menu(Options, Choice) :-
    show_menu(Options),
    get_choice(Options, Choice, Option),
    format('You selected "~w"~n', [Option]).


% This predicate displays the menu options to the user

show_menu(Options) :-
    write('Choose one of the following:'), nl,
    show_options(Options, 1).


% This predicate recursively prints the list of options with their corresponding numbers

show_options([], _).
show_options([Option|Rest], Index) :-
    format('~d. ~w~n', [Index, Option]),
    NextIndex is Index + 1,
    show_options(Rest, NextIndex).


% This predicate prompts the user for input and validates the chosen option

get_choice(Options, Choice, Option) :-
    write('Your choice: '),
    read(Ch),
    check_choice(Ch, Options, Choice, Option).


% This predicate validates the users input and retrieves the selected option

check_choice(Choice, Options, Choice, Option) :-
    integer(Choice),
    Choice > 0,
    length(Options, Len),
    Choice =< Len,
    nth1(Choice, Options, Option).
  check_choice(_, Options, Choice, Option) :-
    write('There is no such option. Choose again!'), nl,
    get_choice(Options, Choice, Option).



 

/*----------------------------------------------------------------------------
  PREDICATE: guess_number/0
  TEXTUAL DECRIPTION: This is a Prolog program that guesses an integer number between two numbers
  X and Y that are given by the user. The user thinks of a number and gives the
  range. The program uses the divide-and-conquer technique by dividing ranges
  into halves. After a guess, the user only points out whether the guessed
  number is less or greater than the one the user thought. The program should
  be able to count the number of guesses it did.

  QUERIES & ANSWERS:
  ?- guess_number.
  Think of a number between a range.
  Enter the lower bound: 1.
  Enter the upper bound: |: 10.
  Is your number 5? (yes/no): |: no.
  Is your number higher or lower? (higher/lower): |: higher.
  Is your number 8? (yes/no): |: no.
  Is your number higher or lower? (higher/lower): |: lower.
  Is your number 6? (yes/no): |: yes.
  I guessed your number in 3 guesses. It is 6

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/
guess_number :-
    write('Think of a number between a range.'), nl,
    write('Enter the lower bound: '),
    read(Lower),
    write('Enter the upper bound: '),
    read(Upper),
    guess(Lower, Upper, 0).

guess(Lower, Upper, GuessCount) :-
    GuessCount1 is GuessCount + 1,
    Middle is (Lower + Upper) // 2,
    format('Is your number ~d? (yes/no): ', [Middle]),
    read(Response),
    process_response(Response, Lower, Upper, Middle, GuessCount1).

process_response(yes, _, _, Middle, GuessCount) :-
    format('I guessed your number in ~d guesses. It is ~d.', [GuessCount, Middle]).

process_response(no, Lower, Upper, Middle, GuessCount) :-
    write('Is your number higher or lower? (higher/lower): '),
    read(HigherLower),
    update_bounds(HigherLower, Lower, Upper, Middle, GuessCount).

update_bounds(higher, Lower, Upper, Middle, GuessCount) :-
    NewLower is Middle + 1,
    guess(NewLower, Upper, GuessCount).

update_bounds(lower, Lower, Upper, Middle, GuessCount) :-
    NewUpper is Middle - 1,
    guess(Lower, NewUpper, GuessCount).


/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  8
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: 
  TEXTUAL DECRIPTION: 

  QUERIES & ANSWERS:

  ADDITIONAL COMMENTS: 
----------------------------------------------------------------------------*/













