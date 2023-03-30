param (
    $pastaDownload,
    $pastaROMs
)

# Recebe a lista de ZIPs
$listaJogos = Get-ChildItem "$pastaDownload" -Recurse -Include "*.zip"

# Extrai para a pasta onde eu salvo as ROMs
Write-Host "Copiando os jogos"
Write-Host "De: $pastaDownload"
Write-Host "Para: $pastaROMs"
Write-Host "Esse processo pode demorar"
foreach ($jogo in $listaJogos) {
    $nomeJogo = $jogo.BaseName
    $caminhoJogo = $jogo.FullName
    Write-Host "Copiando: $nomeJogo"
    Expand-Archive -LiteralPath "$caminhoJogo" -DestinationPath "$pastaROMs/$nomeJogo" -Force
}
Write-Host "Processo concluido"
