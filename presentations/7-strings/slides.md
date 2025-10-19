---
transition: slide-left
layout: cover
color: stone-light
---

### Șiruri de Caractere (Strings) în C

#### Manipularea textului și pointeri

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Ce este un Șir de Caractere (String)?

:: content ::

În multe limbaje de programare, un "string" este un tip de dată special pentru a lucra cu text. În C, lucrurile stau puțin diferit.

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

În C, un **șir de caractere** nu este un tip de dată fundamental. Este, de fapt, un **tablou (array) de caractere (`char`)**.

</div>
<br/>

Există o regulă esențială care face un tablou de caractere să fie un șir de caractere valid:

<div class="neversink-stone-light-scheme bg-[var(--neversink-bg-code-color)] p-4 rounded-lg text-center mt-4">

Tabloul trebuie să se termine cu un caracter special numit **caracterul nul** (`\0`).

</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Caracterul Nul (`\0`) - Terminatorul

:: content ::

Caracterul nul (`\0`) acționează ca un **semn de stop**. Toate funcțiile standard din C care lucrează cu șiruri de caractere (cum ar fi cele de afișare, copiere, concatenare) se bazează pe acest caracter pentru a ști unde se termină șirul.

Să vizualizăm șirul "Salut" în memorie:

<style>
.array-viz {
  display: flex;
  justify-content: center;
  gap: 2px;
  font-family: monospace;
}
.array-cell {
  border: 2px solid var(--neversink-border-color);
  width: 60px;
  height: 60px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.5em;
  background-color: var(--neversink-bg-code-color);
  color: var(--neversink-fg-code-color);
  position: relative;
}
.array-index {
  position: absolute;
  bottom: -25px;
  font-size: 0.8em;
  color: var(--neversink-text-color);
}
</style>

<div class="neversink-stone-light-scheme">
<br/>
<div class="array-viz mt-12">
  <div class="array-cell"><span class="array-index">[0]</span>'S'</div>
  <div class="array-cell"><span class="array-index">[1]</span>'a'</div>
  <div class="array-cell"><span class="array-index">[2]</span>'l'</div>
  <div class="array-cell"><span class="array-index">[3]</span>'u'</div>
  <div class="array-cell"><span class="array-index">[4]</span>'t'</div>
  <div class="array-cell" style="background-color: #fca5a5;"><span class="array-index">[5]</span>'\0'</div>
</div>
</div>

<br/>
<AdmonitionType type="warning">
Pentru a stoca un șir de `N` caractere, aveți nevoie de un tablou de dimensiune `N + 1` pentru a face loc și terminatorului nul!
</AdmonitionType>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Declararea și Inițializarea Șirurilor

:: content ::

Există două moduri principale de a declara și inițializa un șir de caractere:

<div class="grid grid-cols-2 gap-8 mt-4">
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">Folosind un literal de șir</h3>
    <div class="text-sm mt-2">
Cea mai comună și convenabilă metodă. Compilatorul adaugă automat caracterul nul `\0` la final.

```c
char salut[] = "Salut";
```

</div>
  </div>
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">Ca un tablou de caractere</h3>
    <div class="text-sm mt-2">
Mai puțin comun, dar demonstrează conceptul. Aici, trebuie să adăugăm manual caracterul nul.

```c
char salut[] = {'S', 'a', 'l', 'u', 't', '\0'};
```
    
</div>
  </div>
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Șirurile și Poinerii

:: content ::

Numele unui tablou în C este, în esență, un **pointer** către primul său element. Deoarece șirurile sunt tablouri de caractere, numele unui șir este un pointer către primul său caracter.

```c
char mesaj[] = "Text";

// 'mesaj' este un pointer la adresa lui 'T'
// 'mesaj + 1' este un pointer la adresa lui 'e'
// si asa mai departe
```

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

Această relație este fundamentală și explică de ce multe funcții care lucrează cu șiruri de caractere acceptă ca argument un `char *` (pointer la char).

