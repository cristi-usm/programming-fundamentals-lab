---
transition: slide-left
layout: cover
color: stone-light
---

### Tablouri (Arrays) în C

#### Stocarea colecțiilor de date

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Problema Stocării Multiplelor Valori

:: content ::

Imaginați-vă că trebuie să stocăm notele a 5 studenți. Fără o structură de date adecvată, am face ceva de genul:

```c
int nota1 = 8;
int nota2 = 10;
int nota3 = 7;
int nota4 = 9;
int nota5 = 8;
```

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

**Ce se întâmplă dacă avem 100 de studenți? Sau 1000?**

<p class="mt-2">Declararea a sute de variabile individuale este nepractică, greu de gestionat și imposibil de parcurs în mod automatizat (cu un ciclu).</p>
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Variabile în Memorie: Haosul

:: content ::

Atunci când declarăm variabile separate, sistemul de operare le alocă spațiu în memorie unde găsește loc. Ele pot fi împrăștiate, fără nicio legătură fizică între ele.

<style>
.memory-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  gap: 10px;
  background-color: var(--neversink-bg-color);
  padding: 20px;
  border-radius: 8px;
  border: 1px solid var(--neversink-border-color);
  font-family: monospace;
}
.memory-box {
  background-color: var(--neversink-bg-code-color);
  border: 2px solid var(--neversink-border-color);
  padding: 10px;
  text-align: center;
  border-radius: 4px;
  color: var(--neversink-fg-code-color);
}
.memory-box .address {
  font-size: 0.8em;
  opacity: 0.7;
  color: var(--neversink-text-color);
}
.memory-box .value {
  font-size: 1.5em;
  font-weight: bold;
}
.dots {
  font-size: 2em;
  color: var(--neversink-text-color);
}
</style>

<div class="memory-container neversink-indigo-light-scheme">
  <div class="memory-box">
    <div class="address">0x100A</div>
    <div class="value">nota1: 8</div>
  </div>
  <div class="dots">...</div>
  <div class="memory-box">
    <div class="address">0x25B2</div>
    <div class="value">nota2: 10</div>
  </div>
  <div class="dots">...</div>
  <div class="memory-box">
    <div class="address">0x401C</div>
    <div class="value">nota3: 7</div>
  </div>
</div>

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

Nu există o modalitate simplă de a trece de la `nota1` la `nota2` în memorie. Avem nevoie de o soluție care să organizeze datele **împreună**.

</div>

---
transition: slide-left
layout: cover
color: stone-light
---

## Soluția: Tablourile (Arrays)

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Ce este un Tablou (Array)?

:: content ::

Un **tablou** (array) este o colecție de elemente de **același tip de date**, stocate într-o zonă de memorie **continuă** (una după alta, fără spații).

<div class="ns-c-tight">

-   Toate elementele tabloului împărtășesc același nume.
-   Putem accesa fiecare element individual folosind un **index** (un număr de ordine).
-   Variabila care reprezintă tabloul este, în esență, o **referință (un pointer)** către adresa de memorie a **primului element** din secvență.

</div>
<br/>

<style>
.memory-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  gap: 10px;
  background-color: var(--neversink-bg-color);
  padding: 20px;
  border-radius: 8px;
  border: 1px solid var(--neversink-border-color);
  font-family: monospace;
}
.memory-box {
  background-color: var(--neversink-bg-code-color);
  border: 2px solid var(--neversink-border-color);
  padding: 10px;
  text-align: center;
  border-radius: 4px;
  color: var(--neversink-fg-code-color);
}
.memory-box .address {
  font-size: 0.8em;
  opacity: 0.7;
  color: var(--neversink-text-color);
}
.memory-box .value {
  font-size: 1.5em;
  font-weight: bold;
}
.dots {
  font-size: 2em;
  color: var(--neversink-text-color);
}
</style>

<div class="memory-container neversink-indigo-light-scheme">
  <div class="memory-box">
    <div class="address">0x1000</div>
    <div class="value">8</div>
  </div>
  <div class="memory-box">
    <div class="address">0x1004</div>
    <div class="value">10</div>
  </div>
  <div class="memory-box">
    <div class="address">0x1008</div>
    <div class="value">7</div>
  </div>
  <div class="memory-box">
    <div class="address">0x100C</div>
    <div class="value">9</div>
  </div>
</div>

<AdmonitionType type="info">
Observați cum adresele cresc secvențial. Aici, un `int` ocupă 4 bytes, deci adresa crește cu 4 pentru fiecare element.
</AdmonitionType>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Sintaxa Declarării unui Tablou

:: content ::

Pentru a declara un tablou, trebuie să specificăm trei lucruri:

<div class="ns-c-tight">

1.  **Tipul de date** al elementelor pe care le va stoca.
2.  **Numele** tabloului.
3.  **Dimensiunea** (numărul de elemente), specificată între paranteze drepte `[]`.

