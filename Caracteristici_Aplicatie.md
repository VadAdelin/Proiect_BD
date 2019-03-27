**Tabela Utilizatori retine informatiile esentiale despre clientii care intra pe site, sau despre adminii care adauga sau sterg produse din sistem, precum username, parola si email si alte informatii precum nume, numar de telefon etc.**

**Tabela Tranzactie retine o vanzare a unui singur produs catre un singur client. Acest lucru este posibil deoarece vom face implementarea astfel incat fiecare atribut cheie primara(id_produs) din o anume tabela de produse sa fie distinct de oricare altul dintr-alta tabela de produse.
Aceasta tabela retine astfel user_id si produs_id, si in plus data efectuarii tranzactiei si valoarea.**

**Pentru fiecare tabela a produselor avem atribute specifice fiecarui tip de produs in parte si cheia primara descrisa mai sus.**

**Aplicatia pune la dispozitie o lista de categorii de produse din care clientul poate selecte ce isi doreste. Fiecare categorie de produse este populata cu obiecte care fac parte din gama respectiva alaturi de cateva informatii esentiale asa cu am mentionat mai sus.**

**In cadrul aplicatiei se vor putea crea conturi noi. Logarea se va face pe baza username-ului (format: nume_prenume) si a parolei pe care a o detine fiecare utilizator in parte.**


**Functii folositoare:**

**1)facturare:**
**Aceasta functie va primi o lista de produse (cele din cosul de cumparaturi), le va sterge pe cele cumparate din sistem(sau va scadea din stocul disponibil), si va retine tranzactiile atomice;**

**2)adaugare_produs:**
**Aceasta functie va adauga un produs in functie de tipul sau, validand datele introduse;**

**3)stergere_produs:**
**Sterge un produs indiferent de stocul disponibil;**

**4)inregistrare_utilizator:**
**Aceasta functie va adauga un utilizator in sistem, validand datele introduse;**

**5)sort_by:**
**6)Aceasta functie va sorta elemntele unui tabel in functie de coloana aleasa;**

**7)pc_budget:**
**Aceasta functie va oferi utilizatorului un pc din piese in functie de bugetul ales si preferinte pentru fiecare piesa in parte;**

**8)pc_budget_part:**
**Aceasta functie va oferi utilizatorului un pc din piese in functie de bugetul ales si alte produse deja alese;**

**9)get_best:**
**Aceasta functie va gasi un produs in functie de buget si de preferinte specifice, fiind apelata de pc_budget si pc_budget_part;**
