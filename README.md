# Ruby2018

## Tema: Žmogiškųjų išteklių valdymo sistema

### SAVYBĖS

##### Vartotojas:
1. Gali registruotis prie sistemos: **(!)**
   - vartotojai turi vardą ir pavardę;
   - vartotojai turi el. paštą, į kurį yra siunčiama informacija;
   - turi unikalų paskyros ID, slaptažodį;
1. Gali prisijungti prie sistemos; **(!)**
1. Gali atsijungti nuo sistemos; **(!)**
1. Gali koreguoti savo duomenis: 
    - vardą;
    - pavardę;
    - slaptažodį;
1. Vartotojas turi skirtingas roles: **(!)** 
    - Administratorius
    - Projekto vadovas
    - Žmogiškųjų išteklių administratorius

##### Administratorius:
1. Gali matyti vartotojų sąrašą; **(!)**
1. Gali pašalinti vartotojo paskyrą; **(!)** 
1. Gali pakeisti vartotojo slaptažodį;
1. Gali matyti vartotojo paskyros duomenis;
1. Gali matyti vartotojo rolę;
1. Gali pakeisti vartotojo rolę; **(!)** 
1. Gali matyti resursų sąrašą;
1. Gali matyti projektų sąrašą;
1. Gali matyti vartotojo sukurtų resursų sąrašą;
1. **Negali** matyti resurso informacijos; **(!)**
1. **Negali** matyti projekto informacijos; **(!)**
1. **Negali** komentuoti; **(!)**
1. Gali matyti vartotojų veiksmų log'ą;
1. Gali ištrinti vartotojo paskyrą;
1. Gali ištrinti resursą;
1. Gali ištrinti projektą;

##### Projekto vadovas:
1. **Negali** sukurti naujo resurso; **(!)**
1. **Negali** keisti resurso informacijos; **(!)**
1. **Negali** pridėti resurso į projektą; **(!)**
1. **Negali** šalinti resurso iš projekto; **(!)**
1. Gali keisti projekto informaciją: **(!)**
    - Pavadinimą; 
    - Reikiamų žmonių kiekį;
    - Projekto gyvavimo laiką (nuo kada iki kada);
1. Gali matyti resursus, kurie yra jo projekte; **(!)**
1. Gali matyti resurso informaciją;  **(!)**
1. Gali pridėti komentarą prie resurso;
1. Gali pridėti komentarą prie projekto;
1. Gali panaikinti komentarą;

##### Žmogiškųjų išteklių administratorius:
1. Gali matyti resursų sąrašą;  **(!)**
1. Gali matyti projektų sąrašą;  **(!)**
1. Gali matyti komentarus;  **(!)**
1. Gali matyti resurso informaciją;  **(!)**
1. Gali matyti projekto informaciją;  **(!)**
1. Gali sukurti projektą;  **(!)**
1. Gali sukurti resursą;  **(!)**
1. Gali keisti resurso informaciją:
    - Vardą;
    - Pavardę;
    - Gimimo metus;
    - Algos dydį (EUR/h);
    - Pareigų tipą;
1. Gali keisti projekto informaciją:
    - Pavadinimą;
    - Reikiamų žmonių kiekį;
    - Projekto gyvavimo laiką (nuo kada iki kada);
1. Gali pridėti komentarą prie resurso;
1. Gali pridėti komentarą prie projekto;
1. Gali pridėti resursą į projektą;  **(!)**
1. Gali pašalinti resursą iš projekto;  **(!)**
1. Gali pašalinti projektą; **(!)**
1. Gali pašalinti resursą;  **(!)**

##### Resursas:
##### Projektas:
##### Komentaras:
##### Rolė:

**Svarbiausios savybės pažymėtos "(!)".**