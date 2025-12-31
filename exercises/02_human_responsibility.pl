% ==============================================================================
% Exercise: 02_human_responsibility.pl
% Description: Determine human responsibility through consciousness and freedom
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines humans with consciousness and freedom attributes
% - Determines responsibility based on both attributes
% - Verifies individual attributes and responsibility status
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_human(eduardo).
is_human(evelyn).
is_human(elias).

has_consciousness(X) :- is_human(X).
has_freedom(X) :- is_human(X).
is_responsible(X) :- has_consciousness(X), has_freedom(X).

attribute_name(has_consciousness, 'consciousness').
attribute_name(has_freedom, 'freedom').
attribute_name(is_responsible, 'responsible').

verify_and_show(Name, Attribute) :-
  attribute_name(Attribute, AttributeName),
  (
    call(Attribute, Name)
    -> format('[OK] ~w has ~w~n', [Name, AttributeName])
    ; format('[NO] ~w does not have ~w~n', [Name, AttributeName])
  ).

verify_responsibility(Name) :-
  attribute_name(is_responsible, AttributeName),
  (
    is_responsible(Name)
    -> format('[OK] ~w is ~w~n', [Name, AttributeName])
    ; format('[NO] ~w is not ~w~n', [Name, AttributeName])
  ).

show_all_humans :-
  write('List of humans:'), nl,
  forall(
    is_human(X),
    format('  - ~w~n', [X])
  ).

main :-
  write('=== Human Responsibility ==='), nl, nl,

  verify_and_show(eduardo, has_consciousness),
  verify_and_show(eduardo, has_freedom),
  verify_responsibility(eduardo),
  nl,

  show_all_humans, nl.
