-module(fabric_rpc).

-export([open_doc/4, get_db_info/1]).


%% rpc endpoints
%%  call to with_db will supply your M:F with a #db{} and then remaining args

open_doc(DbName, DocId, Revs, Options) ->
    with_db(DbName, {couch_api, open_doc, [DocId, Revs, Options]}).

get_db_info(DbName) ->
    with_db(DbName, {couch_db, get_db_info, []}).

%%
%% internal
%%

with_db(DbName, {M,F,A}) ->
    case couch_db:open(DbName, []) of
    {ok, Db} ->
        rexi:reply(apply(M, F, [Db | A]));
    Error ->
        rexi:reply(Error)
    end.


%%
%% helper funs
%%
