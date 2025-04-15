$relatorio = "$PSScriptRoot\relatorio_rede.txt"
$pdf = "$PSScriptRoot\relatorio_rede.pdf"

if (-not (Test-Path $relatorio)) {
    Write-Host "❌ Arquivo de relatório não encontrado!"
    exit
}

$word = New-Object -ComObject Word.Application
$doc = $word.Documents.Open($relatorio)
$doc.SaveAs([ref] $pdf, [ref] 17)  # 17 = wdFormatPDF
$doc.Close()
$word.Quit()

Write-Host "✅ PDF gerado com sucesso: $pdf"