</div>

---
transition: slide-left
layout: cover
color: stone-light
---

## Citirea și Afișarea Șirurilor de Caractere

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Afișarea cu `printf`

:: content ::

Pentru a afișa un șir de caractere, folosim specificatorul de format **`%s`**. `printf` va începe să afișeze caractere de la adresa dată, până când întâlnește caracterul nul `\0`.

```c {monaco-run}
#include <stdio.h>

int main() {
    char nume[] = "Popescu";
    char prenume[] = "Ion";

    printf("Nume: %s\n", nume);
    printf("Prenume: %s\n", prenume);
    printf("Nume complet: %s %s\n", prenume, nume);

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Citirea cu `scanf`

:: content ::

Putem folosi `%s` și cu `scanf` pentru a citi un șir.

<AdmonitionType type="danger">

**`scanf("%s", ...)` este periculos!**

</AdmonitionType>

<div class="ns-c-tight">

-   Se oprește la primul caracter "whitespace" (spațiu, tab, linie nouă). Nu poate citi un nume complet precum "Popescu Ion".
-   **Nu verifică limitele tabloului!** Dacă utilizatorul introduce un text mai lung decât dimensiunea tabloului, va avea loc un **buffer overflow**, o problemă gravă de securitate.

</div>

---
layout: cover
align: c
color: stone-light
---

```c
#include <stdio.h>

int main() {
    // ATENTIE: buffer de doar 10 caractere!
    char nume[10];

    printf("Introduceti numele: ");
    // scanf nu stie ca 'nume' are doar 10 locuri.
    // Daca scrieti "Alexandrescu", programul se va prabusi.
    scanf("%s", nume); // NU folosim '&' pentru siruri cu scanf!

    printf("Numele introdus: %s\n", nume);

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# O Metodă Mai Sigură: `fgets`

:: content ::

Funcția `fgets` este o alternativă mult mai sigură pentru a citi șiruri de caractere.

<div class="ns-c-tight">

-   **`fgets(nume_sir, dimensiune, sursa)`**
-   Citește o linie întreagă, inclusiv spațiile.
-   Este sigură: nu va scrie niciodată mai mult de `dimensiune - 1` caractere, prevenind overflow-ul.
-   `sursa` este de obicei `stdin` (Standard Input - tastatura).

</div>

<br/>
<AdmonitionType type="info">

Un mic dezavantaj: `fgets` stochează și caracterul de linie nouă (`\n`) dacă utilizatorul apasă Enter. Acesta poate fi eliminat manual.

</AdmonitionType>

---
layout: cover
---

```c
#include <stdio.h>
#include <string.h> // Pentru functia strcspn

int main() {
    char nume_complet[50];

    printf("Introduceti numele si prenumele: ");

    // fgets(unde stocam, dimensiunea maxima, de unde citim)
    fgets(nume_complet, 50, stdin);

    // Optional: Eliminam caracterul '\n' de la final
    nume_complet[strcspn(nume_complet, "\n")] = 0;

    printf("Salut, %s!\n", nume_complet);

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Biblioteca `string.h`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Unelte Standard pentru Șiruri

:: content ::

Limbajul C oferă o bibliotecă standard, **`string.h`**, care conține o colecție de funcții foarte utile pentru manipularea șirurilor de caractere.

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-center">

Pentru a folosi aceste funcții, trebuie să includem biblioteca la începutul fișierului:
<p class="font-mono text-lg mt-2 text-[var(--neversink-text-color)]">#include &lt;string.h&gt;</p>

</div>

Vom explora cele mai comune și utile funcții.

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strlen` - Lungimea Șirului

:: content ::

Funcția `strlen` (string length) returnează lungimea unui șir de caractere.

<div class="ns-c-tight">

-   **`size_t strlen(const char *sir)`**
-   Numără caracterele până la, **dar fără a include**, caracterul nul `\0`.
-   `size_t` este un tip de dată întreg, fără semn, adecvat pentru a reprezenta dimensiuni.

</div>

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char text[] = "Programare"; // 10 caractere
    
    // strlen va returna 10
    int lungime = strlen(text);

    printf("Sirul \"%s\" are %d caractere.\n", text, lungime);

    // Dimensiunea totala in memorie este 11 (include \0)
    printf("Dimensiunea in memorie (sizeof): %zu bytes.\n", sizeof(text));

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strcpy` - Copierea Șirurilor

:: content ::

Nu putem copia șiruri folosind operatorul `=`. Trebuie să folosim `strcpy` (string copy).

<div class="ns-c-tight">

-   **`char *strcpy(char *destinatie, const char *sursa)`**
-   Copiază conținutul șirului `sursa` (inclusiv `\0`) în șirul `destinatie`.

</div>

<AdmonitionType type="danger">

**`strcpy` este periculos!** La fel ca `scanf("%s")`, nu verifică dacă șirul `destinatie` are suficient spațiu pentru a conține `sursa`, ducând la potențiale buffer overflows. O alternativă mai sigură este `strncpy`.

</AdmonitionType>

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char sursa[] = "Text de copiat";
    char destinatie[50]; // Asiguram suficient spatiu

    // strcpy(unde copiem, de unde copiem)
    strcpy(destinatie, sursa);

    printf("Sursa: %s\n", sursa);
    printf("Destinatie (dupa copiere): %s\n", destinatie);

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strcat` - Concatenarea Șirurilor

:: content ::

Funcția `strcat` (string concatenate) adaugă un șir la sfârșitul altui șir.

<div class="ns-c-tight">

-   **`char *strcat(char *destinatie, const char *sursa)`**
-   Găsește caracterul `\0` din `destinatie`, și începe să copieze `sursa` de la acea poziție.

</div>

<AdmonitionType type="danger">

**`strcat` este la fel de periculos ca `strcpy`!** Asigurați-vă că șirul `destinatie` are suficient spațiu pentru a conține ambele șiruri combinate, plus caracterul nul.

</AdmonitionType>

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char salut[20] = "Buna "; // Spatiu suficient pentru ambele
    char nume[] = "dimineata!";

    // strcat(la ce adaugam, ce adaugam)
    strcat(salut, nume);

    printf("Sirul concatenat: %s\n", salut);

    return 0;
}
```
---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strcmp` - Compararea Șirurilor

