$navContentOtherPages = @"
  <nav>
    <a class="nav-logo" href="index.html">Prasad<span class="dot">.</span></a>
    <ul class="nav-links">
      <li><a href="index.html#home">Home</a></li>
      <li><a href="index.html#work">Work</a></li>
      <li><a href="index.html#training">Training</a></li>
      <li><a href="phishing-simulations.html">Phishing Simulations</a></li>
      <li><a href="blog.html">Blog</a></li>
      <li><a href="index.html#about">About</a></li>
      <li><a class="nav-contact" href="index.html#contact">Contact</a></li>
    </ul>
  </nav>
"@

$files = Get-ChildItem -Path '.' -Filter '*.html'
foreach ($f in $files) {
    if ($f.Name -match "^(game|Newgame_CS|spygame|Weekend Clean Desk Dilemma)\.html$") {
        continue # Ignore games themselves
    }
    if ($f.Name -eq "index.html") { continue }
    
    $content = Get-Content $f.FullName -Raw
    if ($content -match '(?s)<nav>.*?</nav>') {
        $content = $content -replace '(?s)<nav>.*?</nav>', $navContentOtherPages
        Set-Content -Path $f.FullName -Value $content -NoNewline
        Write-Host "Updated nav in $($f.Name)"
    }
}
