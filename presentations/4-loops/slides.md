---
transition: slide-left
layout: cover
color: stone-light
---

### Cicluri (Bucle) în C
#### `while`, `do-while`, `for`

---
layout: cover
color: stone-light
---

## De ce avem nevoie să repetăm acțiuni?

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Puterea Repetiției

:: content ::

Imaginați-vă că trebuie să afișați "Hello, World!" de 5 ori. Fără cicluri, ați scrie:

```c
printf("Hello, World!\n");
printf("Hello, World!\n");
printf("Hello, World!\n");
printf("Hello, World!\n");
printf("Hello, World!\n");
```

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-[var(--neversink-text-color)] text-center">

**Ce se întâmplă dacă trebuie să o facem de 1000 de ori?**

<p class="mt-2">Copierea și lipirea codului este ineficientă, greu de întreținut și predispusă la erori.</p>
</div>
<br/>

**Ciclurile** (sau buclele) ne permit să executăm un bloc de cod de mai multe ori, atâta timp cât o anumită condiție este îndeplinită. Ele sunt fundamentale pentru automatizarea sarcinilor repetitive.

---
transition: slide-left
layout: cover
color: stone-light
---

## Ciclul `while`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `while` - Cât Timp Condiția e Adevărată

:: content ::

Ciclul `while` este cel mai simplu tip de buclă. El repetă un bloc de cod atâta timp cât o condiție specificată este adevărată.

<div class="ns-c-tight">

- **Verificarea condiției** se face **înainte** de fiecare execuție a blocului de cod.
- Dacă condiția este falsă de la început, blocul de cod nu se va executa **niciodată**.
- Este esențial ca în interiorul ciclului să existe o logică ce, la un moment dat, va face condiția falsă, pentru a evita un **ciclu infinit**.

</div>

<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>
```c
while (condiție) {
    // cod care se execută repetat
    // ...
    // actualizarea variabilei din condiție
}
```
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    // Initializam o variabila contor
    int i = 1;

    // Cat timp i este mai mic sau egal cu 5
    while (i <= 5) {
        printf("Numarul este: %d\n", i);
        
        // CRUCIAL: Incrementam contorul.
        // Fara aceasta linie, i ar ramane mereu 1,
        // conditia i <= 5 ar fi mereu adevarata,
        // si am avea un ciclu infinit!
        i++; // Echivalent cu i = i + 1;
    }

    printf("Am iesit din ciclu.\n");

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `while` - Suma numerelor

:: content ::


```c {monaco-run}
#include <stdio.h>

int main() {
    int n = 10;
    int suma = 0;
    int i = 1; // Contorul porneste de la 1

    while (i <= n) {
        // Adauga valoarea curenta a lui 'i' la suma
        suma += i; // Echivalent cu suma = suma + i;
        
        // Treci la urmatorul numar
        i++;
    }

    printf("Suma numerelor de la 1 la %d este: %d\n", n, suma);

    return 0;
}
```

---
align: c
layout: cover
color: stone-light
---

## Ciclul `do-while`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `do-while` - Execută cel Puțin O Dată

:: content ::

Ciclul `do-while` este o variație a ciclului `while`. Diferența majoră este că **verificarea condiției** se face la **sfârșitul** fiecărei iterații, nu la început.

<div class="ns-c-tight">

- Acest lucru garantează că blocul de cod din interiorul ciclului se va executa **cel puțin o dată**, indiferent dacă condiția este adevărată sau falsă de la început.
- Este ideal pentru situații în care trebuie să efectuăm o acțiune și abia apoi să decidem dacă o repetăm, cum ar fi validarea datelor introduse de utilizator.

</div>
<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>
```c
do {
    // cod care se execută cel puțin o dată
    // ...
} while (condiție); // Atentie la ';' de la final!
```
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `do-while` - Validarea Input-ului

:: content ::

Să cerem utilizatorului să introducă un număr pozitiv. Dacă introduce un număr negativ sau zero, îi vom cere din nou, până când introduce o valoare validă.

---
layout: cover
---

