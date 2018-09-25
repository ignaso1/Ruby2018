# Ruby2018

## Tema: Žmogiškųjų išteklių valdymo sistema

### SAVYBĖS

##### Vartotojas:
1. Gali registruotis prie sistemos: **(!)**
1. Vartotojai turi vardą ir pavardę;
1. Vartotojai turi el. paštą, į kurį yra siunčiama informacija;
1. Turi unikalų paskyros ID;**(!)**
1. Turi slaptažodį;**(!)**
1. Gali prisijungti prie sistemos; **(!)**
1. Gali atsijungti nuo sistemos; **(!)**
1. Gali sukurti grupinį pokalbį;
1. Gali koreguoti savo duomenis: 
    - Vardą;
    - Pavardę;
    - Slaptažodį;
1. Vartotojas turi skirtingas roles: **(!)** 
    - Administratorius;
    - Projekto vadovas;
    - Žmogiškųjų išteklių administratorius;
    - Potencialus Resursas;
    - Talentų medžiotojas;
    - Finansininkas;
    - Konsultantas;
    - Straipsnių rašytojas;
    - Vadovas;
    - Tyrėjas;

##### Administratorius:
1. Gali matyti vartotojų sąrašą; **(!)**
1. Gali pašalinti vartotojo paskyrą; **(!)**
1. Gali pakeisti vartotojo slaptažodį;
1. Gali matyti vartotojo paskyros duomenis;
1. Gali matyti vartotojo rolę;
1. Gali pakeisti vartotojo rolę; **(!)** 
1. Gali matyti resursų sąrašą;
1. Gali matyti potencialių resursų sąrašą;
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
1. Gali keisti resurso informaciją: **(!)**
    - Vardą;
    - Pavardę;
    - Gimimo metus;
    - Algos dydį (EUR/h);
    - Pareigų tipą;
1. Gali keisti projekto informaciją: **(!)**
    - Pavadinimą;
    - Reikiamų žmonių kiekį;
    - Projekto gyvavimo laiką (nuo kada iki kada);
1. Gali pridėti komentarą prie resurso;
1. Gali pridėti komentarą prie projekto;
1. Gali šalinti komentarą;
1. Gali pridėti resursą į projektą;  **(!)**
1. Gali pašalinti resursą iš projekto;  **(!)**
1. Gali pašalinti projektą; **(!)**
1. Gali pašalinti resursą;  **(!)**
1. Sukurti Atostogų/Ligos įrašą;
1. Ištrinti Atostogų/Ligos įrašą;

##### Resursas (žmogus, dirbantis kompanijoje):
1. Turi vardą ir pavardę; 
1. Turi unikalų ID; **(!)**
1. Gali priklausyti projektui;
1. Turi pareigų tipą; **(!)**
1. Turi užmokestį; **(!)**
1. Gali turėti komentarų;
1. Turi gimimo metus;
1. Gali turėti atostogų/ligos įrašą;

##### Projektas:
1. Turi pavadinimą; 
1. Turi unikalų ID; **(!)**
1. Gali turėti resursų;
1. Turi reikiamo kiekio žmonių skaičių; **(!)**
1. Turi pradžios ir pabaigos datas; **(!)**
1. Gali turėti komentarų;
1. **Negali** turėti potencialių resursų **(!)**

##### Komentaras:
1. Turi unikalų ID; **(!)**
1. Turi autorių; **(!)**
1. Turi sukūrimo datą; **(!)**
1. Turi teksto eilutę; **(!)**
1. Gali priklausyti projektui arba resursui.

##### Atostogų/Ligos įrašas:
1. Turi unikalų ID;
1. Turi resursą, kuriam priklauso;
1. Turi pradžios ir pabaigos datas;

##### Potencialus Resursas:
1. Turi vardą ir pavardę;
1. Turi unikalų ID; **(!)**
1. Turi gyvenimo aprašymą;
1. Turi potencialių pareigų tipą; **(!)**
1. Turi potencialų užmokestį;
1. Gali turėti komentarų;

