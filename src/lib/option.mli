open General


(* Monadic return for option type. Trivially boxes the variable of type 'a into a 'a option by applying the Some constructor. *)
val return : 'a -> 'a option

(* Monadic return for option type. Trivially boxes the variable of type 'a into a 'a option by applying the Some constructor. *)
val ( ~= ) : 'a -> 'a option

(* Monadic bind for option type. Passes the 'a stored within the 'a option through the supplied function. If the first argument is None, the result is None. *)
val bind : 'a option -> ('a -> 'b option) -> 'b option

(* Monadic bind for option type. Passes the 'a stored within the 'a option through the supplied function. If the first argument is None, the result is None. *)
val ( >>= ) : 'a option -> ('a -> 'b option) -> 'b option

(* Binary operator, applied to the variables of type 'a and 'b respectively in the first two arguments. *)
val binary_operator : 'a option -> 'b option -> ('a -> 'b -> 'c) -> 'c option

(* Maps the supplied function to the 'a within the first argument. *)
val map : 'a option -> ('a -> 'b) -> 'b option

(* Monadic function composition. *)
val compose : ('a -> 'b option) -> ('b -> 'c option) -> 'a -> 'c option

(* Monadic function composition. *)
val ( >=> ) : ('a -> 'b option) -> ('b -> 'c option) -> 'a -> 'c option