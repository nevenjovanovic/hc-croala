(: from a cite urn, get a list of available passages :)
(: mockup address :)
let $citeurnhttp := "http://croala.ffzg.unizg.hr/hccroala/editio/urn:cts:croala:andreis-f.lectori-phil.croala-op"
let $citeurn := substring-after($citeurnhttp, "/editio/") || ":"
let $citebase := collection("hccroalacit")//*:online[@urn=$citeurn]
let $docname := "hccroalatxt/" || data($citebase/@docname)
for $citations in $citebase/*:citationMapping/*:citation
let $label := data($citations/@label)
let $xpath := substring-after(substring-before(data($citations/@scope),'['),'/') || '/position()'
let $xquery := "declare namespace tei='http://www.tei-c.org/ns/1.0'; collection('" || $docname || "')//" || $xpath
return element tr {
  element td { $label } ,
  element td { xquery:eval($xquery) }
}