</div>

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>

```c
tip_de_data nume_tablou[dimensiune];
```
</div>

---
layout: top-title
align: c
color: stone-light
---

:: title ::

# Exemple

:: content ::

```c
// Un tablou care poate stoca 5 numere intregi
int note[5];

// Un tablou care poate stoca 100 de numere reale
float preturi[100];

// Un tablou care poate stoca 20 de caractere
char litere[20];
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Lucrul cu Elementele unui Tablou

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Accesarea Elementelor prin Index

:: content ::

Accesăm un element specific dintr-un tablou folosind numele acestuia urmat de indexul elementului între paranteze drepte `[]`.

<AdmonitionType type="danger">

**Indexarea în C începe ÎNTOTDEAUNA de la 0!**

</AdmonitionType>
<br/>

Pentru un tablou de dimensiune `N`, primul element are indexul `0`, iar ultimul element are indexul `N-1`.

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

<div class="neversink-indigo-light-scheme">

<br/>

<div class="array-viz mt-12">
  <div class="array-cell"><span class="array-index">[0]</span>?</div>
  <div class="array-cell"><span class="array-index">[1]</span>?</div>
  <div class="array-cell"><span class="array-index">[2]</span>?</div>
  <div class="array-cell"><span class="array-index">[3]</span>?</div>
  <div class="array-cell"><span class="array-index">[4]</span>?</div>
</div>
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    // Declaram un tablou pentru 5 note
    int note[5];

    // Atribuim valori elementelor folosind indexul
    note[0] = 8;  // Primul element
    note[1] = 10;
    note[2] = 7;
    note[3] = 9;
    note[4] = 8;  // Ultimul element

    // Afisam valoarea elementului de la indexul 1
    printf("A doua nota este: %d\n", note[1]); // Va afisa 10

    // Putem modifica o valoare
    note[0] = 5; // Prima nota a fost modificata
    printf("Prima nota acum este: %d\n", note[0]); // Va afisa 5

    // Calculam media primelor doua note
    float medie = (note[0] + note[1]) / 2.0f;
    printf("Media primelor doua note: %.2f\n", medie);

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Inițializarea unui Tablou

:: content ::

Putem atribui valori unui tablou direct la declarare, folosind o listă de valori între acolade `{}`.

```c
// Initializam tabloul cu 5 valori
int note[5] = {8, 10, 7, 9, 8};

// Putem omite dimensiunea, iar compilatorul o va calcula automat
// in functie de numarul de elemente din lista.
int note_auto[] = {8, 10, 7, 9, 8}; // Compilatorul stie ca are 5 elemente

// Daca initializam mai putine elemente decat dimensiunea,
// restul elementelor vor fi initializate automat cu 0.
int partial[5] = {10, 20, 30}; // partial[3] si partial[4] vor fi 0
```

<br/>
<AdmonitionType type="warning">
Această sintaxă cu `{}` funcționează **doar** la declararea tabloului. Nu o puteți folosi pentru a atribui valori unui tablou deja declarat.

```c
int note[5];
// note = {8, 10, 7, 9, 8}; // ILEGAL! EROARE DE COMPILARE!
```

</AdmonitionType>

---
transition: slide-left
layout: cover
color: stone-light
---

## Parcurgerea Tablourilor

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Tablourile și Ciclul `for`

:: content ::

Combinația dintre tablouri și ciclul `for` este fundamentală în C. Deoarece elementele unui tablou sunt indexate numeric (0, 1, 2, ...), putem folosi contorul unui ciclu `for` ca index pentru a parcurge și procesa fiecare element în parte.

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

**Logica:**
Creează un ciclu `for` cu un contor `i` care merge de la `0` (primul index) până la `dimensiune - 1` (ultimul index). La fiecare pas, folosește `i` pentru a accesa elementul `tablou[i]`.

</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int note[] = {8, 10, 7, 9, 8};
    // sizeof(note) -> returneaza dimensiunea totala in bytes (5 * 4 = 20 bytes)
    // sizeof(note[0]) -> returneaza dimensiunea unui element (4 bytes)
    // 20 / 4 = 5 elemente. O metoda sigura de a calcula dimensiunea.
    int dimensiune = sizeof(note) / sizeof(note[0]);

    printf("Elementele tabloului sunt:\n");

    // Parcurgem tabloul pentru a afisa fiecare element
    for (int i = 0; i < dimensiune; i++) {
        printf("note[%d] = %d\n", i, note[i]);
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

# Citirea Datelor într-un Tablou

:: content ::

Putem folosi aceeași logică cu `for` pentru a citi date de la utilizator și a le stoca secvențial în tablou.

---
layout: cover
---

```c
#include <stdio.h>

#define DIMENSIUNE 5 // O constanta pentru a evita numerele "magice"

