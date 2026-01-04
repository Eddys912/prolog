% ==============================================================================
% Exercise: 01_animal_hierarchy.pl
% Description: Animal classification using hierarchical logic rules
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines hierarchy: animal → mammal → canine/feline → specific animals
% - Verifies classifications with type checking
% - Lists all animals in the knowledge base
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_dog(lassie).
is_dog(rin_tin_tin).
is_dog(scooby_doo).
is_cat(garfield).
is_cat(felix).

is_canine(X) :- is_dog(X).
is_feline(X) :- is_cat(X).
is_mammal(X) :- is_canine(X).
is_mammal(X) :- is_feline(X).
is_animal(X) :- is_mammal(X).

show_all_animals :-
  write('List of animals:'), nl,
  forall(
    is_animal(X),
    format('  - ~w~n', [X])
  ).

main :-
  write('=== Animal Classification ==='), nl, nl,

  write('Lassie verification:'), nl,
  (is_canine(lassie) -> write('  [OK] is canine') ; write('  [NO] is not canine')), nl,
  (is_feline(lassie) -> write('  [OK] is feline') ; write('  [NO] is not feline')), nl,
  (is_mammal(lassie) -> write('  [OK] is mammal') ; write('  [NO] is not mammal')), nl,
  (is_animal(lassie) -> write('  [OK] is animal') ; write('  [NO] is not animal')), nl,
  nl,

  show_all_animals, nl.
