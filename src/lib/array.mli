open General


val of_list : 'a list -> 'a array

external length : 'a array -> int = "%array_length"

val concat : 'a array list -> 'a array

val append : 'a array -> 'a array -> 'a array

external get: 'a array -> int -> 'a = "%array_safe_get"

external set: 'a array -> int -> 'a -> unit = "%array_safe_set"

val map_mutate : ('a -> 'a) -> 'a array -> unit

val map : ('a -> 'b) -> 'a array -> 'b array

val create : int -> (int -> 'a) -> 'a array

val copy : 'a array -> 'a array

val linear_search : 'a array -> 'a -> 'a

val binary_search : 'a array -> 'a -> 'a option
