-module(bcrypte).

-export([
        hash/1
      , verify/2
    ]).

-export_type([
        password/0
      , hash/0
    ]).

-on_load(init/0).

init() ->
    PrivDir = code:priv_dir(?MODULE),
    LibName = "libbcrypte",
    erlang:load_nif(filename:append(PrivDir, LibName), 0).

-type password() :: unicode:unicode_binary().

-type hash() :: unicode:unicode_binary().

-spec hash(password()) -> hash().
hash(Arg1) ->
    hash_1(Arg1).

hash_1(Arg1) ->
    erlang:nif_error(nif_module_unavailable, [Arg1]).

-spec verify(password(), hash()) -> boolean().
verify(Arg1, Arg2) ->
    verify_2(Arg1, Arg2).

verify_2(Arg1, Arg2) ->
    erlang:nif_error(nif_module_unavailable, [Arg1, Arg2]).


