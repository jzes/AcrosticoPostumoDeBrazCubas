$nome = Read-Host("Nome")
$textoBase = Get-Content braz.txt
$palavrasBase = @()
foreach($linha in $textoBase){
    foreach($palavra in $linha.Split(" ")){
        Write-Progress -Activity "Carregando Braz"  -Status "Loading:" -PercentComplete ($textoBase.IndexOf($linha)/$textoBase.Count*100);
        $palavrasBase += $palavra
    }
}

foreach($letra in $nome.ToCharArray()){
    $maximum = $palavrasBase.count/2
    $randomNumber = Get-Random -Maximum $maximum
    $randomBase = $palavrasBase[$randomNumber..$palavrasBase.count]
    
    foreach($palavra in $randomBase){
        if($palavra.length -lt 5){
            continue
        }
        
        if($palavra.Substring(0,1) -eq $letra){
            echo "$letra - $palavra"
            break
        }
    }
}