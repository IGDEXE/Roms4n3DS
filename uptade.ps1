param (
    $pastaROMs,
    $pasta3ds,
    $tipoROM = "nds", # Deixei como default o tipo do DS
    $dias = 1 # Como default deixei 1 dia
)

# Faz a configuracao do tempo em dias
$janelaTempo = (Get-Date).AddDays(-$dias)

# Lista todos os arquivos da pasta e filtra as roms
$listaJogos = Get-ChildItem "$pastaROMs" -Recurse -Include "*.$tipoROM" | Where-Object {$_.LastWriteTime -lt $janelaTempo}

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