% ==============================================================================
% Exercise: 03_weather_activities.pl
% Description: Determines available activities based on weather conditions
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines weather state (rainy/pleasant)
% - Infers available activities based on weather
% - Lists all possible activities
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_rainy.

is_pleasant :- \+ is_rainy.
can_picnic :- is_pleasant.
can_swim :- is_pleasant.

activity_name(can_picnic, 'have a picnic').
activity_name(can_swim, 'go swimming').
weather_name(is_rainy, 'rainy').
weather_name(is_pleasant, 'pleasant').

check_weather(Weather) :-
  weather_name(Weather, WeatherName),
  (
    call(Weather)
    -> format('[OK] the weather is ~w~n', [WeatherName])
    ; format('[NO] the weather is not ~w~n', [WeatherName])
  ).

check_activity(Activity) :-
  activity_name(Activity, ActivityName),
  (
    call(Activity)
    -> format('[OK] ~w~n', [ActivityName])
    ; format('[NO] ~w~n', [ActivityName])
  ).

show_all_activities :-
  write('List of activities:'), nl,
  forall(
    activity_name(_, Name),
    format('  - ~w~n', [Name])
  ).

main :-
  write('=== Climate Activity ==='), nl, nl,

  check_weather(is_rainy),
  check_weather(is_pleasant),
  check_activity(can_picnic),
  check_activity(can_swim),
  nl,

  show_all_activities, nl.
