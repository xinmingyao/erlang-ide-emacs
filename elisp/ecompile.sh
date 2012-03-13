#!/usr/bin/env escript
-export([main/1]).
-define(TEST,true).
main([File_Name]) ->
    compile:file(File_Name, [warn_obsolete_guard, warn_unused_import, 
                             warn_shadow_vars, warn_export_vars,
  			     strong_validation, report,
  			     {i, "../include"},{i,"./include"},{d,'TEST'}]).

