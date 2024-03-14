(** Signature for TeeTypes. *)
module type TeeType = sig 
    type t
    val to_string: t -> string
end

module TeeList (Tee: TeeType) = struct 
    type t = Tee.t list
    let to_string(list) = let string_list = List.map (fun i -> Tee.to_string(i)) list in "["^String.concat "; " string_list^"]" 
end

module TeeOption(Tee: TeeType) = struct
    type t = Tee.t option
    let to_string(opt) = match opt with | None -> "None" | Some(x: 'a) -> "Some " ^ Tee.to_string(x) 
end

module TeePair (TeeA: TeeType) (TeeB: TeeType) = struct
    type t = TeeA.t * TeeB.t
    let to_string(pair) = match pair with (first, second) -> "(" ^ TeeA.to_string(first) ^ ", " ^ TeeB.to_string(second) ^ ")"
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
