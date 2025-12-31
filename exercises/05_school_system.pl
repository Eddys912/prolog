% ==============================================================================
% Exercise: 05_school_system.pl
% Description: Academic system managing students, professors, and courses
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines students, professors, and subjects they teach/take
% - Infers additional course enrollments based on prerequisites
% - Identifies courses taken by all students
% - Lists relationships between professors and students
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_student(sofia).
is_student(gabriel).
is_student(enrique).
is_student(pedro).
is_student(alejandra).
is_professor(veronica).
is_professor(miguel).
is_professor(luis).
is_professor(maria).
is_professor(magdalena).
is_professor(mario).
teaches(veronica, physics).
teaches(miguel, ethics).
teaches(luis, calculus).
teaches(luis, programming).
teaches(magdalena, ai).
teaches(magdalena, operationsResearch).
teaches(magdalena, prolog).
teaches(mario, algebra).
teaches(mario, fundamentalsSoftwareEngineering).
takes_base(sofia, calculus).
takes_base(pedro, programming).
takes_base(enrique, programming).
takes_base(gabriel, fundamentalsSoftwareEngineering).
takes_base(pedro, ai).
takes_base(gabriel, ai).
takes_base(enrique, physics).

takes(Student, Subject) :- takes_base(Student, Subject).
takes(Student, physics) :- takes(Student, calculus).
takes(Student, calculus) :- takes(Student, fundamentalsSoftwareEngineering).
takes(Student, operationsResearch) :- is_student(Student).
takes(Student, algebra) :- takes(Student, ethics), \+ takes(Student, programming).
takes(Student, prolog) :- is_student(Student), \+ takes(Student, ai).
is_taken_by_all(Subject) :-
  takes(_, Subject),
  findall(S, is_student(S), AllStudents),
  length(AllStudents, TotalStudents),
  findall(St, takes(St, Subject), StudentsTakingSubject),
  length(StudentsTakingSubject, CountTaking),
  TotalStudents == CountTaking.

show_all_professors :-
  write('List of teachers:'), nl,
  forall(
    is_professor(Prof),
    format('  - ~w~n', [Prof])
  ).

show_all_students :-
  write('List of students:'), nl,
  forall(
    is_student(Student),
    format('  - ~w~n', [Student])
  ).

show_physics_professors :-
  write('List of teachers who teach physics:'), nl,
  forall(
    teaches(Prof, physics),
    format('  - ~w~n', [Prof])
  ).

show_magdalena_subjects :-
  write('List of subjects taught by Magdalena:'), nl,
  forall(
    teaches(magdalena, Subject),
    format('  - ~w~n', [Subject])
  ).

show_alejandra_subjects :-
  write('List of subjects taken by Alejandra:'), nl,
  forall(
    takes(alejandra, Subject),
    format('  - ~w~n', [Subject])
  ).

show_gabriel_professors :-
  write('List of teachers who teach Gabriel:'), nl,
  forall(
    (takes(gabriel, Subject), teaches(Prof, Subject)),
    format('  - ~w~n', [Prof])
  ).

show_algebra_and_programming :-
  write('List of students taking algebra and programming:'), nl,
  forall(
    (takes(Student, algebra), takes(Student, programming)),
    format('  - ~w~n', [Student])
  ).

show_shared_classes :-
  write('List of subjects that all students share:'), nl,
  findall(Subject, is_taken_by_all(Subject), AllShared),
  sort(AllShared, SharedSorted),
  forall(
    member(Subject, SharedSorted),
    format('  - ~w~n', [Subject])
  ).

show_students_and_subjects :-
  write('List of students and their subjects:'), nl,
  forall(
    takes(Student, Subject),
    format('  - ~w takes ~w~n', [Student, Subject])
  ).

show_professors_and_students :-
  write('List of teachers and students:'), nl,
  forall(
    (teaches(Prof, Subject), takes(Student, Subject)),
    format('  - the teacher ~w teaches classes to ~w~n', [Prof, Student])
  ).

main :-
  write('=== School System ==='), nl, nl,

  show_all_professors, nl,
  show_all_students, nl,
  show_physics_professors, nl,
  show_magdalena_subjects, nl,
  show_alejandra_subjects, nl,
  show_gabriel_professors, nl,
  show_algebra_and_programming, nl,
  show_shared_classes, nl,
  show_students_and_subjects, nl,
  show_professors_and_students, nl.
