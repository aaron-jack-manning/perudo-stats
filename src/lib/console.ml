open General

external print : string -> unit = "print"

external read_line : int -> string = "read_line"

let print_all (contents : string list) : unit =
    print (String.concat contents)