```c 
#include <stdio.h>

int main() {
    int numar;

    do {
        // Acest bloc se executa cel putin o data
        printf("Introduceti un numar strict pozitiv: ");
        scanf("%d", &numar);

        if (numar <= 0) {
            printf("Valoare invalida. Incercati din nou.\n");
        }

    } while (numar <= 0); // Repeta ciclul CAT TIMP numarul este invalid

    printf("Ati introdus numarul valid: %d\n", numar);

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Ciclul `for`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `for` - Ciclul cu Contor

:: content ::

Ciclul `for` este ideal pentru situațiile în care știm (sau putem calcula) exact de câte ori trebuie să se execute un bloc de cod. Este cel mai des utilizat ciclu în C.

Sintaxa sa combină trei elemente esențiale într-o singură linie:

<div class="ns-c-tight">

1.  **Inițializarea**: O expresie executată **o singură dată**, la începutul ciclului. De obicei, aici se declară și se inițializează o variabilă contor.
2.  **Condiția**: O expresie evaluată **înainte** de fiecare iterație. Cât timp este adevărată, ciclul continuă.
3.  **Actualizarea (Incrementarea/Decrementarera)**: O expresie executată la **sfârșitul** fiecărei iterații. De obicei, modifică variabila contor.

</div>
<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Sintaxă</h3>

```c
for (initializare; conditie; actualizare) {
    // cod care se execută repetat
}
```
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    // 1. initializare: int i = 1
    // 2. conditie: i <= 5
    // 3. actualizare: i++ (se executa dupa fiecare afisare)
    for (int i = 1; i <= 5; i++) {
        printf("i = %d\n", i);
    }
    
    printf("\nNumaratoare inversa:\n");
    // Putem si decrementa
    for (int j = 5; j >= 1; j--) {
        printf("j = %d\n", j);
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

# `for` - Tabla Înmulțirii

:: content ::

Să generăm tabla înmulțirii pentru un număr dat, de la 1 la 10.

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int numar = 2;

    for (int i = 1; i <= 10; i++) {
        // %2d asigura alinierea numerelor pe 2 cifre
        printf("%d * %2d = %d\n", numar, i, numar * i);
    }

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---

## Controlul Execuției Ciclurilor

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `break` și `continue`

:: content ::

Uneori, avem nevoie de mai mult control asupra modului în care un ciclu rulează. `break` și `continue` ne permit să alterăm fluxul normal de execuție.

<div class="grid grid-cols-2 gap-8 mt-4">
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">`break`</h3>
    <div class="text-sm mt-2">

  **Iese forțat** din cel mai apropiat ciclu (`while`, `do-while`, `for`) sau `switch` în care se află. Execuția programului continuă cu prima instrucțiune de după ciclu. Este ca și cum ai apăsa un buton de oprire de urgență.

  </div>
  </div>
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">`continue`</h3>
    <div class="text-sm mt-2">

  **Sare peste restul codului** din iterația curentă și trece direct la următoarea iterație a ciclului. Verificarea condiției și actualizarea contorului (în cazul `for`) se execută normal.

  </div>
  </div>
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# `break` - Găsirea Primului Divizor

:: content ::

Să căutăm primul număr (mai mare ca 1) care divide un număr dat `N`. Odată ce l-am găsit, nu mai are rost să continuăm căutarea, deci folosim `break` pentru a opri ciclul.

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int n = 91; 

    printf("Cautam primul divizor al lui %d (diferit de 1)...\n", n);

    // Incepem cautarea de la 2
    for (int i = 2; i < n; i++) {
        // Daca restul impartirii este 0, am gasit un divizor
        if (n % i == 0) {
            printf("Primul divizor gasit este: %d\n", i);
            break; // Iesim din ciclu. Nu mai cautam.
        }
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

# `continue` - Afișarea Numerelor Impare

:: content ::

Să afișăm toate numerele de la 1 la 10, dar să sărim peste cele pare folosind `continue`.

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    printf("Numerele impare de la 1 la 10:\n");

    for (int i = 1; i <= 10; i++) {
        // Daca numarul este par...
        if (i % 2 == 0) {
            continue; // ...sari peste printf si treci la urmatoarea iteratie
        }

        // Acest cod se executa doar pentru numerele impare
        printf("%d ", i);
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

## Cicluri Imbricate (Nested Loops)

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Cicluri în Interiorul Altor Cicluri

:: content ::

Putem plasa un ciclu în interiorul altui ciclu. Acest lucru este util pentru a lucra cu structuri bidimensionale, cum ar fi tabele sau grile.

<div class="ns-c-tight">

- Ciclul exterior controlează rândurile.
- Ciclul interior controlează coloanele.
- Pentru **fiecare** iterație a ciclului exterior, ciclul interior se va executa **complet** (de la început până la sfârșit).

</div>
<br/>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)]">
<h3 class="font-bold text-center text-[var(--neversink-text-color)]">Exemplu: Afișarea unui dreptunghi</h3>

Să desenăm un dreptunghi de `L` lățime și `H` înălțime folosind un caracter.

</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int inaltime = 4;
    int latime = 10;
    char simbol = '*';

    // Ciclul exterior - itereaza prin randuri
    for (int i = 1; i <= inaltime; i++) {
        
        // Ciclul interior - itereaza prin coloane pentru randul curent
        for (int j = 1; j <= latime; j++) {
            printf("%c ", simbol);
        }
        
        // Dupa ce am terminat un rand intreg, trecem la o linie noua
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
Scrieți un program care afișează toate numerele pare de la 1 până la un număr `N` introdus de utilizator.

<br/>

<AdmonitionType type="tip">

Puteți folosi un ciclu `for` care iterează de la 1 la `N`. În interiorul ciclului, folosiți o instrucțiune `if` pentru a verifica dacă numărul curent este par (`numar % 2 == 0`).

</AdmonitionType>
<br/>

### Exemplu de interacțiune:

```text
Introduceti un numar (N): 10
Numerele pare pana la 10 sunt: 2 4 6 8 10 
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
Scrieți un program care calculează **factorialul** unui număr `N` introdus de la tastatură.

Factorialul unui număr `N` (notat `N!`) este produsul tuturor numerelor întregi pozitive de la 1 la `N`.
`5! = 1 * 2 * 3 * 4 * 5 = 120`

<div class="ns-c-tight">

1.  Cereți utilizatorului un număr `N`.
2.  Inițializați o variabilă pentru rezultat (de exemplu, `factorial`) cu valoarea `1`.
3.  Folosiți un ciclu `for` care merge de la 1 la `N`.
4.  În interiorul ciclului, înmulțiți rezultatul curent cu valoarea contorului.
5.  Afișați rezultatul final.

</div>

### Exemplu de interacțiune:
```text
Introduceti un numar: 5
Factorialul lui 5 este: 120
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
Scrieți un program care primește un număr întreg și afișează **suma cifrelor** sale.

<AdmonitionType type="tip">

Folosiți un ciclu `while` care se execută atâta timp cât numărul este mai mare ca 0.
În interiorul ciclului:
1.  Extrageți ultima cifră folosind operatorul modulo: `cifra = numar % 10`.
2.  Adăugați cifra la o variabilă `suma`.
3.  Eliminați ultima cifră din număr folosind împărțirea întreagă: `numar = numar / 10`.

</AdmonitionType>

<br/>

### Exemplu de interacțiune:
```text
Introduceti un numar intreg: 472
Suma cifrelor este: 13
// 4 + 7 + 2 = 13
```