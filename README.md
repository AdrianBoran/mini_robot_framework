![teste](https://github.com/AdrianBoran/mini_robot_framework/actions/workflows/tests.yml/badge.svg)
# Teste automate — Robot Framework + Selenium

Proiect de practică: teste UI și API pentru aplicații web demonstrative.

## Ce conține

- `login.robot` — teste de autentificare (caz pozitiv și cazuri negative)
- `login_datadriven.robot` — aceleași verificări, scrise data-driven
- `api.robot` — teste de API cu RequestsLibrary
- `config/` — variabile per mediu

## Cum se rulează

Pregătirea mediului:

python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt

Rularea:

robot --outputdir results . # tot
robot --outputdir results --include smoke . # doar testele critice
robot --outputdir results --include api . # doar API, fara browser
robot --outputdir results --variable BROWSER:headlesschrome .

Rapoartele se generează în `results/`: `report.html` pentru sumar, `log.html` pentru detaliu pas cu pas.

## Principii aplicate

- Locatoarele stau ca variabile, separate de teste
- Zero `Sleep` — doar așteptări explicite pe condiție
- Teste independente, fiecare cu setup și teardown propriu
- Screenshot automat la eșec
- Tag-uri pentru selecție: `smoke`, `negative`, `api`
- Parametrizare pe medii fără modificarea codului

## Mediu

Python 3.11, Robot Framework 7, SeleniumLibrary, Chrome.
