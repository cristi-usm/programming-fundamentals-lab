---
transition: slide-left
layout: cover
color: stone-light
---

### Tablouri Multidimensionale în C

#### Organizarea datelor în grile și structuri complexe

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Dincolo de o Singură Dimensiune

:: content ::

Până acum, am lucrat cu tablouri **unidimensionale** - o singură listă de elemente, ca un rând într-un tabel.

```c
int note[] = {8, 10, 7, 9, 8};
```

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

**Dar ce se întâmplă când datele noastre sunt structurate mai complex?**

<p class="mt-2">Gândiți-vă la o tablă de șah, o imagine digitală (pixeli pe rânduri și coloane), sau un tabel cu notele mai multor studenți la mai multe materii.</p>
</div>

<br/>

**Tablourile multidimensionale** ne permit să stocăm datele într-o structură de tip grilă, cu rânduri și coloane, sau chiar cu mai multe dimensiuni.

---
transition: slide-left
layout: cover
color: stone-light
---

## Tablouri Bidimensionale (2D)

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Ce este un Tablou Bidimensional?

:: content ::

Un tablou bidimensional (2D), cunoscut și sub numele de **matrice**, este, în esență, un **tablou de tablouri**. Îl putem vizualiza ca pe un tabel sau o grilă cu rânduri și coloane.

<div class="ns-c-tight">

-   **Prima dimensiune** reprezintă **numărul de rânduri**.
-   **A doua dimensiune** reprezintă **numărul de coloane**.

</div>

<br/>

<style>
.matrix-container {
  font-family: monospace;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
}
.matrix-row {
  display: flex;
}
.matrix-cell {
  width: 70px;
  height: 50px;
  border: 2px solid var(--neversink-border-color);
  background-color: var(--neversink-bg-code-color);
  color: var(--neversink-fg-code-color);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.2em;
  margin: 2px;
  position: relative;
}
.matrix-index {
  position: absolute;
  top: -20px;
  left: 0;
  font-size: 0.8em;
  color: var(--neversink-text-color);
  width: 100%25;
  text-align: center;
}
.row-label {
    font-size: 0.8em;
    color: var(--neversink-text-color);
    margin-right: 10px;
    align-self: center;
}
</style>

<div class="matrix-container neversink-indigo-light-scheme">
  <div class="matrix-row">
    <div class="row-label"></div>
    <div class="matrix-cell" style="border: none; background: none;"><span class="matrix-index">Col 0</span></div>
    <div class="matrix-cell" style="border: none; background: none;"><span class="matrix-index">Col 1</span></div>
    <div class="matrix-cell" style="border: none; background: none;"><span class="matrix-index">Col 2</span></div>
  </div>
  <div class="matrix-row">
    <div class="row-label">Rând 0</div>
    <div class="matrix-cell">10</div>
    <div class="matrix-cell">20</div>
    <div class="matrix-cell">30</div>
  </div>
  <div class="matrix-row">
    <div class="row-label">Rând 1</div>
    <div class="matrix-cell">40</div>
    <div class="matrix-cell">50</div>
    <div class="matrix-cell">60</div>
  </div>
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Declararea și Inițializarea Tablourilor 2D

:: content ::

Pentru a declara un tablou 2D, specificăm tipul de date, numele și dimensiunile pentru rânduri și coloane.

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>

```c

tip_de_data nume_tablou[NUMAR_RANDURI][NUMAR_COLOANE];

```
</div>

Putem inițializa un tablou 2D la declarare folosind acolade imbricate, unde fiecare set intern de acolade reprezintă un rând.

