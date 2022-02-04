open General


module type Map = sig
    (** The type of keys in the map. *)
    type key

    (** Purely functional map, parameterised by the values stored in the map (not the keys). *)
    type 'v map

    (** The empty map. *)
    val empty : 'v map

    (** Inserts the key-value pair into the map. If the key already exists, it is overwritten. Runs in O(log(n)). *)
    val insert : key * 'v -> 'v map -> 'v map
    
    (** Fetches a value from the map based on the key. Returns an option to handle cases where the key is not present. Runs in O(log(n)). *)
    val fetch : key -> 'v map -> 'v option
end

module type MapSpecification = sig
    (** The type of keys in the map. *)
    type key
    (** Comparison should return a value less than 0 for when the first value is smaller, greater than 0 for when the second is smaller, and 0 when they are equivalent. *)
    val comparison : key -> key -> int
end

module RBTreeMap (M : MapSpecification) : Map with type key = M.key
