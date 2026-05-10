$files = Get-ChildItem -Path '.' -Filter '*.html'

$seoTags = @"
  <!-- SEO & AI Meta Tags -->
  <meta name="author" content="Prasad Sawant" />
  <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1" />
  <meta property="og:title" content="Prasad Sawant | Cybersecurity Awareness Specialist" />
  <meta property="og:description" content="Building security cultures through immersive learning, phishing simulations, and human-risk programs. Over 25,000 professionals trained." />
  <meta property="og:type" content="website" />
  <meta property="og:image" content="heroimagetedx1.jpg" />
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="Prasad Sawant | Cybersecurity" />
  <meta name="twitter:description" content="Cybersecurity awareness specialist designing immersive learning and phishing simulations." />
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Person",
    "name": "Prasad Sawant",
    "jobTitle": "Cybersecurity Awareness Specialist",
    "description": "Building security cultures through immersive learning, phishing simulations, and human-risk programs.",
    "knowsAbout": ["Cybersecurity Awareness", "Phishing Simulations", "Instructional Design", "Gamification", "Human Risk Management"],
    "sameAs": [
      "https://www.linkedin.com/in/prasaddsawant/"
    ]
  }
  </script>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Avoid adding if already there
    if ($content -notmatch 'application/ld\+json') {
        # Replace </head> with the new tags
        $content = $content -replace '</head>', $seoTags
        Set-Content -Path $f.FullName -Value $content -NoNewline
        Write-Host "Added SEO tags to $($f.Name)"
    } else {
        Write-Host "SEO tags already present in $($f.Name)"
    }
}
