(: create an index of available passages :)
declare function local:multicit($citebase) {
  let $citeurn := $citebase/@urn
let $docname := "hccroalatxt/" || data($citebase/@docname)
for $citations in $citebase/*:citationMapping/*:citation
let $label := data($citations/@label)
let $xpath := substring-after(substring-before(data($citations/@scope),'['),'/') || '/position()'
let $xquery := "declare namespace tei='http://www.tei-c.org/ns/1.0'; collection('" || $docname || "')//" || $xpath
return element tr {
  $citeurn ,
  element td { $docname },
  element td { $label } ,
  element td { $xpath },
  for $i in xquery:eval($xquery) return 
   element td { data($citeurn) || $label || $i }
}
};
declare function local:singlecit($citebase) {
   let $citeurn := $citebase/@urn
let $docname := "hccroalatxt/" || data($citebase/@docname)
for $citations in $citebase/*:citationMapping/*:citation
let $label := data($citations/@label)
let $xpath := substring-after(substring-before(data($citations/@scope),'['),'/') || '/position()'
let $xquery := "declare namespace tei='http://www.tei-c.org/ns/1.0'; collection('" || $docname || "')//" || $xpath
return element tr {
  $citeurn ,
  element td { $docname },
  element td { $label } ,
  element td { $xpath },
  element td { data($citeurn) || $label }
}
};
let $indexbody := element tbody {
for $citebase in collection("hccroalacit")//*:online
return switch($citebase)
case $citebase[*:citationMapping[not(*:citation/position()=2)]] return local:singlecit($citebase)
default return local:multicit($citebase)
}
return $indexbody