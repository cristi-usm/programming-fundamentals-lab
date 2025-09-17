---
transition: slide-left
layout: cover
color: stone-light
---

### Instrucțiuni Condiționale
#### `if`, `else`, `switch`

---
layout: cover
color: stone-light
---

## De ce avem nevoie de decizii în cod?

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Fluxul de Execuție

:: content ::

Până acum, programele noastre au rulat **secvențial**. Fiecare instrucțiune a fost executată în ordinea în care a fost scrisă, de sus în jos, fără excepție.

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

**Dar viața reală este plină de decizii!**
<p class="mt-2">"Dacă plouă, iau umbrela. Altfel, iau ochelarii de soare."</p>
</div>

<br/>

Instrucțiunile condiționale ne permit să controlăm **fluxul de execuție** al programului. Putem alege ce blocuri de cod să se execute (sau să fie omise) în funcție de anumite condiții.

---
transition: slide-left
layout: cover
color: stone-light
---

## Instrucțiunea `if`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `if` - Cea mai Simplă Decizie

:: content ::

Instrucțiunea `if` este folosită pentru a executa un bloc de cod doar **dacă o anumită condiție este adevărată**.

<div class="ns-c-tight">

- Condiția este o expresie (de obicei relațională sau logică) care se evaluează la o valoare.
- În C, orice valoare diferită de **`0`** este considerată **adevărată** (`true`).
- Valoarea **`0`** este considerată **falsă** (`false`).

</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>
```c
if (condiție) {
    // codul care se execută dacă condiția este adevărată <br/>
}
```
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int varsta = 10;

    // Daca varsta este 18 sau mai mare
    if (varsta >= 18) {
        printf("Aveți majoratul.\n");
        printf("Aveti drept de vot.\n");
    }

    printf("Programul a ajuns la final.\n");

    return 0;
}
```

<AdmonitionType type="tip">

Modificați valoarea variabilei vârsta și observați cum se modifică mesajul afișat.

</AdmonitionType>

---
transition: slide-left
layout: cover
color: stone-light
---

## Instrucțiunea `if-else`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `if-else` - O Decizie cu Alternativă

:: content ::

Instrucțiunea `if-else` ne permite să executăm un bloc de cod dacă o condiție este adevărată și **un alt bloc de cod** dacă acea condiție este falsă.

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>
```c
if (condiție) {
    // Bloc "adevărat": se execută dacă condiția e true
} else {
    // Bloc "fals": se execută dacă condiția e false
}
```
</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-bg-code-color)] p-4 rounded-lg text-center">

Se garantează că **exact unul** dintre cele două blocuri va fi executat, niciodată ambele și niciodată niciunul.
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int numar = 2;

    // Verificam restul impartirii la 2
    if (numar % 2 == 0) {
        printf("Numarul %d este PAR.\n", numar);
    } else {
        printf("Numarul %d este IMPAR.\n", numar);
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

# `if-else if-else` - Decizii Multiple

:: content ::

Când avem mai mult de două posibilități, putem înlănțui mai multe condiții folosind `else if`.

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>

```c
if (condiția 1) { 
    // se execută dacă condiția 1 este true 
} else if (condiția 2) { 
    // se execută dacă condiția 1 e false ȘI condiția 2 e true <br/>
} else {
    // se execută dacă toate condițiile de mai sus sunt false <br/>
}
```

</div>

<br/>
<AdmonitionType type="info">

Blocul `else` final este opțional. Compilatorul verifică condițiile în ordine și execută **primul** bloc de cod pentru care condiția este adevărată, apoi iese din întreaga structură.

</AdmonitionType>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int nota = 2;

    if (nota == 10) {
        printf("Excelent!\n");
    } else if (nota >= 8) { // Daca nu e 10, verifica daca e >= 8
        printf("Foarte bine!\n");
    } else if (nota >= 5) { // Daca nu e nici >= 8, verifica daca e >= 5
        printf("Promovat.\n");
    } else { // Daca niciuna de mai sus nu e adevarata
        printf("Nepromovat.\n");
    }

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Instrucțiunea `switch`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `switch` - O Alternativă pentru `if-else if`

:: content ::

Instrucțiunea `switch` este o alternativă elegantă la un lanț lung de `if-else if` atunci când vrem să comparăm o singură variabilă cu mai multe valori constante posibile.

<div class="ns-c-tight">

- Funcționează doar cu tipuri de date întregi (`int`, `char`).
- **`case`**: Specifică o valoare constantă cu care se compară variabila.
- **`break`**: Este **crucial**! Oprește execuția și iese din blocul `switch`. Fără el, execuția "cade" la următorul `case` (fallthrough).
- **`default`**: Similar cu `else`, acest bloc se execută dacă niciun `case` nu s-a potrivit. Este opțional.

</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>
int main() {
    int zi = 4;
    switch (zi) {
        case 1:
            printf("Luni\n");
            break; // Opreste executia aici
        case 2:
            printf("Marti\n");
            break;
        case 3:
            printf("Miercuri\n");
            break;
        case 4:
            printf("Joi\n");
            break;
        case 5:
            printf("Vineri\n");
            break;
        case 6:
        case 7: // Exemplu de "fallthrough" - acelasi cod pentru mai multe cazuri
            printf("Weekend!\n");
            break;
        default: // Daca 'zi' nu este intre 1 si 7
            printf("Valoare invalida!\n");
            break;
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

# Operatorul Ternar `? :`

:: content ::

Operatorul ternar este o formă prescurtată, compactă, a unei instrucțiuni `if-else` care returnează o valoare.

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>
<p class="font-mono mt-2 text-lg text-center">
variabila = (condiție) ? valoare_daca_true : valoare_daca_false;
</p>
</div>

<br/>

<div class="neversink-stone-light-scheme grid grid-cols-2 gap-4 mt-4 text-center">
  <div>
    <h4 class="font-bold">
    
Varianta `if-else`
</h4>

<div class="text-left">

```c
int a = 10, b = 20, max;
if (a > b) {
    max = a;
} else {
    max = b;
}
```

  </div>
  </div>
  <div>
    <h4 class="font-bold">Varianta Ternară</h4>
    <br/>
<div class="text-left">

```c
int a = 10, b = 20;
int max = (a > b) ? a : b;
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