##### Talentų medžiotojas:
1. Sukurti potencialių resursą; **(!)**
1. Keisti potencialaus resurso informaciją;
1. Pridėti komentarą prie potencialaus resurso;
1. Šalinti komentarą;
1. Pašalinti potencialų resursą; **(!)**
1. Pakeisti potencialų resursą į "normalų" resursą;

##### Finansininkas:
1. Gali matyti resursus ir potencialius resursus; **(!)**
1. **Negali** matyti projektų; **(!)**
1. Gali redaguoti resurso informaciją:
    - Algos dydį;
1. Gali rašyti komentarą;

##### Konsultavimas:
1. Turi klausimą;
1. Turi konsultantą;
1. Turi vertinimą;

##### Tyrimas:
1. Turi unikalų ID; **(!)**
1. Turi įrašo datą; **(!)**
1. Turi tyrimo autorių; **(!)**
1. Turi teksto eilutę; **(!)**
1. Gali turėti komentarų;

##### Straipnsnis:
1. Turi unikalų ID; **(!)**
1. Turi įrašo datą; **(!)**
1. Turi straipsnio autorių; **(!)**
1. Turi teksto eilutę; **(!)**
1. Gali turėti komentarų;

##### Klausimas:
1. Turi unikalų ID; **(!)**
1. Turi įrašo datą; **(!)**
1. Turi klausimo autorių; **(!)**
1. Turi teksto eilutę; **(!)**
1. Gali turėti komentarų;

##### Vertinimas:
1. Turi unikalų ID; **(!)**
1. Turi įrašo datą; **(!)**
1. Turi vertinimo autorių; **(!)**
1. Turi vertinimą; **(!)**

##### Atsiliepimas:
1. Turi unikalų ID; **(!)**
1. Turi įrašo datą; **(!)**
1. Turi atsiliepimo autorių; **(!)**
1. Turi teksto eilutę; **(!)**
1. Turi vertinimą;
1. Gali turėti komentarų;

##### Konsultantas:
1. Gali matyti klausimus;
1. Gali atsakyti į klausimus;
1. Turi užmokestį; **(!)**
1. Turi atsiliepimus iš vartotojų; **(!)**

##### Tyrėjas:
1. Turi užmokestį; **(!)**
1. Turi vertinimą iš vartotojų; **(!)**
1. Gali atsakyti į tyrimo klausimus;

##### Straipsnių rašytojas:
1. Turi užmokestį; **(!)**
1. Turi vertinimą iš vartotojų; **(!)**
1. Gali atsakyti į straipsnių klausimus;

##### Įmonė:
1. Turi kodą;  **(!)**
1. Turi pavadinimą;  **(!)**
1. Turi vadovą;
1. Turi resursus;
1. Gali turėti skolų;
1. Gali bankrutoti;

##### Vadovas:
1. Turi algą;
1. Gali matyti resursus;
1. Gali matyti projektus;
1. Gali tvirtinti prašymus;

##### Grupinis pokalbis:
1. Turi pavadinimą;  **(!)**
1. Turi autorių;  **(!)**
1. Turi pašnekovus;  **(!)**
1. Turi žinutes;  **(!)**
1. Gali turėti įkeltus dokumentus;

##### Pašnekovas:
1. Gali sukurti žinutę;  **(!)**
1. Gali skaityti visas pokalbyje esančias žinutes;  **(!)**
1. Gali cituoti kitų pašnekovų parašytas žinutes;
1. Gali matyti kitų pašnekovų vardus, pavardes ir roles;  **(!)**
1. Gali į pokalbį ikelti dokumentą;


##### Žinutė:
1. Turi autorių;  **(!)**
1. Turi teksto eilutę;  **(!)**
1. Turi sukūrimo datą;  **(!)**
1. Gali turėti prisegtą dokumentą;

**Svarbiausios savybės pažymėtos "(!)".**
