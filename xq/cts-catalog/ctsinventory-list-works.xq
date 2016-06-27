(: list works in the CroALa CTS inventory :)
(: include links to editions :)
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
for $work in collection("hccroalainv")//*:textgroup/*:work
let $ctsurn := local:removecolon($work/@urn)
let $editionurn := local:removecolon($work/*:edition/@urn)
let $link := $base || "/" || $ctsurn
let $editionbase := "http://croala.ffzg.unizg.hr/hccroala/editio/"
let $editionlink := $editionbase || $editionurn
return element tr {
  element td { $work/*:title },
  element td { local:links0($link, $ctsurn)  },
  element td { local:links0($editionlink, "Editio in CroALa")}
}
}

return element table {
  element tr { "Operum numerus: " || local:rowcount($tbody) || "." },
  $tbody
}