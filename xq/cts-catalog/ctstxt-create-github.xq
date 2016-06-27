(: create a db from the CroALa CTS text files :)
(: use citation db for file names :)
(: pull files from the Github repo :)
let $filelist := for $f in collection("hccroalacit")//*:online/@docname
return data($f)
let $urllist := (
for $file in $filelist
let $url := "https://github.com/nevenjovanovic/hc-croala/raw/master/txts/" || $file
return $url )
return db:create("hccroalatxt", $urllist , (), map { 'ftindex': true(), 'intparse': true() })