int main() {
    int numere[DIMENSIUNE];

    printf("Introduceti %d numere intregi:\n", DIMENSIUNE);

    // Ciclul pentru citirea datelor
    for (int i = 0; i < DIMENSIUNE; i++) {
        printf("numar[%d]: ", i);
        // La fiecare pas, stocam valoarea la adresa elementului curent
        scanf("%d", &numere[i]); 
    }

    printf("\nAti introdus urmatoarele numere:\n");

    // Ciclul pentru afisarea datelor
    for (int i = 0; i < DIMENSIUNE; i++) {
        printf("%d ", numere[i]);
    }
    printf("\n");

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Erori Comune și Atenționări

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Accesarea în Afara Limitelor (Out of Bounds)

:: content ::

Una dintre cele mai periculoase și comune greșeli în C este accesarea unui index care nu există.

**`int tablou[5];`** are indexi valizi de la `0` la `4`.
Ce se întâmplă dacă încercăm să accesăm `tablou[5]` sau `tablou[-1]`?

<div class="ns-c-tight">

-   Limbajul C **NU** vă va opri. Nu există o verificare automată a limitelor.
-   Programul va încerca să citească sau să scrie în zona de memorie de **lângă** tablou.
-   Acest lucru poate duce la:
    -   Coruperea altor variabile.
    -   Citirea unor valori "gunoi" (garbage values).
    -   Prăbușirea programului (Segmentation Fault).
    -   Vulnerabilități de securitate.

</div>
<br/>
<AdmonitionType type="danger">

**Este responsabilitatea exclusivă a programatorului să se asigure că toți indexii folosiți sunt valizi!**
</AdmonitionType>

---
layout: cover
---

```c
#include <stdio.h>

int main() {
    int numere[3] = {10, 20, 30};
    int alta_variabila = 100;

    printf("Valoarea initiala a variabilei: %d\n", alta_variabila);

    // EROARE GRAVA: Scriem in afara limitelor tabloului!
    // Incercam sa scriem la indexul 3, care nu exista (indecsi valizi: 0, 1, 2)
    // Acest cod poate suprascrie memoria unde este stocata 'alta_variabila'
    numere[3] = 999; 

    // Rezultatul este imprevizibil! 'alta_variabila' poate fi acum 999.
    printf("Valoarea finala a variabilei: %d\n", alta_variabila);
    printf("Valoarea 'gunoi' citita de la numere[3]: %d\n", numere[3]);

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

1.  Declară un tablou de `double` cu 5 prețuri predefinite.
2.  Calculează și afișează **suma totală** a prețurilor.
3.  Calculează și afișează **prețul mediu**.

</div>
<br/>

<AdmonitionType type="tip">

Inițializați o variabilă `suma` cu `0.0`. Folosiți un ciclu `for` pentru a parcurge tabloul. La fiecare pas, adăugați elementul curent la `suma`. La final, împărțiți suma la numărul de elemente pentru a obține media.

</AdmonitionType>
<br/>

### Exemplu de output:

```text
Preturile sunt: 10.50 20.00 5.25 15.00 8.75
Suma totala este: 59.50
Pretul mediu este: 11.90
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

<div class="text-base">

Scrieți un program care cere utilizatorului să introducă `N` numere întregi, le stochează într-un tablou, și apoi găsește și afișează **cea mai mare** valoare introdusă.
<div class="ns-c-tight">

1.  Întrebați utilizatorul câte numere dorește să introducă (`N`).
2.  Declarați un tablou de dimensiune `N`.
3.  Citiți `N` numere de la tastatură.
4.  Găsiți și afișați elementul maxim.

</div>
<AdmonitionType type="tip">

Pentru a găsi maximul, inițializați o variabilă `max` cu valoarea **primului element** din tablou (`tablou[0]`). Apoi, parcurgeți restul tabloului (de la indexul 1). Dacă găsiți un element mai mare decât `max`, actualizați `max` cu acea valoare.

</AdmonitionType>

</div>


### Exemplu de interacțiune:

```text
Cate numere doriti sa introduceti? 5
Introduceti numarul 1: 4
Introduceti numarul 2: 18
Introduceti numarul 3: 2
Introduceti numarul 4: 9
Valoarea maxima introdusa este: 18
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
Scrieți un program care citește `N` numere întregi într-un tablou și apoi afișează elementele tabloului în **ordine inversă**.

<br/>
<AdmonitionType type="tip">

După ce ați citit toate elementele, folosiți un nou ciclu `for` pentru a le afișa. Contorul acestui ciclu ar trebui să înceapă de la **ultimul index** (`N-1`) și să scadă (`i--`) până ajunge la `0`.

</AdmonitionType>

<br/>

### Exemplu de interacțiune:

```text
Cate numere doriti sa introduceti? 4
Introduceti numarul 1: 10
Introduceti numarul 2: 20
Introduceti numarul 3: 30
Introduceti numarul 4: 40

Elementele in ordine inversa: 40 30 20 10 
```