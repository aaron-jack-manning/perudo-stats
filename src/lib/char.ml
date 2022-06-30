open General


external unsafe_char_of_int : int -> char = "%identity"


let of_int n =
    if n < 0 or n > 255 then
        None
    else
        Some (unsafe_char_of_int n)
