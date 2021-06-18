ktav_full_hebrew = {}

local hebrew_transcription = {

  -- CONSONANTS 

  ["ALEF"] = "א",
  ["BET"] = "ב",
  ["BET WITH DAGESH"] = "בּ",
  ["GIMEL"] = "ג",
  ["GIMEL WITH DAGESH"] = "גּ",
  ["DALET"] = "ד",
  ["DALET WITH DAGESH"] = "דּ",
  ["HE"] = "ה",
  ["HE WITH DAGESH"] = "הּ",
  ["VAV"] = "ו",
  ["VAV WITH DAGESH"] = "וּ",
  ["ZAYIN"] = "ז",
  ["ZAYIN WITH DAGESH"] = "זּ",
  ["HET"] = "ח",
  ["HET WITH DAGESH"] = "חּ",
  ["TET"] = "ט",
  ["TET WITH DAGESH"] = "טּ",
  ["YOD"] = "י",
  ["YOD WITH DAGESH"] = "יּ",
  ["KAF"] = "כ",
  ["FINAL KAF"] = "ך",
  ["KAF WITH DAGESH"] = "כּ",
  ["FINAL KAF WITH DAGESH"] = "ךּ",
  ["LAMED"] = "ל",
  ["LAMED WITH DAGESH"] = "לּ",
  ["MEM"] = "מ",
  ["FINAL MEM"] = "ם",
  ["MEM WITH DAGESH"] = "מּ",
  ["FINAL MEM WITH DAGESH"] = "םּ",
  ["NUN"] = "נ",
  ["FINAL NUN"] = "ן",
  ["NUN WITH DAGESH"] = "נּ",
  ["FINAL NUN WITH DAGESH"] = "ןּ",
  ["SAMEKH"] = "ס",
  ["SAMEKH WITH DAGESH"] = "סּ",
  ["AYIN"] = "ע",
  ["AYIN WITH DAGESH"] = "עּ",
  ["PE"] = "פ",
  ["FINAL PE"] = "ף",
  ["PE WITH DAGESH"] = "פּ",
  ["FINAL PE WITH DAGESH"] = "ףּ",
  ["TSADI"] = "צ",
  ["FINAL TSADI"] = "ץ",
  ["TSADI WITH DAGESH"] = "צּ",
  ["FINAL TSADI WITH DAGESH"] = "ץּ",
  ["QOF"] = "ק",
  ["QOF WITH DAGESH"] = "קּ",
  ["RESH"] = "ר",
  ["RESH WITH DAGESH"] = "רּ",
  ["SHIN"] = "ש",
  ["SHIN WITH SHIN DOT"] = "שׁ",
  ["SHIN WITH SIN DOT"] = "שׂ",
  ["SHIN WITH DAGESH AND SHIN DOT"] = "שּׁ",
  ["SHIN WITH DAGESH AND SIN DOT"] = "שּׂ",
  ["TAV"] = "ת",
  ["TAV WITH DAGESH"] = "תּ",

  -- VOWELS

  ["PATAH"] = "ַ",
  ["SEGOL"] = "ֶ",
  ["TSERE"] = "ֵ",
  ["SHEVA"] = "ְ",
  ["HIRIQ"] = "ִ",
  ["QUBUTS"] = "ֻ",
  ["HOLAM"] = "ֹ",
  ["QAMATS"] = "ָ",
  ["VAV WITH HOLAM"] = "וֹ",
  ["HATAF QAMATS"] = "ֳ",
  ["HATAF SEGOL"] = "ֱ",
  ["HATAF PATAH"] = "ֲ",
  ["METEG"] = "ֽ",

  -- SYMBOLS

  ["MAQAF"] = "־",
  ["["] = "]",
  ["]"] = "["
}

function ktav_full_hebrew.transcribe(internal_rep)
  transcription = {}
  for i=1, #internal_rep do
    heb_char = hebrew_transcription[internal_rep[i]]
    table.insert(transcription, heb_char)
  end
  return transcription
end
