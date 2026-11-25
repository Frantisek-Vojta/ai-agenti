# Vygeneruje navod.pdf z navod.html pomoci Microsoft Edge (headless).
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$html = Join-Path $here "navod.html"
$pdf  = Join-Path $here "navod.pdf"
$prof = Join-Path $env:TEMP "edge-pdf-profile"
$uri  = ([System.Uri]$html).AbsoluteUri
Start-Process -FilePath $edge -Wait -WindowStyle Hidden -ArgumentList @(
  "--headless=new", "--disable-gpu", "--no-first-run",
  "--user-data-dir=`"$prof`"", "--no-pdf-header-footer",
  "--virtual-time-budget=5000", "--print-to-pdf=`"$pdf`"", $uri)
Write-Host "Hotovo: $pdf"
