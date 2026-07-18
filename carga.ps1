# Script de prueba de carga para generar latencia
$url = "http://localhost:4566/inventory-product-assets/carga-prueba.txt"

Write-Host "Iniciando prueba de carga..."
for ($i=1; $i -le 20; $i++) {
    $start = Get-Date
    # Usamos curl.exe para asegurar que la petición pase por el motor de red
    curl.exe -X PUT --upload-file "prueba.txt" $url -s -o /dev/null
    $end = Get-Date
    $elapsed = ($end - $start).TotalMilliseconds
    Write-Host "Petición $i: ${elapsed}ms"
}
Write-Host "Prueba finalizada."