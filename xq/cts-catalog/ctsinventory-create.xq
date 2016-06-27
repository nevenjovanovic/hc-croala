(: create a db from the CroALa CTS inventory :)
(: pull files directly from Github repository :)

let $body := (
"https://github.com/nevenjovanovic/hc-croala/raw/master/cts-inv-1/hccroala-inventory.xml"
)

return db:create("hccroalainv", $body , (), map { 'ftindex': true(), 'chop':true(), 'intparse': true(), 'stripns': true() })