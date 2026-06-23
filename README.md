# 🔍 Node-RED AutoScan

> Automated Nmap scanning with email alerts via Node-RED — by [@ibramoha2](https://github.com/ibramoha2)

## 🔧 Fonctionnalités

- ⏰ Scans Nmap automatisés (cron/interval)
- 📧 Alertes email via msmtp
- 📄 Rapports sauvegardés avec horodatage
- 🔗 Flow Node-RED intégrable

## 🚀 Usage rapide

```bash
# Scan manuel
TARGET=192.168.1.0/24 EMAIL_TO=ton@email.com bash autoscan.sh

# Avec Node-RED
# Importer flows.json dans Node-RED UI
```

## 🔧 Prérequis
```bash
sudo apt install nmap msmtp node-red
```

## 👤 Auteur
**Mohamed Adoungouss Ibrahim** | DUT Cybersécurité | Niger 🇳🇪
