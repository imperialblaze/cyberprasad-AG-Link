$files = Get-ChildItem -Path "c:\Users\Prasad\Downloads\prasad-sawant-portfolio\*.html"

foreach ($f in $files) {
    if (Test-Path $f.FullName) {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        $original = $content
        
        $content = $content.Replace("Â©", "&copy;")
        $content = $content.Replace("Ã‚Â·", "&middot;")
        $content = $content.Replace("Ã¢â‚¬â€", "&mdash;")
        $content = $content.Replace("Â·", "&middot;")
        $content = $content.Replace("â€”", "&mdash;")
        $content = $content.Replace("Ã¢â‚¬â€œ", "&ndash;")
        
        # Regex to safely replace specific mangled segments with exact matches if present
        $content = $content -replace 'A,Ac', '&copy;'
        $content = $content -replace 'A,A', '&middot;'
        $content = $content -replace 'A,\?\?', '&mdash;'
        $content = $content -replace '\?"', '&mdash;'
        $content = $content -replace 'Ã¢â‚¬â€œ', '&ndash;'
        $content = $content -replace 'Ac\b', '&copy;'
        $content = $content -replace '&nbsp;A&nbsp;', '&nbsp;&middot;&nbsp;'
        
        # specific manual fix for blog-single-1 title
        $content = $content.Replace("Failing” And What", "Failing &mdash; And What")
        $content = $content.Replace("Instead” Prasad", "Instead &mdash; Prasad")

        if ($content -cne $original) {
            Set-Content -Path $f.FullName -Value $content -Encoding UTF8
            Write-Host "Fixed encoding artifacts in $($f.Name)"
        }
    }
}

$gen = "c:\Users\Prasad\Downloads\prasad-sawant-portfolio\generate.ps1"
if (Test-Path $gen) {
    $content = Get-Content $gen -Raw -Encoding UTF8
    $original = $content
    $content = $content.Replace("Â©", "&copy;")
    $content = $content.Replace("Ã‚Â·", "&middot;")
    $content = $content.Replace("Ã¢â‚¬â€", "&mdash;")
    $content = $content.Replace("Â·", "&middot;")
    $content = $content.Replace("â€”", "&mdash;")
    $content = $content.Replace("©", "&copy;")
    $content = $content.Replace("·", "&middot;")
    $content = $content.Replace("—", "&mdash;")
    if ($content -cne $original) {
        Set-Content -Path $gen -Value $content -Encoding UTF8
        Write-Host "Fixed encoding artifacts in generate.ps1"
    }
}
