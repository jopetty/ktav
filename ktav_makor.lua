local lpeg = require("lpeg")

ktav_makor = {}

-- Define the makor grammar
local P, V, C, Ct, Cg = lpeg.P, lpeg.V, lpeg.C, lpeg.Ct, lpeg.Cg
local function node(name, patt) return lpeg.Cc(name) * patt end

local test_string = "laukhaen chakoo-liy n''um-ydwd l'yOm qoomiy lau`ad kiy mish^'pau.tiy l|e':e.sof gOyim l'qauv'tsiy mam'laukhOs lish^'pokh' `:alaeyhem za`'miy kol ch:arOn 'apiy kiy b''eish^ qin''autiy t|\"'+khael k+l-h+'|+rets."

local grammar = Ct(P({
  "input",
  input = V("text") * -1, -- anything, or else empty input
  text = (node("aleph", C(V("aleph"))) + node("vowel", C(V("vowels"))) + node("final_consonant", C(V("final_consonants"))) + node("consonant", C(V("non_final_consonants"))) + node("symbol", C(V("symbols"))) + node("unknown", C(P(1))))^0, 

  -- VOWELS

  vowels = V("waw_vowels") + V("niqqud_vowels") + V("schwa"),

  niqqud_vowels = V("_3_vowels") + V("_2_vowels") + V("_1_vowels") ,

  _3_vowels = P(":au"),
  _2_vowels = P(":a") + P(":e") + P(":+") + P("ae") + P("au") + P("ei"),
  _1_vowels = P("a") + P("e") + P("i") + P("o") + P("u") + P(":") + P("+") + P("|") + P("\""),
  waw_vowels = P("O") + P("w*") + P("oo"),
  schwa = P("'"),

  aleph = P("'") * #V("niqqud_vowels") + (lpeg.B("o") + lpeg.B("e")) * P("'"),

  -- CONSONANTS

  _1_cons = P("v") + P("g") + P("d") + P("h") + P("w") + P("z") + P("y") + P("l") + P("`") + P("s") + P("m") + P("q") + P("n") + P("r") + P("f") + P("b") + P("p") + P("t") + P("k"),
  _2_cons = P("^s") + P("sh") + P("th") + P("ts") + P("ch") + P(".s") + P(".t") + P("ss") + P("rr") + P("qq") + P("ff") + P("``") + P("nn") + P("mm") + P("ll") + P("yy") + P("zz") + P("ww") + P("hh") + P("dd") + P("gg") + P("kh"),
  _3_cons = P("sh^") + P("^sh"),
  _4_cons = P("chch") + P("khkh") + P(".t.t") + P(".s.s") + P("shsh") + P("thth") + P("tsts"),
  _5_cons = P("shsh^") + P("^shsh"),

  _final_class = (P("tsts") + P("ts") + P("nn") + P("mm") + P("kh") + P("p") + P("f") + P("n") + P("m") + P("k")),
  final_consonants = V("_final_class") * #(-1 + 1 - (V("non_final_consonants") + V("waw_vowels") + ((V("niqqud_vowels") + V("schwa"))*(V("non_final_consonants") + V("aleph"))))),

  non_final_consonants = V("_5_cons") + V("_4_cons") + V("_3_cons") + V("_2_cons") + V("_1_cons"),

  -- SYMBOLS

  symbols = P("-") + P("[") + P("]")
}))

