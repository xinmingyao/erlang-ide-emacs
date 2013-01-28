#!/usr/bin/env escript
-export([main/1]).
-define(TEST,true).
main([F,Base]) ->
 
    Dep=filename:join([Base,"deps"]),
    {ok,Dirs}=file:list_dir(Dep),
    lists:map(fun(A)->
		      Pa= filename:join([Dep,A,"ebin"]),
		      code:add_path(Pa)
			  ,Pa
	      end ,Dirs),
    Includes=lists:map(fun(A)->
			       Pa= filename:join([Dep,A,"include"]),			       
			       {i,Pa}
		       end ,Dirs),
    Opts=[warn_obsolete_guard, warn_unused_import, 
	  warn_shadow_vars, warn_export_vars,
	  strong_validation, report,
	  {i, "../include"},{i,"./include"},{d,'TEST'}],
    compile:file(F,lists:merge(Opts,Includes))
		 .

