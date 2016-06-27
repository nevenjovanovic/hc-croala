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
for $textgroup in collection("hccroalainv")//*:textgroup
let $ctsurn := local:removecolon($textgroup/@urn)
let $link := $base || "/" || $ctsurn
let $operabase := "http://croala.ffzg.unizg.hr/hccroala/opera/"
let $operalink := $operabase || $ctsurn
return element tr {
  element td { $textgroup/*:groupname },
  element td { local:links0($link, $ctsurn)  },
  element td { local:links0($operalink, "Opera")}
}
}
return element table {
  element tr {
    "Corporum numerus: " || local:rowcount($tbody) || "."
  },
  $tbody
}