$files = Get-ChildItem -Path '.' -Filter '*.html'
foreach ($f in $files) {
    if ($f.Name -eq "index.html" -or $f.Name -eq "phishing-simulations.html") { continue }
    $content = Get-Content $f.FullName -Raw
    if ($content -notmatch 'phishing-simulations\.html') {
        $content = $content -replace '(<li><a href="(?:index\.html)?#training">Training</a></li>)', "`$1`r`n      <li><a href=`"phishing-simulations.html`">Phishing Simulations</a></li>"
        Set-Content -Path $f.FullName -Value $content -NoNewline
    }
}
