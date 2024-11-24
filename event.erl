-module(event).
-behaviour(gen_event).

-export([init/1, handle_event/2, terminate/2]).

init(_Args) ->
  {ok, []}.

handle_event(ErrorMsg, State) ->
  io:format("hi mate sorry to say that but you have ~p\n", [ErrorMsg]),
  {ok, State}.

terminate(_Args, _State) ->
  ok.

%a = {local, error_man}.
%or {global, error_man} if you wanna notify all nodes
%so to start gen_event:start(a).
%gen_event:add_handler(error_man, event, []).
%ok
%gen_event:notify(error_man, smth).
%hi mate sorry to say that but you have smth.
%ok
%to delete the event handler event use
%gen_event:delete_handler(error_man, event, []).
%and you can just stop the event manager
%gen_event:stop(error_man).

