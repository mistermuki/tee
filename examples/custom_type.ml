open Tee

type point = { latitude: float; longitude: float }

module TeePoint = struct
    type t = point
    let to_string(x) = "{ lat: " ^ string_of_float(x.latitude) ^ ", lon: " ^ string_of_float(x.longitude) ^ " }"
end

let p = { latitude = 10.; longitude = 10. } 
let _ = tee (module TeePoint) (p, { latitude = 10.; longitude = 10. }, "equal points");
