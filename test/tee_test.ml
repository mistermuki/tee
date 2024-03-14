open Tee

(** Standard Tee Types *)

(* TeeString *)
let _ = tee (module TeeString) ("", "", "empty strings")
let _ = tee (module TeeString) ("abcdef", "abcdef", "lowercase strings")
let _ = tee (module TeeString) ("XYZ", "XYZ", "uppercase strings")
let _ = tee (module TeeString) ("ABBfeFKowmfnfwWFWnbnfauiowprWrmasfns", "ABBfeFKowmfnfwWFWnbnfauiowprWrmasfns", "mixed strings")

(* TeeInt *)
let _ = tee (module TeeInt) (0, 0, "zero ints")
let _ = tee (module TeeInt) (-100, -100, "negative ints")
let _ = tee (module TeeInt) (123, 123, "positive ints")

(* TeeFloat *)
let _ = tee (module TeeFloat) (0., 0., "zero floats")
let _ = tee (module TeeFloat) (-100.123, -100.123, "negative floats")
let _ = tee (module TeeFloat) (123.456, 123.456, "positive floats")

(* TeeBool *)
let _ = tee (module TeeBool) (true, true, "true bool")
let _ = tee (module TeeBool) (false, false, "false bool")

(* TeeOption *)
let _ = tee (module TeeOption(TeeBool)) (Some(true), Some(true), "some bool option")
let _ = tee (module TeeOption(TeeString)) (None, None, "none string option")

(* TeeList *)
let _ = tee (module TeeList(TeeInt)) ([], [], "empty int list")
let _ = tee (module TeeList(TeeBool)) ([true;false;true;true], [true;false;true;true], "bool list")

(* TeePair *)
let _ = tee (module TeePair(TeeInt)(TeeInt)) ((0, 0), (0, 0), "int pair")
let _ = tee (module TeePair(TeeString)(TeeInt)) (("abdEF", 0), ("abdEF", 0), "string int pair")

(* Created Type *)
type point = { latitude: float; longitude: float }

module TeePoint = struct
    type t = point
    let to_string(x) = "{ lat: " ^ string_of_float(x.latitude) ^ ", lon: " ^ string_of_float(x.longitude) ^ " }"
end

let p = { latitude = 10.; longitude = 10. } 
let _ = tee (module TeePoint) (p, { latitude = 10.; longitude = 10. }, "equal points");
