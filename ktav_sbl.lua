ktav_sbl = {}

local sbl_transcription = {

  -- CONSONANTS 

  ["ALEF"] = "ʾ",
  ["BET"] = "b",
  ["BET WITH DAGESH"] = "bb",
  ["GIMEL"] = "g",
  ["GIMEL WITH DAGESH"] = "gg",
  ["DALET"] = "d",
  ["DALET WITH DAGESH"] = "dd",
  ["HE"] = "h",
  ["HE WITH DAGESH"] = "hh",
  ["VAV"] = "w",
  ["VAV WITH DAGESH"] = "ww",
  ["ZAYIN"] = "z",
  ["ZAYIN WITH DAGESH"] = "zz",
  ["HET"] = "ḥ",
  ["HET WITH DAGESH"] = "ḥḥ",
  ["TET"] = "ṭ",
  ["TET WITH DAGESH"] = "ṭ",
  ["YOD"] = "y",
  ["YOD WITH DAGESH"] = "yy",
  ["KAF"] = "k",
  ["FINAL KAF"] = "k",
  ["KAF WITH DAGESH"] = "kk",
  ["FINAL KAF WITH DAGESH"] = "kk",
  ["LAMED"] = "l",
  ["LAMED WITH DAGESH"] = "ll",
  ["MEM"] = "m",
  ["FINAL MEM"] = "m",
  ["MEM WITH DAGESH"] = "mm",
  ["FINAL MEM WITH DAGESH"] = "mm",
  ["NUN"] = "n",
  ["FINAL NUN"] = "n",
  ["NUN WITH DAGESH"] = "nn",
  ["FINAL NUN WITH DAGESH"] = "nn",
  ["SAMEKH"] = "s",
  ["SAMEKH WITH DAGESH"] = "ss",
  ["AYIN"] = "ʿ",
  ["AYIN WITH DAGESH"] = "ʿʿ",
  ["PE"] = "p",
  ["FINAL PE"] = "p",
  ["PE WITH DAGESH"] = "pp",
  ["FINAL PE WITH DAGESH"] = "pp",
  ["TSADI"] = "ṣ",
  ["FINAL TSADI"] = "ṣ",
  ["TSADI WITH DAGESH"] = "ṣṣ",
  ["FINAL TSADI WITH DAGESH"] = "ṣṣ",
  ["QOF"] = "q",
  ["QOF WITH DAGESH"] = "q",
  ["RESH"] = "r",
  ["RESH WITH DAGESH"] = "rr",
  ["SHIN"] = "š",
  ["SHIN WITH SHIN DOT"] = "š",
  ["SHIN WITH SIN DOT"] = "ś",
  ["SHIN WITH DAGESH AND SHIN DOT"] = "šš",
  ["SHIN WITH DAGESH AND SIN DOT"] = "śś",
  ["TAV"] = "t",
  ["TAV WITH DAGESH"] = "tt",

  -- VOWELS

  ["PATAH"] = "a",
  ["SEGOL"] = "e",
  ["TSERE"] = "ē",
  ["SHEVA"] = "ĕ",
  ["HIRIQ"] = "i",
  ["QUBUTS"] = "u",
  ["HOLAM"] = "ō",
  ["QAMATS"] = "ā",
  ["VAV WITH HOLAM"] = "ô",
  ["HATAF QAMATS"] = "ŏ",
  ["HATAF SEGOL"] = "ĕ",
  ["HATAF PATAH"] = "ă",
  ["METEG"] = "̣",

  -- SYMBOLS

  ["MAQAF"] = "-",
  ["["] = "[",
  ["]"] = "]"
}

function ktav_sbl.transcribe(internal_rep)
  transcription = {}
  for i=1, #internal_rep do
    heb_char = sbl_transcription[internal_rep[i]]
    table.insert(transcription, heb_char)
  end
  return transcription
end
