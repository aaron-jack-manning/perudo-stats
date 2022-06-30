open General


external ( + ) : int -> int -> int = "%addint"

external ( - ) : int -> int -> int = "%subint"

external ( * ) : int -> int -> int = "%mulint"

external ( / ) : int -> int -> int = "%divint"

external ( mod ) : int -> int -> int = "%modint"

external of_char : char -> int = "%identity"


external int_of_string : string -> int = "caml_int_of_string"

let of_string s =
    try
        Some (int_of_string s)
    with
        | Failure _ -> None



