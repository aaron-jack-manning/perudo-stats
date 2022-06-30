open General


(** The empty list *)
val empty : 'a list

(** Calculates the length of the given list. Runs in O(n) and should be stored rather then recalculated if many calls are made on an unchanging list. *)
val length : 'a list -> int

(** Returns Some [x] if [x] is the head of the list, or None for the empty list. Runs in O(1). *)
val head : 'a list -> 'a option

(** Returns the tail of the list. Will be the empty list if the original list is empty or only contains one element. Runs in O(1). *)
val tail : 'a list -> 'a list

(** Reverses the order of the elements in the list. [reverse] is tail recursive. Runs in O(n). *)
val reverse : 'a list -> 'a list

(** Appends two lists together, by reversing the first and then appending each element from the first to the second. Runs in O(n), where n is the length of the first list. *)
val ( @ ) : 'a list -> 'a list -> 'a list

(** Maps the given function to each element of the list. [map] is not tail recursive and preserves order. Runs in O(n). *)
val map : ('a -> 'b) -> 'a list -> 'b list

(** Maps the given function to each element of the list. [map_rev_tr] is tail recursive and reverses the order of the list. If you wish to preserve order consider [map] for small lists, and [map_tr] for longer lists. Runs in O(n). *)
val map_rev_tr : ('a -> 'b) -> 'a list -> 'b list

(** Maps the given function to each element of the list. [map_tr] is tail recursive, and therefore has to reverse the resulting list. Calling [map_tr] is equivalent to calling [reverse] on the result of [map_rev_tr]. Runs in O(n). *)
val map_tr : ('a -> 'b) -> 'a list -> 'b list

(** Folds the list from the left, applying [f] to the existing state and each element at each step, using [init] as the initial state. [foldl] is tail recursive. Runs in O(n). *)
val foldl : ('s -> 'a -> 's) -> 's -> 'a list -> 's

(** Folds the list from the right, by reversing the list and then calling [foldl]. Runs in O(n). *)
val foldr : ('s -> 'a -> 's) -> 's -> 'a list -> 's

(** Combines two lists into a list of tuples, pairing elements in order and returning a list of pairs in reverse order compared to the original lists. [zip2_rev_tr] is tail recursive. Returns result type to handle errors where the two lists are not equal in length. Runs in O(n). *)
val zip2_rev_tr : 'a list -> 'b list -> ('a * 'b) list result

(** Combines two lists into a list of tuples, pairing elements in order from the front. [zip2_rev_tr] is tail recursive. Returns result type to handle errors where the two lists are not equal in length. This is equivalent to reversing the result of [zip2_rev_tr]. Runs in O(n). *)
val zip2_tr : 'a list -> 'b list -> ('a * 'b) list result

(** Converts a list of tuples into a tuple of lists, reversing the order of the elements in the resulting two lists. Runs in O(n). *)
val unzip2_rev_tr : ('a * 'b) list -> 'a list * 'b list

(* Returns all adjascent pairs of values from the list, as well as a pair of the last element and the first element. Runs in O(n). *)
val pairwise : 'a list -> ('a * 'a) list

(** Determines if the specified element is contained within the list, and returns a boolean. Runs in O(n). If this function is being called many times, consider a Set. *)
val contains : 'a -> 'a list -> bool

(** Creates a list of a single element. Runs in O(1). *)
val singleton : 'a -> 'a list

(** Filters a list according to the provided function, including elements where the function evaluates to true. The list is reversed in the process, and [filter_rev_tr] is tail recursive. Runs in O(n). *)
val filter_rev_tr : ('a -> bool) -> 'a list -> 'a list

(** Finds the first element in the provided list where the given function evaluates to true. Returns Some of the element and the index it appeared at, or none if the given function is false for all elements. Runs in O(n). *)
val find : ('a -> bool) -> 'a list -> ('a * int) option

(** Initializes a list using a length and a function from the index to the desired list value. Runs in O(n). *)
val initialize : (int -> 'a) -> int -> 'a list

(* Creates a list from the provided array. *)
val of_array : 'a array -> 'a list