-module(word_count).
-export([wordcount/1]).
-export([charcount/1]).


charcount([]) -> 0;
charcount([_ | Tail]) -> 1 + charcount(Tail).
    


% public
wordcount(Input) ->
    wordcount(Input, 0).

% internal
wordcount([], Count) ->
    Count;

% End of the input. Count the last word, if we didn't already
wordcount([C1], Count) when C1 =/= $\  ->
    Count+1;

% End of a word. Count it.
wordcount([C1, C2|Rest], Count) when C1 =/= $\ , C2 =:= $\  ->
    wordcount([C2|Rest], Count + 1);

% Not the end of a word. Don't count it.
wordcount([_|Rest], Count) ->
    wordcount(Rest, Count).
