-module(error).
-export([catcher/1]).

generate_exception(1) -> "hi";
generate_exception(50) -> "bye";
generate_exception(40) -> "how are you mate";
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> erlang:error(a).


% Erlang has two methods of catching an exception. One is to enclose the call to
% the function that raises the exception within a `try...catch` expression.
catcher(N) ->
  try generate_exception(N) of
    "hi" -> "it's been a long time";
    "bye" -> "bye mate";
    "how are you mate" -> "fine"
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.