:: content ::

Nu putem compara șiruri lexicografic (alfabetic) folosind `==`. `strcmp` (string compare) face acest lucru.

<div class="ns-c-tight">

-   **`int strcmp(const char *sir1, const char *sir2)`**
-   Returnează:
    -   **`0`** dacă șirurile sunt identice.
    -   O valoare **negativă** dacă `sir1` este alfabetic înaintea `sir2`.
    -   O valoare **pozitivă** dacă `sir1` este alfabetic după `sir2`.

</div>

---
layout: cover
align: c
color: stone-light
---

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char pass[] = "secret123";
    char input[50];

    printf("Introduceti parola: ");
    scanf("%s", input);

    // strcmp returneaza 0 daca sunt egale
    if (strcmp(pass, input) == 0) {
        printf("Parola corecta!\n");
    } else {
        printf("Parola gresita!\n");
    }

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strchr` & `strrchr` - Găsirea unui Caracter

:: content ::

Aceste funcții caută un caracter specific într-un șir și returnează un pointer la locația sa.

<div class="grid grid-cols-2 gap-8 mt-4">
  <div class="neversink-indigo-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">
    
`strchr` (string character)

</h3>
    <div class="text-sm mt-2">

Găsește **prima** apariție a unui caracter.

<p class="font-mono mt-2">

`char *strchr(const char *str, int c);`

</p>
    </div>
  </div>
  <div class="neversink-indigo-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">

`strrchr` (string reverse character)
</h3>
    <div class="text-sm mt-2">

Găsește **ultima** apariție a unui caracter.

<p class="font-mono mt-2">

`char *strrchr(const char *str, int c);`

</p>
    </div>
  </div>
</div>

<br/>
<AdmonitionType type="info">
Ambele funcții returnează un pointer la caracterul găsit sau `NULL` dacă caracterul nu există în șir.
</AdmonitionType>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char cale_fisier[] = "/home/user/documente/raport.txt";
    char caracter_cautat = '/';
    char extensie_cautata = '.';

    // Gasim prima aparitie a lui '/'
    char *prima_bara = strchr(cale_fisier, caracter_cautat);
    // Gasim ultima aparitie a lui '/'
    char *ultima_bara = strrchr(cale_fisier, caracter_cautat);
    // Gasim extensia fisierului
    char *extensie = strrchr(cale_fisier, extensie_cautata);

    if (prima_bara != NULL) {
        // %s cu un pointer va afisa de la acel pointer pana la final
        printf("Restul caii de la prima '/': %s\n", prima_bara); 
    }
    if (ultima_bara != NULL) {
        // +1 pentru a sari peste caracterul '/'
        printf("Numele fisierului: %s\n", ultima_bara + 1);
    }
    if (extensie != NULL) {
        printf("Extensia fisierului: %s\n", extensie + 1);
    }

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strstr` - Găsirea unui Subșir

