(: list textgroups in the CroALa CTS inventory :)
(: function for links :)
declare function local:links0($urn, $text) {
  element a { 
attribute href { $urn },
$text }
};
(: count rows in table :)
declare function local:rowcount($table) {
  count($table//*:tr)
};
(: remove trailing colon :)
declare function local:removecolon($colon){
  replace(data($colon),":$","")
};
let $tbody :=
element tbody {
  let $base := data(collection("hccroalainv")//*:ctsnamespace/@ns)
for $textonline in collection("hccroalacit")//*:online
let $ctsurn := local:removecolon($textonline/@urn)
let $link := $base || "/" || $ctsurn
let $sectiobase := "http://croala.ffzg.unizg.hr/hccroala/sectiones/"
let $sectiolink := $sectiobase || $ctsurn
return element tr {
  element td { $ctsurn },
  element td { local:links0($link, "Textus")  },
  element td { local:links0($sectiolink, "Sectiones")}
}
}
return element table {
  element tr {
    "Editionum numerus: " || local:rowcount($tbody) || "."
  },
  $tbody
}