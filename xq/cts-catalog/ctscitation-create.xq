(: create a db from the CroALa CTS citation file :)
(: pull files directly from Github repository :)

let $body := (
"https://github.com/nevenjovanovic/hc-croala/raw/master/cts-inv-1/hccroala-citation.xml"
)

return db:create("hccroalacit", $body , (), map { 'ftindex': true(), 'chop':true(), 'intparse': true(), 'stripns': true() })