-module(bcrypte_tests).
-include_lib("eunit/include/eunit.hrl").

-compile([export_all]).

hash_verify_test() ->
    Passwd = <<"Pass w0rd!">>,
    Hash = bcrypte:hash(Passwd),
    ?assertMatch(<<"$2b$12$", _/binary>>, Hash),
    ?assertEqual(true, bcrypte:verify(Passwd, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<"Wrong Passw0rd!">>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, <<>>)),
    ?assertEqual(false, bcrypte:verify(Passwd, <<"invalid hash">>)),
    ok.

hash_verify_cost_test() ->
    Passwd = <<"Pass w0rd!">>,
    Hash = bcrypte:hash(Passwd, 10),
    ?assertMatch(<<_:3/binary, "$10$", _/binary>>, Hash),
    ?assertEqual(true, bcrypte:verify(Passwd, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<"Wrong Passw0rd!">>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, <<>>)),
    ?assertEqual(false, bcrypte:verify(Passwd, <<"invalid hash">>)),
    ok.

