bcrypte
=====

bcrypt for erlang

Build
-----

    $ rebar3 compile

Example
-----

```
1> Hash = bcrypte:hash(<<"Passw0rd!">>).
<<"$2b$12$GPSUIMZbfE3CvjeD3.3yYuymTD2F8mBNUFvpuhHaqbYZ3l8ek.Op6">>
2> bcrypte:verify(<<"Passw0rd!">>, Hash).
true
```

Type
-----

```
-type password() :: unicode:unicode_binary().

-type hash() :: unicode:unicode_binary().
```

Function
-----

```
-spec hash(password()) -> hash().

-spec verify(password(), hash()) -> boolean().
```