:: content ::

Funcția `strstr` (string in string) caută prima apariție a unui subșir ("needle") într-un șir mai mare ("haystack").

<div class="ns-c-tight">

-   **`char *strstr(const char *haystack, const char *needle);`**
-   Returnează un pointer la începutul subșirului găsit în șirul principal.
-   Returnează `NULL` dacă subșirul nu este găsit.

</div>

<br/>
<div class="neversink-indigo-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-center">
Este utilă pentru a verifica dacă un text conține un anumit cuvânt sau o anumită secvență de caractere.
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char propozitie[] = "Limbajul C este un limbaj procedural.";
    char cuvant_cautat[] = "limbaj";

    // Cautam "limbaj" in propozitie
    char *rezultat = strstr(propozitie, cuvant_cautat);

    if (rezultat != NULL) {
        printf("Cuvantul '%s' a fost gasit!\n", cuvant_cautat);
        printf("Restul propozitiei de la '%s' este: \"%s\"\n", cuvant_cautat, rezultat);

        // Putem calcula si pozitia (indexul)
        int pozitie = rezultat - propozitie;
        printf("A fost gasit la indexul: %d\n", pozitie);

    } else {
        printf("Cuvantul '%s' nu a fost gasit.\n", cuvant_cautat);
    }

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strspn` - Măsurarea Segmentului Inițial

:: content ::

Funcția `strspn` (string span) este mai specializată. Ea calculează lungimea segmentului de la începutul unui șir care conține **doar** caractere dintr-un set specificat.

<div class="ns-c-tight">

-   **`size_t strspn(const char *str1, const char *str2);`**
-   Returnează numărul de caractere de la începutul lui `str1` care se găsesc în `str2`.
-   Se oprește la primul caracter din `str1` care **nu** se află în `str2`.

</div>

<br/>
<div class="neversink-indigo-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-center">
Poate fi folosită pentru a valida formatul datelor de la începutul unui șir.
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char text[] = "12345ABCDE";
    char cifre[] = "0123456789";

    // Calculeaza cate caractere de la inceputul lui 'text'
    // sunt cifre (se gasesc in sirul 'cifre').
    size_t lungime_prefix_numeric = strspn(text, cifre);

    printf("Sirul '%s' incepe cu %zu cifre.\n", text, lungime_prefix_numeric);

    char text2[] = "abc123def";
    size_t lungime2 = strspn(text2, cifre);
    printf("Sirul '%s' incepe cu %zu cifre.\n", text2, lungime2);


    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `strtok` - Divizarea unui Șir (Tokenization)

:: content ::

Funcția `strtok` (string token) este folosită pentru a împărți un șir în "token-uri" (segmente), pe baza unor caractere delimitatoare.

<AdmonitionType type="danger">

**Atenție! `strtok` modifică (distruge) șirul original!** El inserează caractere nule `\0` în locul delimitatorilor.

</AdmonitionType>


<div class="ns-c-tight">

-   **`char *strtok(char *str, const char *delimitatori);`**
-   La **primul apel**, se specifică șirul care trebuie divizat.
-   La **apelurile următoare**, se folosește `NULL` ca prim argument pentru a continua divizarea aceluiași șir.
-   Returnează un pointer la următorul token sau `NULL` când nu mai sunt token-uri.

</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>
#include <string.h>

int main() {
    char propozitie[] = "Invat,limbajul,C,la,facultate";
    char delimitatori[] = ","; // Putem avea mai multi: " ,.-"

    // Primul apel - cu sirul original
    char *token = strtok(propozitie, delimitatori);
    printf("Token-uri gasite:\n");
    // Ciclul continua cat timp strtok nu returneaza NULL
    while (token != NULL) {
        printf("-> %s\n", token);
        // Apelurile urmatoare - cu NULL, pentru a continua
        token = strtok(NULL, delimitatori);
    }
    
    // Sirul original a fost modificat!
    printf("\nSirul original dupa strtok: %s\n", propozitie);
    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

# Sarcini de Practică

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Sarcina 1 (Ușor)

:: content ::

### Cerință:
Scrieți un program care:
<div class="ns-c-tight">

1.  Cere utilizatorului să-și introducă prenumele.
2.  Folosind `strlen`, afișează un mesaj care specifică câte caractere are prenumele introdus.

</div>
<br/>

### Exemplu de interacțiune:
```text
Introduceti prenumele: Cristian
Prenumele "Cristian" are 8 caractere.
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Sarcina 2 (Mediu)