local makor_table = {}
makor_table["final_consonant"] = {
  ["kh"] = "FINAL KAF",
  ["k"] = "FINAL KAF WITH DAGESH",
  ["m"] = "FINAL MEM",
  ["mm"] = "FINAL MEM WITH DAGESH",
  ["n"] = "FINAL NUN",
  ["nn"] = "FINAL NUN WITH DAGESH",
  ["f"] = "FINAL PE",
  ["p"] = "FINAL PE WITH DAGESH",
  ["ts"] = "FINAL TSADI",
  ["tsts"] = "FINAL TSADI WITH DAGESH"
}
makor_table["consonant"] = { 
  ["v"] = "BET", 
  ["b"] = "BET WITH DAGESH",
  ["vv"] = "BET WITH DAGESH",
  ["g"] = "GIMEL",
  ["gg"] = "GIMEL WITH DAGESH",
  ["d"] = "DALET",
  ["dd"] = "DALET WITH DAGESH",
  ["h"] = "HE",
  ["hh"] = "HE WITH DAGESH",
  ["w"] = "VAV",
  ["ww"] = "VAV WITH DAGESH",
  ["z"] = "ZAYIN",
  ["zz"] = "ZAYIN WITH DAGESH",
  ["ch"] = "HET",
  ["chch"] = "HET WITH DAGESH",
  [".t"] = "TET",
  [".t.t"] = "TET WITH DAGESH",
  ["y"] = "YOD",
  ["yy"] = "YOD WITH DAGESH",
  ["kh"] = "KAF",
  ["khkh"] = "KAF WITH DAGESH",
  ["k"] = "KAF WITH DAGESH",
  ["l"] = "LAMED",
  ["ll"] = "LAMED WITH DAGESH",
  ["m"] = "MEM",
  ["mm"] = "MEM WITH DAGESH",
  ["n"] = "NUN",
  ["nn"] = "NUN WITH DAGESH",
  [".s"] = "SAMEKH",
  [".s.s"] = "SAMEKH WITH DAGESH",
  ["`"] = "AYIN",
  ["``"] = "AYIN WITH DAGESH",
  ["f"] = "PE",
  ["p"] = "PE WITH DAGESH",
  ["ff"] = "PE WITH DAGESH",
  ["ts"] = "TSADI",
  ["tsts"] = "TSADI WITH DAGESH",
  ["q"] = "QOF",
  ["qq"] = "QOF WITH DAGESH",
  ["r"] = "RESH", 
  ["rr"] = "RESH WITH DAGESH",
  ["sh"] = "SHIN",
  ["shsh"] =  "SHIN WITH DAGESH",
  ["sh^"] = "SHIN WITH SHIN DOT",
  ["shsh^"] = "SHIN WITH DAGESH AND SHIN DOT",
  ["^s"] = "SHIN WITH SIN DOT",
  ["^sh"] = "SHIN WITH SIN DOT",
  ["^shsh"] = "SHIN WITH DAGESH AND SIN DOT",
  ["s"] = "TAV",
  ["ss"] = "TAV WITH DAGESH",
  ["th"] = "TAV",
  ["thth"] = "TAV WITH DAGESH",
  ["t"] = "TAV WITH DAGESH",
}
makor_table["vowel"] = {
  ["a"] = "PATAH",
  ["e"] = "SEGOL",
  ["ae"] = "TSERE",
  ["ei"] = "TSERE",
  ["'"] = "SHEVA",
  [":"] = "SHEVA",
  ["i"] = "HIRIQ",
  ["u"] = "QUBUTS",
  ["o"] = "HOLAM",
  ["au"] = "QAMATS",
  ["+"] = "QAMATS",
  ["oo"] = "VAV WITH DAGESH",
  ["w*"] = "VAV WITH DAGESH",
  ["O"] = "VAV WITH HOLAM",
  [":au"] = "HATAF QAMATS",
  [":+"] = "HATAF QAMATS",
  [":a"] = "HATAF PATAH",
  [":e"] = "HATAF SEGOL",
  ["|"] = "METEG",
  ["\""] = "TSERE"
}
makor_table["aleph"] = {
  ["'"] = "ALEF",
}
makor_table["symbol"] = {
  ["-"] = "MAQAF",
  ["["] = "[",
  ["]"] = "]"
}

function ktav_makor.get_internal(str)
  -- Converts the makor input into ktav internal
  -- representation. Unknown inputs are simply
  -- passed through, while known inputs are 
  -- converted into context-independent symbols:
  --   l:kh -> [LAMED, SHEVA, FINAL KAF]

  in_scheme = makor_table

  matches = grammar:match(str)
  output = {}

  for i=1, #matches, 2 do
    key = matches[i]
    value = matches[i+1]
    if key == "unknown" then
      table.insert(output, value)
    else
      ktav_rep = in_scheme[key][value]
      -- output_rep = out_scheme[ktav_rep]
      table.insert(output, ktav_rep)
    end
  end

  return output
end