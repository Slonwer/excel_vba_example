# info-ip.ps1 (versão final e funcional)
$relatorio = "$PSScriptRoot\relatorio_rede.txt"
$data = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$hostname = hostname
$ipconfig = ipconfig

# Extração com expressões robustas
$ipLocal = ($ipconfig | Where-Object { $_ -match "IPv4" }) -replace '.*?:\s*', ''
$subnetMask = ($ipconfig | Where-Object { $_ -match "Máscara|Mask" }) -replace '.*?:\s*', ''
$gateway = ($ipconfig | Where-Object { $_ -match "Gateway" -and $_ -match "\d" }) -replace '.*?:\s*', ''

# Tenta obter o IP público (se estiver online)
try {
    $publicIp = Invoke-RestMethod -Uri "https://api.ipify.org"
} catch {
    $publicIp = "Sem conexão"
}

@"
===============================
     RELATÓRIO DE REDE
===============================

📅 Data e Hora: $data

🖥️ Hostname: $hostname
🌐 IP Local: $ipLocal
🛡️ Máscara: $subnetMask
🚪 Gateway: $gateway
🌍 IP Público: $publicIp

===============================
"@ | Out-File $relatorio -Encoding UTF8

Write-Host "`n✅ Relatório gerado com sucesso: $relatorio"
