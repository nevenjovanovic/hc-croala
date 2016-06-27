(: from a cite urn, return file :)
(: mockup address :)
let $citeurnhttp := "http://croala.ffzg.unizg.hr/hccroala/editio/urn:cts:croala:andreis-f.lectori-phil.croala-op"
let $citeurn := substring-after($citeurnhttp, "/editio/") || ":"
let $docname := data(collection("hccroalacit")//*:online[@urn=$citeurn]/@docname)
return db:open("hccroalatxt", $docname)//*:text