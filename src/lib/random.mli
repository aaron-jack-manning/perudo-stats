open General


(** Generates a random integer between low (inclusive) and high (exclusive). *)
val integer : int -> int -> int

(** Generates a random float between low (inclusive) and high (exclusive). *)
val float : float -> float -> float

(** Generates a random boolean at even odds. *)
val boolean : unit -> bool