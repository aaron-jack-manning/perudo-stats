open General


external ( + ) : float -> float -> float = "%addfloat"

external ( - ) : float -> float -> float = "%subfloat"

external ( * ) : float -> float -> float = "%mulfloat"

external ( / ) : float -> float -> float = "%divfloat"

(** Converts the string to a float, returning option type to account for invalid strings. *)
val of_string : string -> float option

(** Converts the int to a float. *)
val of_int : int -> float