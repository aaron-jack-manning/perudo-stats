open General


module type RBTreeSet = sig
    (** Type of members in the set. *)
    type member

    (** Purely functional set, implemented as a red, black tree. *)
    type set

    (** The empty set. *)
    val empty : set

    (** Inserts a new element into the set. Runs in O(log(n)). *)
    val insert : member -> set -> set

    (** Determines if a specific value is a member of the set. Runs in O(log(n)). *)
    val member : member -> set -> bool

    (** Computes the union of two sets. Runs in O(mlog(n)), for the first set is of length m and the second is of length n. Hence if the lengths of the sets are known, this algorithm is most efficient if the second set is the longer one. *)
    val union : set -> set -> set

    (** Creates a set from a list. Will deduplicate if necessary. Runs in O(log(n!)). *)
    val of_list : member list -> set

    (** Removes the element specified from the set, if it exists. *)
    val remove : member -> set -> set

    (** Calculates the first set, without any elements that appear in the second. *)
    val difference : set -> set -> set

    (** Calculates the number of elements in the set. Note this is not tail recursive. Runs in O(n). *)
    val cardinality : set -> int

end

module type SetSpecification = sig
    (** Type of members in the set. *)
    type member
    (** Comparison should return a value less than 0 for when the first value is smaller, greater than 0 for when the second is smaller, and 0 when they are equivalent. *)
    val comparison : member -> member -> int
end

module RBTreeSet (M : SetSpecification) : RBTreeSet with type member = M.member