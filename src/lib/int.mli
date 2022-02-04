open General


external ( + ) : int -> int -> int = "%addint"

external ( - ) : int -> int -> int = "%subint"

external ( * ) : int -> int -> int = "%mulint"

external ( / ) : int -> int -> int = "%divint"

external ( mod ) : int -> int -> int = "%modint"

(** Converts the char to an int. *)
external of_char : char -> int = "%identity"

(** Converts the string to an int, returning option type to account for invalid strings. *)
val of_string : string -> int option