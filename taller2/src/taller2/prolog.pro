read_file(File, Chars) :-
    open(File, read, Stream),
    get_char(Stream, Char),
    read_file(Stream, Char, Chars),
    close(Stream).

read_file(Stream, Char, Chars) :-
    (   Char == end_of_file ->
        Chars = []
    ;   Chars = [Char| Rest],
        get_char(Stream, Next),
        read_file(Stream, Next, Rest)
    ).