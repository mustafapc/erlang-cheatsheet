-module(app).
-export([hello/0, hi/1, simple/1, smth/2, ca/1, st/0, abc/1]).
-record(todo, {name = "name", age = 10}).
hello() ->
  io:fwrite("hi mate\n"),
  F = "hi mate",
  io:fwrite("~p\n", [F]),
  G = [X * X||X <- lists:seq(1, 10),X rem 2 == 0],
  io:fwrite("~p\n", [G]),
  A = {1, 2, 3},
  B = example_@node,
  io:fwrite("~p",[element(2, A)]),
  io:fwrite("\n"),
  io:fwrite(B),
  io:fwrite("\n"),
  C = [1, 2, 3, 4, 5],
  [D | E] = C,
  io:fwrite("head: ~p tail: ~p \n", [D, E]).

hi(X) ->
  A = fun(B) ->(fun(C) -> B + (C * C) end)end,
  D = A(5),
  E = D(X),
  io:fwrite("~p", [E]),
  F = fun(T) ->(T * 2)end,
  io:fwrite("\n~p\n", [F(10)]).
simple(X) when X > 1, X > 2, X > 3;X < -1, X < -2, X < -3 ->
  io:fwrite("~p",[X]).
smth(Name, Age) ->
  A = #todo{name = Name, age = Age},
  B = #todo{},
  io:fwrite("name: ~p, age: ~p\n", [A#todo.name, A#todo.age]),
  io:fwrite("default name: ~p, age: ~p\n", [B#todo.name, B#todo.age]).
ca(X) ->
  case X of
    1 -> io:fwrite("X = 1\n");
    2 -> io:fwrite("X = 2\n");
    3 -> io:fwrite("X = 3\n");
    _ -> io:fwrite("X = smth out of our values")
  end,
  if 
  X =:= 1 -> io:fwrite("X =:= 1\n");
  true -> io:fwrite("")
  end,

  if
  X == 1 -> io:fwrite("X == 1\n");
  true -> io:fwrite("")
  end,

  if
  X /= 1 -> io:fwrite("X /= 1\n");  
  true -> io:fwrite("")
  end,

  if
  X =/= 1 -> io:fwrite("X =/= 1\n");
  true -> io:fwrite("")
  end,
  A = #{a => 1, b => 2},
  io:fwrite("~p ~p\n", [maps:get(a, A), maps:get(b, A)]),
  B = maps:update(a, 25, A),
  io:fwrite("~p ~p\n", [maps:get(a, B), maps:get(b, B)]).

abc(X) ->
  case X of
  1 -> io:fwrite("one\n");
  2 -> io:fwrite("two\n");
  3 -> io:fwrite("three\n")
  end,
  if 
  X == 1 -> io:fwrite("one from if\n");
  X == 2 -> io:fwrite("two from if\n");
  X == 3 -> io:fwrite("three from if\n")
  end,

  maybe
  X ?= 2,
  io:fwrite("hi X ?= 2\n"),
  X ?= 5
  else
  5 -> io:fwrite("X is not equal to 5\n");
  10 -> io:fwrite("X is not equal to 10\n")
  end,

  receive 
  "one" -> io:fwrite("one sent from self process\n");
  "two" -> io:fwrite("two sent from self process\n");
  _ -> io:fwrite("idk\n")
  end.
st() ->
  A = spawn(app, abc, [2]),
  A ! "a;sad'f;k".
