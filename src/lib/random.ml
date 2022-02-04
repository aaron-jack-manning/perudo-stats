open General


let init = Stdlib.Random.self_init


let integer low high =
    init ();
    Int.((Stdlib.Random.int (high - low)) + low)

let float low high =
    init ();
    Float.((Stdlib.Random.float (high - low)) + low)

let boolean =
    init ();
    Stdlib.Random.bool
