# XQueries for basic CTS functionality

## Create a CTS inventory XML database for CroALa

* [ctsinventory-create](ctsinventory-create.xq)

## Return a list of textgroups (authors / corpora)

Each entry shows a CITE URN for the textgroup object (for example, `urn:cts:croala:adam`) and a link to a list of works connected with the textgroup (sample reference to a page with a list of works: `http://croala.ffzg.unizg.hr/hccroala/opera/urn:cts:croala:adam`). Entries are returned as a `tbody` top element with `tr/td` structure. The XQuery will be converted to a function in the `hccroala.xqm` module and its result will be included into a RESTXQ page template.

* [ctsinventory-list-authors](ctsinventory-list-authors.xq)

## Return a list of works

In a similar way, present a list of works as a table with a row for each work, its CITE URN (for example, `urn:cts:croala:adam.radauanus-traditio`), and a link to its edition in CroALa (`http://croala.ffzg.unizg.hr/hccroala/editio/urn:cts:croala:adam.radauanus-traditio.croala-op`).

* [ctsinventory-list-works](ctsinventory-list-works.xq)

# Return a list of passages in an edition

## Create a citation XML DB

* [ctscitation-create](ctscitation-create.xq)

## Create a text XML DB

* [ctstxt-create](ctstxt-create.xq) - create by pulling TEI XML files locally
* [ctstxt-create-github](ctstxt-create-github.xq) - create by pulling TEI XML files from the Github repository

## Return a list of editions with citations

Each edition links to the file (in the third DB; open its node).

Each edition links to the list of passages in it.

* [ctscitation-list-editions](ctscitation-list-editions.xq)

## From a CITE URN go to the text

Display just the TEI `text` element, without the TEI header.

* [ctsciteurn-getfile](ctsciteurn-getfile.xq)

## For an edition, return a list of available passages

Link to nodes in the text DB.


