[System.Collections.Generic.List[PSObject]] $page = @()
$j = 0
$blank52 = "<td height=""52""> </td>`n" * 9
$blank20 = "<td height=""20""><br></td>`n" * 9
while($j -lt 5){
    [System.Collections.Generic.List[PSObject]] $rowA = @()
    [System.Collections.Generic.List[PSObject]] $rowB = @()
    $i=0
    while($i -lt 5){
        $a = Get-Random -Minimum 1 -Maximum 10
        $b = Get-Random -Minimum 0 -Maximum (9-$a+1)

        $c = Get-Random -Minimum 1 -Maximum 10
        $d = Get-Random -Minimum 0 -Maximum (9-$c+1)

        if(($b + $d) -gt 0){
            if($b -eq 0){$b=' '}
            $rowA.Add("<td class=""xl66"" height=""52"" width=""115"">$a$c</td>`n")
            $rowB.Add("<td class=""xl65"" height=""52"" width=""115"">+ $b$d</td>`n")
            $i++
        }
    }

    $tableRows = New-Object System.Text.StringBuilder
    $tableRows.Append('<tr height="52">') | Out-Null
    $tableRows.Append($rowA -join('<td class="xl66" width="15"><br>')) | Out-Null
    $tableRows.Append('</tr><tr height="52">') | Out-Null
    $tableRows.Append($rowB -join('<td class="xl66" width="15"><br>')) | Out-Null
    $tableRows.Append("</tr><tr height=""52"">$blank52</tr>") | Out-Null
    $page.Add($tableRows.ToString())
    $j++
}


$bodyTop = @'
<html><head><title>math</title><style>.xl65{mso-style-parent:style0;font-size:36.0pt;mso-number-format:"\@";
text-align:right;border-top:none;border-right:none;border-bottom:1.5pt solid windowtext;border-left:none;}
.xl66{mso-style-parent:style0;font-size:36.0pt;mso-number-format:"\@";text-align:right;}</style></head><body>
<table style="text-align: left; width: 635px; height: 60px;" border="0" cellpadding="0" cellspacing="0"><tbody>
'@

$bodyBotton = @'
</tbody></table><br><br></body></html>
'@

$bodyTop + $page -join("<tr height=""20"">$blank20</tr>") + $bodyBotton | out-file '.\math.html'
