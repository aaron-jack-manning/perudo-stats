open General


external raise : exn -> 'a = "%raise"


let failwith m = raise (Failure m)

let guarantee b =
    if not b then
        failwith "guarantee failed.\n"

let guarantee_equal a b =
    if a <> b then
        failwith "guarantee_equal failed."


    