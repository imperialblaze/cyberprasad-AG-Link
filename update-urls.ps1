$content = Get-Content blog.html -Raw
$i = 1
$newContent = [regex]::Replace($content, 'href="#"', { param($m) "href=`"blog-single-$global:i.html`""; $global:i++ })
Set-Content blog.html -Value $newContent -Encoding UTF8