:: content ::

### Cerință:
Scrieți un program care construiește un username. Programul trebuie să:
<div class="ns-c-tight">

1.  Ceară utilizatorului numele de familie.
2.  Ceară utilizatorului prenumele.
3.  Combine primul caracter din prenume cu numele de familie complet.
4.  Afișeze username-ul rezultat, cu litere mici.

</div>
<br/>

<AdmonitionType type="tip">

Puteți crea un șir nou `username`. Copiați primul caracter din prenume în el. Apoi, folosiți `strcat` pentru a adăuga numele de familie. Pentru a converti la litere mici, puteți folosi funcția `tolower` din biblioteca `ctype.h` și un ciclu `for`.

</AdmonitionType>

<br/>

### Exemplu de interacțiune:
```text
Numele de familie: Popescu
Prenumele: Ion
Username-ul generat este: ipopescu
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Sarcina 3 (Avansat)

:: content ::

### Cerință:
Scrieți un program care verifică dacă un cuvânt este **palindrom**. Un palindrom este un cuvânt care se citește la fel din ambele sensuri (ex: "cojoc", "capac", "ana").

<div class="ns-c-tight">

1.  Cereți utilizatorului să introducă un cuvânt.
2.  Creați o copie a cuvântului în ordine inversă.
3.  Comparați cuvântul original cu copia inversată folosind `strcmp`.
4.  Afișați dacă este sau nu palindrom.

</div>
<br/>
<AdmonitionType type="tip">

Pentru a inversa șirul, puteți folosi un ciclu `for`. Un contor `i` merge de la începutul șirului original la sfârșit, iar un alt contor `j` merge de la sfârșitul șirului copie la început. La fiecare pas, `copie[j] = original[i]`.

</AdmonitionType>

### Exemplu de interacțiune:
```text
Introduceti un cuvant: cojoc
Cuvantul "cojoc" este palindrom.
```
```text
Introduceti un cuvant: salut
Cuvantul "salut" nu este palindrom.
```