# `if`-uri Imbricate (Nested)

:: content ::

Putem plasa o structură `if-else` în interiorul altei structuri `if` sau `else`. Acest lucru ne permite să creăm logici mai complexe.

<AdmonitionType type="warning">

Atenție la lizibilitate! Prea multe niveluri de imbricare pot face codul foarte greu de citit și de depanat (debugged).

</AdmonitionType>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int varsta = 20;
    int are_bilet = 1; // 1 inseamna true

    // Poate intra la film?
    if (varsta >= 18) {
        printf("Are varsta legala. Acum verificam biletul...\n");

        // if imbricat
        if (are_bilet == 1) {
            printf("Acces permis. Vizionare placuta!\n");
        } else {
            printf("Acces refuzat. Nu aveti bilet.\n");
        }
        
    } else {
        printf("Acces refuzat. Sunteti minor.\n");
    }

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
Scrieți un program care cere utilizatorului să introducă un număr. Programul va afișa dacă numărul este **pozitiv**, **negativ** sau **zero**.

<br/>
<br/>

### Exemplu de interacțiune:
```text
Introduceti un numar: -5
Numarul este negativ.
```

```text
Introduceti un numar: 0
Numarul este zero.
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

Scrieți un program care determină dacă un an, introdus de la tastatură, este an bisect.

Un an este bisect dacă îndeplinește una dintre următoarele condiții:

<div class="ns-c-tight">

- Este divizibil cu 4, DAR NU este divizibil cu 100.
- Este divizibil cu 400.

</div>
<br/>
<AdmonitionType type="tip">
Folosiți operatorii modulo (%) și logici (&amp;&amp;, ||). Condiția completă ar putea arăta astfel: (an % 4 == 0 &amp;&amp; an % 100 != 0) || (an % 400 == 0)
</AdmonitionType>

<br/>

### Exemple de interacțiune:

```text
Introduceti anul: 2024
2024 este an bisect.
```

```text
Introduceti anul: 1900
1900 nu este an bisect.
```

```text
Introduceti anul: 2000
2000 este an bisect.
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

Scrieți un program care funcționează ca un mini-calculator. Programul trebuie să:

<div class="ns-c-tight">

- Ceară utilizatorului să introducă primul număr (float).
- Ceară utilizatorului să introducă un operator (+, -, *, /). Acesta va fi citit ca un caracter (char).
- Ceară utilizatorului să introducă al doilea număr (float).
- Folosind o instrucțiune switch bazată pe operator, să calculeze și să afișeze rezultatul.
- Să includă un caz special pentru împărțirea la zero.

</div>
<br/>

### Exemplu de interacțiune:

```text
Introduceti expresia (ex: 10 * 5): 10 * 5
Rezultatul este: 50.00
```

```text
Introduceti expresia (ex: 10 * 5): 8 / 0
Eroare: Impartirea la zero nu este permisa.
```