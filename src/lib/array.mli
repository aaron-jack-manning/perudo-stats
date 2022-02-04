open General


val of_list : 'a list -> 'a array

val length : 'a array -> int

val concat : 'a array list -> 'a array

val append : 'a array -> 'a array -> 'a array

val get : 'a array -> int -> 'a

val set : 'a array -> int -> 'a -> unit

val map : ('a -> 'b) -> 'a array -> 'b array

val create : int -> (int -> 'a) -> 'a array

val heap_sort : ('a -> 'a -> int) -> 'a array -> unit

val merge_sort : ('a -> 'a -> int) -> 'a array -> unit

val copy : 'a array -> 'a array

val linear_search : 'a array -> 'a -> 'a

val binary_search : 'a array -> 'a -> 'a option
