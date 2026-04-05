$content = Get-Content 'blog.html' -Raw

# 1. Strip the global overrides
$content = $content -replace '(?s)/\* Dark theme for blog \*/.*?body::after \{ display: none; \}', ''
$content = $content -replace '(?s)/\* Override shared nav for dark bg \*/.*?color: white !important; \}', ''
$content = $content -replace '(?s)/\* ─── FOOTER override for dark ─── \*/.*?footer \{ background: #060809; \}', ''

# 2. Convert specific colors in the style block
# Extract style block
if ($content -match '(?s)(<style>)(.*?)(</style>)') {
   $style = $matches[2]
   
   $style = $style -replace 'color: var\(--paper\)', 'color: var(--ink)'
   $style = $style -replace 'rgba\(244,240,232,0.45\)', 'var(--muted)'
   $style = $style -replace 'rgba\(244,240,232,0.35\)', 'var(--muted)'
   $style = $style -replace 'rgba\(244,240,232,0.3\)', 'var(--muted)'
   $style = $style -replace 'rgba\(244,240,232,0.25\)', 'var(--muted)'
   $style = $style -replace 'rgba\(244,240,232,0.2\)', 'var(--muted)'
   $style = $style -replace 'rgba\(244,240,232,0.15\)', 'var(--border-strong)'
   $style = $style -replace 'rgba\(244,240,232,0.1\)', 'var(--border-med)'
   $style = $style -replace 'rgba\(244,240,232,0.08\)', 'var(--border)'
   $style = $style -replace 'rgba\(244,240,232,0.07\)', 'var(--border)'
   $style = $style -replace 'rgba\(244,240,232,0.06\)', 'var(--border)'
   $style = $style -replace 'rgba\(244,240,232,0.05\)', 'var(--warm)'

   $style = $style -replace 'background: var\(--ink\)', 'background: var(--warm)'
   $style = $style -replace 'background: #0f1216', 'background: var(--paper)'

   $style = $style -replace 'rgba\(244,240,232,0.02\)', 'rgba(10,12,15,0.02)'
   
   $style = $style -replace 'linear-gradient\(135deg, #1e2a38 0%, #0f1a24 100%\)', 'linear-gradient(135deg, rgba(10,12,15,0.05) 0%, rgba(10,12,15,0.1) 100%)'
   
   # Write back
   $content = $content.Replace($matches[2], $style)
}

Set-Content 'blog.html' -Value $content -Encoding UTF8
Write-Host "Updated blog.html"
