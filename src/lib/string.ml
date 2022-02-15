open General


external bytes_create : int -> bytes = "caml_create_bytes"
external string_blit : string -> int -> bytes -> int -> int -> unit = "caml_blit_string" [@@noalloc]
external bytes_blit : bytes -> int -> bytes -> int -> int -> unit = "caml_blit_bytes" [@@noalloc]
external bytes_unsafe_to_string : bytes -> string = "%bytes_to_string"
external format_int : string -> int -> string = "caml_format_int"
external format_float : string -> float -> string = "caml_format_float"


external length : string -> int = "%string_length"

external get : string -> int -> char = "%string_safe_get"

let of_int n =
    format_int "%d" n

let of_bool bool =
    if bool then
        "true"
    else
        "false"

let ( + ) s1 s2 =
    let l1 = length s1 in
    let l2 = length s2 in

    let s = bytes_create Int.(l1 + l2) in

    string_blit s1 0 s 0 l1;
    string_blit s2 0 s l1 l2;

    bytes_unsafe_to_string s

let concat : string list -> string =
    List.foldl (fun s m -> s + m) ""

external string_get : string -> int -> char = "%string_safe_get"
let valid_float_lexem s =
    let l = length s in
    let rec loop i =
        if i >= l then s + "." else
        match string_get s i with
        | '0' .. '9' | '-' -> loop Int.(i + 1)
        | _ -> s
    in
    
    loop 0

let of_float f =
    valid_float_lexem (format_float "%.12g" f)
