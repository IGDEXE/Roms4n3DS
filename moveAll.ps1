param (
    $pastaROMs,
    $pasta3ds,
    $tipoROM = "nds" # Deixei como default o tipo do DS
)

# Lista todos os arquivos da pasta e filtra as roms
$listaJogos = Get-ChildItem "$pastaROMs" -Recurse -Include "*.$tipoROM"

# Faz a copia
Write-Host "Copiando os jogos"
Write-Host "De: $pastaROMs"
Write-Host "Para: $pasta3ds"
Write-Host "Esse processo pode demorar"
foreach ($jogo in $listaJogos) {
    $nomeJogo = $jogo.BaseName
    $caminhoJogo = $jogo.FullName
    Write-Host "Copiando: $nomeJogo"
    Copy-Item "$caminhoJogo" -Destination "$pasta3ds" -Force
}
Write-Host "Processo concluido"