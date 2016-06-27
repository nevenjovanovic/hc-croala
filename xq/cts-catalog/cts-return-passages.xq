let $a := <tbody>
<tr urn="urn:cts:croala:adam.radauanus-traditio.croala-op:">
    <td>hccroalatxt/adam-radauanus-traditio.xml</td>
    <td>paragraphus</td>
    <td>tei:TEI/tei:text/tei:body/tei:div/tei:p[position()</td>
    <td>1 2</td>
  </tr>
  </tbody>
for $t in $a//tr
let $collection := "declare namespace tei='http://www.tei-c.org/ns/1.0'; collection('" || $t/td[1] || "')//"
let $xpath := $t/td[3]
for $index in tokenize($t/td[last()], ' ')
let $xquery := $collection || $xpath || "=" || $index || ']'
return xquery:eval($xquery)