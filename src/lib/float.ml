open General


external ( + ) : float -> float -> float = "%addfloat"

external ( - ) : float -> float -> float = "%subfloat"

external ( * ) : float -> float -> float = "%mulfloat"

external ( / ) : float -> float -> float = "%divfloat"


external float_of_string : string -> float = "caml_float_of_string"


let of_string s =
    try
        Some (float_of_string s)
    with
        Failure _ -> None

external of_int : int -> float = "%floatofint"