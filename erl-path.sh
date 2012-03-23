#!/usr/bin/env escript
-export([main/1]).
-define(TEST,true).
main([1]) ->
    io:format("~s",[code:root_dir()]);
main([_])->
    io:format("~s",[code:lib_dir(tools)]).