```c
// O matrice de 2 randuri si 3 coloane
int matrice[2][3] = {
    {10, 20, 30},  // Primul rand (index 0)
    {40, 50, 60}   // Al doilea rand (index 1)
};
// Putem omite numarul de randuri, dar NU si numarul de coloane
int matrice_auto[][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
}; // Compilatorul stie ca sunt 3 randuri
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Cum sunt Stocate în Memorie?

:: content ::

Chiar dacă le vizualizăm ca pe o grilă, în memoria computerului, tablourile 2D sunt stocate **liniar**, rând după rând.

Matricea `int matrice[2][3]` arată în memorie astfel:

<style>
.memory-container-2d {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 2px;
  background-color: var(--neversink-bg-color);
  padding: 20px;
  border-radius: 8px;
  border: 1px solid var(--neversink-border-color);
  font-family: monospace;
}
.memory-box-2d {
  background-color: var(--neversink-bg-code-color);
  border: 2px solid var(--neversink-border-color);
  padding: 10px;
  width: 60px;
  text-align: center;
  border-radius: 4px;
  color: var(--neversink-fg-code-color);
  position: relative;
}
.memory-box-2d .value {
  font-size: 1.5em;
  font-weight: bold;
}
.memory-box-2d .address-2d {
  font-size: 0.8em;
  opacity: 0.7;
  color: var(--neversink-text-color);
  position: absolute;
  bottom: -25px;
  width: 100%25;
  left: 0;
}
</style>

<div class="memory-container-2d neversink-indigo-light-scheme mt-8">
  <div class="memory-box-2d">
    <div class="value">10</div>
    <div class="address-2d">[0][0]</div>
  </div>
  <div class="memory-box-2d">
    <div class="value">20</div>
    <div class="address-2d">[0][1]</div>
  </div>
  <div class="memory-box-2d">
    <div class="value">30</div>
    <div class="address-2d">[0][2]</div>
  </div>
  <div class="memory-box-2d" style="background-color: #a5b4fc;">
    <div class="value">40</div>
    <div class="address-2d">[1][0]</div>
  </div>
  <div class="memory-box-2d" style="background-color: #a5b4fc;">
    <div class="value">50</div>
    <div class="address-2d">[1][1]</div>
  </div>
  <div class="memory-box-2d" style="background-color: #a5b4fc;">
    <div class="value">60</div>
    <div class="address-2d">[1][2]</div>
  </div>
</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

Primul rând este stocat complet, urmat de al doilea rând, și așa mai departe. Acest concept se numește **"row-major order"**.

</div>

---
transition: slide-left
layout: cover
color: stone-light
---

## Lucrul cu Tablouri Bidimensionale

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Accesarea și Parcurgerea cu Cicluri Imbricate

:: content ::

Pentru a accesa un element, avem nevoie de doi indexi: `matrice[index_rand][index_coloana]`.

Cea mai comună metodă de a parcurge o matrice este folosind **cicluri `for` imbricate**:

<div class="ns-c-tight">

-   **Ciclul exterior** iterează prin **rânduri** (de la `0` la `NUMAR_RANDURI - 1`).
-   **Ciclul interior** iterează prin **coloane** (de la `0` la `NUMAR_COLOANE - 1`).

</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">
Pentru fiecare rând, ciclul interior parcurge toate coloanele acelui rând.
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int matrice[2][3] = {
        {10, 20, 30},
        {40, 50, 60}
    };

    // Ciclul exterior pentru randuri (i)
    for (int i = 0; i < 2; i++) {
        // Ciclul interior pentru coloane (j)
        for (int j = 0; j < 3; j++) {
            printf("matrice[%d][%d] = %d\n", i, j, matrice[i][j]);
        }
        printf("\n"); // Linie noua dupa fiecare rand pentru claritate
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

# Exemplu: Citirea unei Matrici de la Tastatură

:: content ::

Folosim aceeași structură de cicluri imbricate pentru a citi valorile unei matrici de la utilizator.

---
layout: cover
---

```c
#include <stdio.h>

#define RANDURI 2
#define COLOANE 3

