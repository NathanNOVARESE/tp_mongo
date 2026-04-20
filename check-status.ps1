$CONTAINER="mon-blog-mongo"

Write-Host "--- VÉRIFICATION SÉCURITÉ ---" -ForegroundColor Cyan
$user = docker exec $CONTAINER whoami
Write-Host "Utilisateur interne : $user"

if ($user -eq "root") {
    Write-Host "ÉCHEC: Root détecté !" -ForegroundColor Red
    exit
}

Write-Host "`n--- VÉRIFICATION DONNÉES ---" -ForegroundColor Cyan
$count = docker exec $CONTAINER mongosh -u admin -p admin --quiet --eval "db.getSiblingDB('blog_db').posts.countDocuments()"

if ([int]$count -ge 5) {
    Write-Host "SUCCÈS: $count articles trouvés dans blog_db." -ForegroundColor Green
} else {
    Write-Host "ERREUR: Données introuvables ou accès refusé." -ForegroundColor Red
}