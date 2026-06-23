#!/bin/bash
# Node-RED AutoScan — Automated Nmap + Email Alert
# Author: Mohamed Adoungouss Ibrahim (@ibramoha2)

TARGET="${1:-192.168.1.0/24}"
OUTPUT_DIR="./scan_results"
DATE=$(date +%Y%m%d_%H%M%S)
OUTFILE="$OUTPUT_DIR/scan_$DATE.txt"
EMAIL_TO="${EMAIL_TO:-admin@example.com}"

mkdir -p "$OUTPUT_DIR"

echo "[*] AutoScan démarré — $(date)"
echo "[*] Cible : $TARGET"

nmap -sV -sC -T4 --open "$TARGET" -oN "$OUTFILE" 2>/dev/null
echo "[+] Résultats sauvegardés : $OUTFILE"

# Compter les hosts up
HOSTS=$(grep -c "Nmap scan report" "$OUTFILE" 2>/dev/null || echo 0)
OPEN_PORTS=$(grep -c "open" "$OUTFILE" 2>/dev/null || echo 0)
echo "[*] Hosts détectés : $HOSTS | Ports ouverts : $OPEN_PORTS"

# Alerte email via msmtp si disponible
if command -v msmtp &>/dev/null && [ -n "$EMAIL_TO" ]; then
    {
        echo "To: $EMAIL_TO"
        echo "Subject: [AutoScan] Rapport $DATE — $HOSTS hosts, $OPEN_PORTS ports ouverts"
        echo ""
        echo "Rapport AutoScan du $(date)"
        echo "Cible : $TARGET"
        echo "Hosts up : $HOSTS"
        echo "Ports ouverts : $OPEN_PORTS"
        echo ""
        cat "$OUTFILE"
    } | msmtp "$EMAIL_TO"
    echo "[+] Rapport email envoyé à $EMAIL_TO"
fi
