
-- Module Definition
ktav = {}

-- Input Scheme
require("ktav_makor")
require("ktav_full_hebrew")
require("ktav_sbl")

function ktav.process_input(str)
  internal_rep = ktav_makor.get_internal(str)
  output = ktav_full_hebrew.transcribe(internal_rep)
  return output
end
