# GitHowTo õpipraktika ja töö

Selle projekti eesmärk on dokumenteerida GitHowTo harjutuste käigus omandatud teadmised ja oskused versioonihaldussüsteemi Git kasutamisel.

## Projekti ülevaade

Projekti raames läbiti e-õppe materjalid ja praktilised harjutused, mille käigus õpiti koodi versioonimist, harude haldamist ning muudatuste saatmist kaugrepositooriumisse (GitHub).

Rohkem infot Git algõpetuse kohta leiab ametlikult [GitHowTo lehelt](https://githowto.com/).

### Õpitud teemad

- Repositooriumi algatamine ja seadistamine
- Failide staatuse jälgimine ja indeksisse lisamine
- Commit'ide tegemine ja ajaloo vaatamine
- Harudega (branches) töötamine ja nende liitmine
- Konfliktide ennetamine ja lahendamine

### Tehtud ülesannete nimekiri

- [x] Git repositooriumi seadistamine
- [x] Põhiliste Git käskude läbitegemine
- [x] Harude loomine ja vahetamine
- [x] README.md faili vormindamine ja täiendamine

## Git'i põhitöö

Giti igapäevane töö koosneb kolmest peamisest sammust:
1. Failide muutmine töökataloogis.
2. Muudatuste lisamine indeksisse (`staging area`) käsuga `git add`.
3. Salvestuspunkti luues muudatuste kinnitamine käsuga `git commit`.

## Git'i käsud

```bash
git status	# Kuvab töökataloogi ja indeksi hetkeseisu.
git add		# Lisab muudetud failid indeksisse (staging area).
git commit	# Salvestab indeksis olevad muudatused repositooriumi ajalukku.
git log		# Kuvab teostatud commit'ide ajaloo.
git branch	# Kuvab olemasolevad harud või loob uue haru.
git switch	# Vahetab töödeldavat haru (nt git switch main).
git merge	# Liidab teise haru muudatused aktiivse haruga.