int main() {
    int matrice[RANDURI][COLOANE];

    printf("Introduceti elementele pentru o matrice de %25d x %25d:\n", RANDURI, COLOANE);

    // Citirea matricii
    for (int i = 0; i < RANDURI; i++) {
        for (int j = 0; j < COLOANE; j++) {
            printf("Elementul [%d][%d]: ", i, j);
            scanf("%d", &matrice[i][j]);
        }
    }

    printf("\nMatricea introdusa este:\n");

    // Afisarea matricii
    for (int i = 0; i < RANDURI; i++) {
        for (int j = 0; j < COLOANE; j++) {
            printf("%d\t", matrice[i][j]); // \t adauga un tab pentru aliniere
        }
        printf("\n");
    }

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Tablouri N-Dimensionale

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Mai Mult de Două Dimensiuni

:: content ::

Limbajul C nu ne limitează la două dimensiuni. Putem declara tablouri cu trei, patru sau mai multe dimensiuni, deși cazurile de utilizare devin mai specializate.

Un **tablou tridimensional (3D)** poate fi vizualizat ca un cub sau o colecție de mai multe tablouri 2D.

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă 3D</h3>

```c
tip_de_data nume_tablou[PAGINI][RANDURI][COLOANE];
```
</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-bg-code-color)] p-4 rounded-lg text-center">

Pentru a parcurge un tablou 3D, am avea nevoie de **trei cicluri `for` imbricate**.

</div>

<br/>

---
layout: cover
align: c
color: stone-light
---

<AdmonitionType type="info">

# Exemple de utilizare pentru tablouri 3D:
<div class="ns-c-tight text-2xl">

- Stocarea datelor pentru un cub Rubik.
- Reprezentarea unui spațiu 3D într-un joc video simplu (voxeli).
- Stocarea mai multor imagini (cadrele unui video).

</div>

</AdmonitionType>

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

1.  Declară și inițializează o matrice de 3x3 `int`.
2.  Calculează și afișează **suma tuturor elementelor** din matrice.

</div>

<br/>

<AdmonitionType type="tip">

Inițializați o variabilă `suma` cu `0`. Folosiți două cicluri `for` imbricate pentru a parcurge matricea. La fiecare pas, adăugați elementul curent `matrice[i][j]` la `suma`.

</AdmonitionType>

<br/>

### Exemplu de output:
```text
Matricea este:
1 2 3
4 5 6
7 8 9
Suma totala a elementelor este: 45
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

Scrieți un program care:

<div class="ns-c-tight">

1.  Cere utilizatorului să introducă elementele unei matrici de 3x3.
2.  Calculează și afișează **suma elementelor de pe diagonala principală**.

</div>

<AdmonitionType type="tip">

Diagonala principală este formată din elementele unde indexul rândului este egal cu indexul coloanei: `matrice[0][0]`, `matrice[1][1]`, `matrice[2][2]`, etc. Puteți folosi cicluri imbricate și o condiție `if (i == j)` în interior pentru a aduna doar aceste elemente.

</AdmonitionType>

### Exemplu de interacțiune:
```text
Introduceti elementele pentru o matrice de 3 x 3:
... (utilizatorul introduce 9 numere) ...
Matricea introdusa este:
1 2 3
4 5 6
7 8 9
Suma elementelor de pe diagonala principala este: 15
// 1 + 5 + 9 = 15
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
Scrieți un program care:

<div class="ns-c-tight">

1.  Definește o matrice de 2x4.
2.  Umple matricea cu valori citite de la tastatură.
3.  Cere utilizatorului să introducă un număr (`x`).
4.  Caută numărul `x` în matrice. Dacă îl găsește, afișează rândul și coloana unde a fost găsit pentru prima dată și se oprește. Dacă nu, afișează un mesaj corespunzător.

</div>

<AdmonitionType type="tip">

Folosiți o variabilă "flag" (de ex. `gasit = 0`). Parcurgeți matricea. Dacă `matrice[i][j] == x`, setați `gasit = 1`, afișați coordonatele `i` și `j`, apoi folosiți `break` pentru a ieși din ciclul interior și, eventual, din cel exterior. După cicluri, verificați valoarea flag-ului pentru a afișa mesajul final.

</AdmonitionType>

### Exemplu de interacțiune:
```text
... (utilizatorul introduce 8 numere) ...
Ce numar doriti sa cautati? 7
Numarul 7 a fost gasit la pozitia [1][2].
```