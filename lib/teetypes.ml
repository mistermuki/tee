(* Tee: Test Equality Easily *)
module type TeeType = sig 
    type t
    val to_string: t -> string
end

let tee_string_of_list((list: 'a list), (to_string: 'a -> string)): string =
    let string_list = List.map (fun i -> to_string(i)) list in "["^String.concat "; " string_list^"]"  

let tee_string_of_option((opt: 'a option), (to_string: 'a -> string)): string =
    match opt with | None -> "None" | Some(x: 'a) -> "Some " ^ to_string(x) 

let tee_string_of_pair((pair: ('a * 'b)), (to_string_a: 'a -> string), (to_string_b: 'b -> string)): string =
    match pair with (first, second) -> "(" ^ to_string_a(first) ^ ", " ^ to_string_b(second) ^ ")"

module TeeList (Tee: TeeType) = struct 
    type t = Tee.t list
    let to_string(x) = tee_string_of_list(x, Tee.to_string)
end

module TeeOption(Tee: TeeType) = struct
    type t = Tee.t option
    let to_string(x) = tee_string_of_option(x, Tee.to_string)
end

module TeePair (TeeA: TeeType) (TeeB: TeeType) = struct
    type t = TeeA.t * TeeB.t
    let to_string(x) = tee_string_of_pair(x, TeeA.to_string, TeeB.to_string)
end

module TeeFloat = struct
    type t = float
    let to_string(x) = string_of_float(x)
end

module TeeInt = struct 
    type t = int
    let to_string(x) = string_of_int(x)
end

module TeeString = struct
    type t = string
    let to_string(x) = x
end

module TeeBool = struct
    type t = bool
    let to_string(x) = string_of_bool(x)
end
