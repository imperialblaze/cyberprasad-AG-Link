$thumbs = @(
    "thumb_featured.png",     # 1 (Featured equivalent/Phishing)
    "thumb_gamification.png", # 2
    "thumb_design.png",       # 3
    "thumb_culture.png",      # 4
    "thumb_tech.png",         # 5
    "thumb_awareness.png",    # 6
    "thumb_featured.png",     # 7
    "thumb_design.png",       # 8
    "thumb_culture.png",      # 9
    "thumb_gamification.png"  # 10
)

for ($i = 1; $i -le 10; $i++) {
    $file = "c:/Users/Prasad/Downloads/prasad-sawant-portfolio/blog-single-$i.html"
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        $thumbName = $thumbs[$i - 1]
        
        # Replace the background: var(--steel) with url('assets/images/$thumbName') center/cover no-repeat
        $content = $content -replace 'background: var\(--steel\);', "background: url('assets/images/$thumbName') center/cover no-repeat;"
        
        Set-Content -Path $file -Value $content -Encoding UTF8
    }
}
Write-Host "Thumbnails updated in all 10 single files!"
