# Arvestustöö raport

Nimi: Karl Uiga
Variant: A
Kuupäev: 09.10.2026

Kirjelda vähemalt 6 leitud probleemi.

Probleem 1

- Skript: scripts/backup.sh
- Mida skript näiliselt tegi: Trükkis teate arhiivi valmimisest.
- Mis oli tegelikult vale: find > salvestas arhiivi sisse vaid failide nimekirja, mitte pakkimist.
- Kuidas vea avastasin: Kontrollisin loodud faili tüüpi.
- Millise käsuga kontrollisin: file backups/backup_*.tar.gz
- Parandus: Asendasin find käsu käsuga tar -czf "$ARCHIVE" -C "$BACKUP_SOURCE" .
- Kuidas kontrollisin pärast parandust: Vaatasin arhiivi sisu käsuga tar -tzf.
- Vajadusel exit code enne / pärast: Enne 0, pärast 0 (1 vea korral).

Probleem 2

- Skript: scripts/disk_check.sh
- Mida skript näiliselt tegi: Kuvati kettakasutuse protsenti.
- Mis oli tegelikult vale: awk luges tulp $4 (vaba ruum) asemel tulp $5 (kasutus%).
- Kuidas vea avastasin: Võrdlesin tulemust df reaalsete andmetega.
- Millise käsuga kontrollisin: df -h /
- Parandus: Muutsin käsu awk '{print $4}' -> awk '{print $5}'.
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti.

Probleem 3

- Skript: scripts/service_check.sh
- Mida skript näiliselt tegi: Kontrollis teenuse aktiivsust.
- Mis oli tegelikult vale: systemctl list-unit-files näitas vaid teenuse olemasolu kettal.
- Kuidas vea avastasin: Peatasin teenuse, skript väitis ikka, et see töötab.
- Millise käsuga kontrollisin: systemctl stop apache2
- Parandus: Asendasin kontrolli käsuga systemctl is-active --quiet "$service".
- Kuidas kontrollisin pärast parandust: Käivitasin skripti peatatud teenusega.
- Vajadusel exit code enne / pärast: Enne 0, pärast 1.

Probleem 4

- Skript: scripts/system_info.sh
- Mida skript näiliselt tegi: Kuvati süsteemi üldandmeid.
- Mis oli tegelikult vale: hostname ja whoami olid vahetuses, Uptime kohal oli kellaaeg.
- Kuidas vea avastasin: Hostname kohal kuvati kasutajanimi.
- Millise käsuga kontrollisin: hostname ja whoami
- Parandus: Parandasin muutujad $(hostname), $(whoami) ja $(uptime -p).
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti.

Probleem 5

- Skript: scripts/system_info.sh
- Mida skript näiliselt tegi: Kuvati RAM-mälu kogumaht.
- Mis oli tegelikult vale: awk otsis /Swap:/ rida (saalefail), mitte /Mem:/.
- Kuidas vea avastasin: Võrdlesin tulemust free -m väljundiga.
- Millise käsuga kontrollisin: free -m
- Parandus: Muutsin otsingurida /Swap:/ -> /Mem:/.
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti.

Probleem 6

- Skript: scripts/user_check.sh
- Mida skript näiliselt tegi: Kontrollis kasutajakonto olemasolu.
- Mis oli tegelikult vale: Otsiti grupifailist /etc/group ja tingimus -ge 0 oli alati tõene.
- Kuidas vea avastasin: Sisestasin testiks olematu kasutaja.
- Millise käsuga kontrollisin: bash scripts/user_check.sh olematu_kasutaja
- Parandus: Asendasin otsingu käsuga id "$username".
- Kuidas kontrollisin pärast parandust: Kontrollisin uuesti olematu kasutajaga.
- Vajadusel exit code enne / pärast: Enne 0, pärast 1.

Uus funktsionaalsus

- Mida lisasin: Masina kohaliku IP-aadressi kuvamine skriptis scripts/system_info.sh.
- Kuidas käivitada: bash scripts/system_info.sh
- Kuidas kontrollisin, et tulemus on õige: Võrdlesin väljundit käskudega ip a ja hostname -I.
