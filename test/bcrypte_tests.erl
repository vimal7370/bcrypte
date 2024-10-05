-module(bcrypte_tests).
-include_lib("eunit/include/eunit.hrl").

-compile([export_all]).

hash_verify_test() ->
    Passwd = <<"Pass w0rd!">>,
    Hash = bcrypte:hash(Passwd),
    ?assertEqual(true, bcrypte:verify(Passwd, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<"Wrong Passw0rd!">>, Hash)),
    ?assertEqual(false, bcrypte:verify(<<>>, <<>>)),
    ?assertEqual(false, bcrypte:verify(Passwd, <<"invalid hash">>)),
    ok.

