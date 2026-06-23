# Node-RED AutoScan

> Automatisation de scans reseau Nmap avec alertes email via Node-RED.

![NodeRED](https://img.shields.io/badge/Node--RED-8F0000?style=flat-square&logo=node-red)
![Nmap](https://img.shields.io/badge/Nmap-0E83CD?style=flat-square)
![Author](https://img.shields.io/badge/Author-ibramoha2-CC0000?style=flat-square)

## Fonctionnalites
- Scan Nmap automatise toutes les X minutes
- Detection de nouveaux hotes sur le reseau
- Alertes email si nouveau port ouvert detecte
- Dashboard Node-RED avec historique
- Export des resultats en JSON/CSV

## Pre-requis
```bash
npm install -g node-red
npm install node-red-contrib-nmap
npm install node-red-node-email
```

## Lancement
```bash
node-red flows/autoscan_flow.json
# Ouvrir http://localhost:1880
```

## Configuration
Editer `config/settings.json` :
```json
{
  "target": "192.168.1.0/24",
  "interval_minutes": 15,
  "email_alert": "your@email.com"
}
```

**Auteur :** [@ibramoha2](https://github.com/ibramoha2) | Niger