---
transition: slide-left
layout: cover
color: stone-light
---

### Tipuri de Date. Operatori & Operanzi.


---
layout: cover
color: stone-light
---

# Ce sunt Tipurile de Date?


---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Tipuri de Date Fundamentale

:: content ::

Un **tip de dată** specifică ce fel de valoare poate stoca o variabilă și ce operații se pot efectua asupra acelei valori. Este o regulă pe care o impunem "cutiei" noastre (variabilei) pentru a ne asigura că stocăm în ea doar informații de un anumit fel.

<br/>

<div class="grid grid-cols-2 gap-4 mt-4">
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg text-center">
    <h3 class="text-lg font-bold text-[var(--neversink-text-color)]">Tipuri Întregi</h3>
    <div class="text-sm mt-2">
    Folosite pentru numere întregi, fără zecimale.
    <p class="font-mono mt-2 text-[var(--neversink-fg-code-color)]">int, short, long, char</p>
    </div>
  </div>
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg text-center">
    <h3 class="text-lg font-bold text-[var(--neversink-text-color)]">Tipuri Reale (Floating-Point)</h3>
    <div class="text-sm mt-2">
    Folosite pentru numere care pot avea zecimale.
    <p class="font-mono mt-2 text-[var(--neversink-fg-code-color)]">float, double</p>
    </div>
  </div>
</div>

<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] mt-4">

Alegerea corectă a tipului de dată este esențială pentru a scrie programe **eficiente** ca memorie și **corecte** din punct de vedere logic.
</div>


---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Tipuri de Date Întregi

:: content ::

Acestea sunt folosite pentru a stoca numere întregi. Diferența principală constă în cantitatea de memorie pe care o ocupă și, prin urmare, intervalul de valori pe care îl pot reprezenta.

<div class="neversink-stone-light-scheme">

| **Tip**       | **Dimensiune (tipică)** | **Interval de Valori (aproximativ)**                            | **Specificator `printf`/`scanf`** |
|-----------|---------------------|-------------------------------------------------------------|-------------------------------|
| `char`    | 1 byte              | -128 la 127 sau 0 la 255                                    | `%c` (ca și caracter)         |
| `int`     | 4 bytes             | -2 miliarde la +2 miliarde                                  | `%d`                          |
| `short`   | 2 bytes             | -32,768 la 32,767                                           | `%hd`                         |
| `long`    | 4 sau 8 bytes       | Depinde de sistem                                           | `%ld`                         |
| `long long`| 8 bytes            | -9 trilioane la +9 trilioane                                | `%lld`                        |

</div>

---
layout: center
---

<AdmonitionType type="tip">

# **`char`** este un tip întreg special. Deși stochează un număr (codul ASCII), este folosit cel mai des pentru a reprezenta un singur caracter.

</AdmonitionType>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Tipuri de Date Reale

:: content ::

Aceste tipuri sunt folosite când avem nevoie de precizie zecimală.

<div class="neversink-stone-light-scheme">

| **Tip**       | **Dimensiune (tipică)** | **Precizie Zecimală**  | **Specificator `printf`/`scanf`** |
|-----------|---------------------|--------------------|-------------------------------|
| `float`   | 4 bytes             | ~7 cifre zecimale  | `%f`                          |
| `double`  | 8 bytes             | ~15 cifre zecimale | `%lf` (doar în `scanf`) / `%f`|

</div>
<br/>
<AdmonitionType type="warning">

Pentru `scanf`, este important să folosim `%f` pentru `float` și `%lf` pentru `double`. Pentru `printf`, `%f` funcționează pentru ambele, deoarece `float`-urile sunt promovate automat la `double` atunci când sunt transmise funcției.

</AdmonitionType>

---
transition: slide-left
layout: cover
color: stone-light
---

## Formatarea Afișării cu `printf`

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Mai Mult Decât Afișare Simplă

:: content ::

Funcția `printf` este extrem de puternică și nu se limitează doar la afișarea textului și a variabilelor. Putem controla cu precizie **cum** arată datele noastre la afișare.

Acest lucru este esențial pentru a crea un output curat, aliniat și ușor de citit, cum ar fi tabele sau rapoarte.

<br/>

**Putem controla:**
<div class="ns-c-tight">

- **Lățimea câmpului**: Cât de mult spațiu ocupă un număr sau un text.
- **Precizia**: Câte zecimale să fie afișate pentru numerele reale.
- **Alinierea**: Aliniere la stânga sau la dreapta în cadrul câmpului.
- **Completarea cu zerouri**: Afișarea zerourilor la începutul unui număr.

</div>

<br/>
<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-4 rounded-lg border border-[var(--neversink-admon-border-color)] text-center">
Sintaxa generală a unui specificator de format este:
<p class="font-mono text-lg mt-2 text-[var(--neversink-text-color)]">%[steaguri][lățime][.precizie]tip</p>
</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Controlul Lățimii și Alinierii

:: content ::

Putem specifica un număr întreg după `%` pentru a rezerva un număr minim de caractere pentru afișare. Implicit, alinierea este la dreapta. Folosind steagul `-` (minus), forțăm alinierea la stânga.


---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int numar1 = 12;
    int numar2 = 345;
    int numar3 = 6789;

    printf("--- Aliniere la Dreapta (Implicit) ---\n");
    // Rezerva 6 caractere pentru fiecare numar
    printf("Numar: |%6d|\n", numar1);
    printf("Numar: |%6d|\n", numar2);
    printf("Numar: |%6d|\n", numar3);

    printf("\n--- Aliniere la Stanga (cu '-') ---\n");
    // Rezerva 6 caractere, aliniate la stanga
    printf("Numar: |%-6d|\n", numar1);
    printf("Numar: |%-6d|\n", numar2);
    printf("Numar: |%-6d|\n", numar3);

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Controlul Preciziei (pentru `float`/`double`)

:: content ::

Pentru numerele reale, putem controla câte zecimale sunt afișate folosind `.precizie`. Implicit, `printf` afișează 6 zecimale pentru `%f`.

Putem combina lățimea totală cu precizia. De exemplu, `%10.2f` înseamnă o lățime totală de 10 caractere, cu exact 2 caractere după punctul zecimal.

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    double pi = 3.14159265;

    // Afisare implicita (6 zecimale)
    printf("Implicit: %f\n", pi);

    // Afisare cu 2 zecimale
    printf("Cu 2 zecimale: %.2f\n", pi);
    
    // Afisare cu 4 zecimale
    printf("Cu 4 zecimale: %.4f\n", pi);

    // Afisare cu 0 zecimale (rotunjit)
    printf("Cu 0 zecimale: %.0f\n", pi);

    printf("\n--- Combinat: Latime 10, Precizie 2 ---\n");
    printf("Pret: |%10.2f|\n", 49.99);
    printf("Pret: |%10.2f|\n", 123.50);

    return 0;
}
```

---
transition: slide-left
layout: cover
color: stone-light
---



## Operatori și Operanzi

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Ce sunt Operatorii?

:: content ::

Un **operator** este un simbol care îi spune compilatorului să efectueze o operație specifică (matematică, relațională sau logică). Valorile pe care acționează un operator se numesc **operanzi**.


<div class="neversink-stone-light-scheme bg-[var(--neversink-admon-bg-color)] p-6 rounded-lg border border-[var(--neversink-admon-border-color)] text-center">
  <p class="text-2xl font-mono text-[var(--neversink-text-color)]">
    <span class="font-bold text-red-500">a</span> 
    <span class="text-3xl mx-4 text-blue-500">+</span> 
    <span class="font-bold text-red-500">b</span>
  </p>
  <div class="mt-4 text-lg">
    <p><span class="font-bold text-red-500">a</span> și <span class="font-bold text-red-500">b</span> sunt <span class="font-bold">operanzi</span>.</p>
    <p><span class="font-bold text-blue-500">+</span> este <span class="font-bold">operatorul</span>.</p>
  </div>
</div>


**Categorii principale de operatori în C:**
<div class="ns-c-tight">

- Operatori Aritmetici
- Operatori Relaționali
- Operatori Logici
- Operatori de Atribuire
- Operatori de Incrementare/Decrementare

</div>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Operatori Aritmetici

:: content ::

Folosiți pentru operații matematice de bază.

<div class="neversink-stone-light-scheme text-center grid grid-cols-5 gap-4">
  <div class="bg-[var(--neversink-bg-code-color)] p-4 rounded"> <span class="font-mono text-2xl text-[var(--neversink-fg-code-color)]">+</span> <br/>Adunare</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-4 rounded"> <span class="font-mono text-2xl text-[var(--neversink-fg-code-color)]">-</span> <br/>Scădere</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-4 rounded"> <span class="font-mono text-2xl text-[var(--neversink-fg-code-color)]">*</span> <br/>Înmulțire</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-4 rounded"> <span class="font-mono text-2xl text-[var(--neversink-fg-code-color)]">/</span> <br/>Împărțire</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-4 rounded"> <span class="font-mono text-2xl text-[var(--neversink-fg-code-color)]">%</span> <br/>Modulo</div>
</div>
<br/>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int a = 10, b = 3;
    printf("Suma: %d\n", a + b);       // 13
    printf("Diferenta: %d\n", a - b);  // 7
    printf("Produsul: %d\n", a * b);    // 30

    // ATENTIE la impartirea intreaga!
    printf("Impartire intreaga: %d\n", a / b); // 3, nu 3.33

    // Operatorul Modulo (%) da restul impartirii
    printf("Restul impartirii (Modulo): %d\n", a % b); // 1

    // Pentru impartire reala, cel putin un operand trebuie sa fie float/double
    printf("Impartire reala: %f\n", (float)a / b); // 3.333333

    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Operatori Relaționali și Logici

:: content ::

**Operatorii Relaționali** compară două valori și returnează `1` (adevărat) sau `0` (fals).
<div class="neversink-stone-light-scheme text-center grid grid-cols-6 gap-2 text-sm">
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">==</span> <br/>Egal</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">!=</span> <br/>Diferit</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">></span> <br/>Mai mare</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]"><</span> <br/>Mai mic</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">>=</span> <br/>Mai mare sau egal</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-2 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]"><=</span> <br/>Mai mic sau egal</div>
</div>
<br/>

**Operatorii Logici** combină mai multe expresii booleene.
<div class="neversink-stone-light-scheme text-center grid grid-cols-3 gap-2">
  <div class="bg-[var(--neversink-bg-code-color)] p-3 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">&&</span> <br/>ȘI Logic (AND)</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-3 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">||</span> <br/>SAU Logic (OR)</div>
  <div class="bg-[var(--neversink-bg-code-color)] p-3 rounded"> <span class="font-mono text-xl text-[var(--neversink-fg-code-color)]">!</span> <br/>NU Logic (NOT)</div>
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int varsta = 20;
    int are_bilet = true;

    // Poate intra la film? (varsta >= 18 SI are_bilet)
    int poate_intra = (varsta >= 18) && are_bilet;
    
    // Rezultatul unei expresii logice este 0 (fals) sau 1 (adevarat)
    printf("Poate intra la film? (1=Da, 0=Nu): %d\n", poate_intra);

    // Operatorul ! (NU) inverseaza valoarea de adevar
    printf("NU poate intra la film?: %d\n", !poate_intra);
    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Operatori de Atribuire

:: content ::

Folosiți pentru a asigna o valoare unei variabile.

<div class="ns-c-tight">

- **Atribuirea simplă (`=`)**: `x = 10;`
- **Atribuirea compusă**: O prescurtare pentru a modifica o variabilă folosind valoarea ei curentă.
  
</div>

<div class="neversink-stone-light-scheme grid grid-cols-2 gap-4 mt-4 text-center">
  <div>
    <h4 class="font-bold">Forma Lungă</h4>
    <p class="font-mono">x = x + 5;</p>
    <p class="font-mono">y = y * 2;</p>
  </div>
  <div>
    <h4 class="font-bold">Forma Scurtă (Compusă)</h4>
    <p class="font-mono">x += 5;</p>
    <p class="font-mono">y *= 2;</p>
  </div>
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int scor = 100;
    printf("Scor initial: %d\n", scor);

    // Adauga 50 de puncte
    scor += 50; // Echivalent cu: scor = scor + 50;
    printf("Scor dupa bonus: %d\n", scor);

    // Injumatateste scorul
    scor /= 2; // Echivalent cu: scor = scor / 2;
    printf("Scor dupa penalizare: %d\n", scor);
    
    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Operatori de Incrementare/Decrementare

:: content ::

Adaugă sau scade `1` dintr-o variabilă. Au două forme: **prefixată** și **postfixată**.

<div class="neversink-stone-light-scheme grid grid-cols-2 gap-8 mt-4 text-center">
  <div>
    <h3 class="text-xl font-bold text-[var(--neversink-text-color)]">Prefixat: `++x` sau `--x`</h3>
    <p class="mt-2">
      <span class="font-bold">1. Modifică</span> valoarea variabilei.<br/>
      <span class="font-bold">2. Returnează</span> noua valoare.
    </p>
  </div>
  <div>
    <h3 class="text-xl font-bold text-[var(--neversink-text-color)]">Postfixat: `x++` sau `x--`</h3>
    <p class="mt-2">
      <span class="font-bold">1. Returnează</span> valoarea curentă.<br/>
      <span class="font-bold">2. Modifică</span> valoarea variabilei.
    </p>
  </div>
</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int a = 5, b = 5;

    // Forma postfixata: y primeste valoarea veche a lui 'a' (5)
    int y = a++; 
    printf("a = %d, y = %d (dupa y = a++)\n", a, y);

    // Forma prefixata: z primeste valoarea noua a lui 'b' (6)
    int z = ++b;
    printf("b = %d, z = %d (dupa z = ++b)\n", b, z);

    return 0;
}
```

<AdmonitionType type="warning">
Diferența dintre formele prefixată și postfixată este vizibilă doar atunci când rezultatul operației este folosit într-o expresie mai mare (ca o atribuire).
</AdmonitionType>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Depășirea Tipului de Date (Overflow)

:: content ::

Ce se întâmplă când încercăm să punem o valoare prea mare într-o "cutie" (variabilă) care este prea mică? Acest fenomen se numește **overflow** (depășire).

Imaginați-vă un contor de kilometraj al unei mașini vechi, care are doar 5 cifre. Când ajunge la `99999`, următorul kilometru îl va reseta la `00000`. În programare, comportamentul este similar, dar poate fi mai puțin previzibil.

<br/>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    // 'signed char' poate stoca valori de la -128 la 127
    signed char numar = 127;

    printf("Valoarea initiala: %d\n", numar);

    // Ce se intampla daca adaugam 1?
    numar = numar + 1; // 127 + 1
    
    // Valoarea "sare" la capatul opus al intervalului!
    printf("Dupa overflow: %d\n", numar); // Va afisa -128

    return 0;
}
```

<AdmonitionType type="warning">

**Overflow** este o sursă majoră de bug-uri, uneori cu consecințe grave de securitate. Compilatorul, de obicei, **nu vă avertizează** despre asta! Este responsabilitatea programatorului să aleagă tipuri de date suficient de mari pentru valorile pe care le va stoca.

</AdmonitionType>

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Lumea Caracterelor: `char` și ASCII

:: content ::

Cum stochează un computer litere, simboluri și cifre? Răspunsul este: **nu le stochează**. Un computer poate stoca doar numere.

**ASCII** (American Standard Code for Information Interchange) este un tabel standard care asociază fiecărui caracter (ex: 'A', 'b', '?', '7') un număr întreg unic.

<div class="ns-c-tight">

- Variabila de tip `char` stochează, de fapt, un număr mic (de obicei între 0 și 127).
- Când folosim `%c` în `printf`, computerul se uită în tabelul ASCII și afișează caracterul corespunzător acelui număr.
- Când folosim `%d`, afișează numărul corespunzător.

</div>

---
layout: cover
---

```c {monaco-run}
#include <stdio.h>

int main() {
    char caracter = 'A';

    // Afisam variabila 'caracter' in doua moduri diferite
    printf("Afisat ca si caracter (%%c): %c\n", caracter);
    printf("Afisat ca si numar (%%d): %d\n", caracter);

    // Putem face si operatii aritmetice!
    // 'B' este urmatorul caracter in tabelul ASCII
    char urmatorul_caracter = caracter + 1;
    printf("Caracterul urmator este: %c\n", urmatorul_caracter);
    printf("Codul sau ASCII este: %d\n", urmatorul_caracter);
    
    return 0;
}
```

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Conversii de Tip: Schimbarea Regulilor

:: content ::

Uneori, avem nevoie ca o valoare de un anumit tip să fie tratată temporar ca fiind de alt tip. De exemplu, pentru a efectua o împărțire reală între două numere întregi. Acest proces se numește **conversie de tip** (type casting).

Există două tipuri de conversii:

<div class="grid grid-cols-2 gap-8 mt-4">
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">Conversie Implicită</h3>
    <div class="text-sm mt-2">

  Făcută automat de compilator, de obicei când se promovează un tip "mai mic" la unul "mai mare" pentru a nu pierde informație (ex: `int` la `double`).

  </div>
  </div>
  <div class="neversink-stone-light-scheme bg-[var(--neversink-bg-color)] p-4 rounded-lg">
    <h3 class="text-xl font-bold text-center text-[var(--neversink-text-color)]">Conversie Explicită</h3>
    <div class="text-sm mt-2">

  Forțată de programator prin specificarea noului tip în paranteze `(tip_nou)`. Acest lucru îi spune clar compilatorului: "Știu ce fac, tratează această valoare ca și cum ar fi de acest tip".

  </div>
  </div>
</div>

---
layout: cover
color: stone-light
---

```c {monaco-run}
#include <stdio.h>

int main() {
    int a = 10;
    int b = 4;
    
    // Fara conversie: compilatorul vede int / int si face impartire intreaga.
    // Rezultatul este 2, nu 2.5
    float rezultat_intreg = a / b;
    printf("Rezultatul impartirii intregi: %f\n", rezultat_intreg);

    // Conversie explicita: (float)a
    // 'a' este tratat temporar ca un float (10.0).
    // Compilatorul vede float / int, promoveaza 'b' la float si face impartire reala.
    float rezultat_real = (float)a / b;
    printf("Rezultatul impartirii reale: %f\n", rezultat_real);

    // Conversie implicita:
    double d = 5.5;
    int i = 2;
    // 'i' este promovat automat la double (2.0) inainte de adunare.
    double suma = d + i; 
    printf("Suma (conversie implicita): %f\n", suma);

    return 0;
}
```

---
layout: center
---

<AdmonitionType type="danger">

# Atenție la conversiile de la un tip mai mare la unul mai mic (ex: `double` la `int`). Acestea pot duce la **pierderea de informație** (trunchierea părții zecimale).

`int x = (int)9.99;` // x va avea valoarea 9

</AdmonitionType>

---
transition: slide-left
layout: cover
color: stone-light
---

# Sarcini de Practica

---
layout: top-title
align: c
color: stone-light
---
:: title ::

# Sarcina 1 (Ușor)

:: content ::

### Cerință:
Scrieți un program care convertește o temperatură dată din grade Celsius în grade Fahrenheit.

### Formula:
`Fahrenheit = (Celsius * 9 / 5) + 32`

<br/>

<div class="ns-c-tight">

1. Definiți o variabilă `float` pentru temperatura în Celsius.
2. Cereți utilizatorului să introducă o valoare.
3. Calculați și afișați rezultatul.

</div>
<br/>

### Exemplu de interacțiune:

```text
Introduceti temperatura in Celsius: 20
Temperatura in Fahrenheit este: 68.00
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
Scrieți un program care verifică dacă un număr întreg este par. Programul va afișa **`1`** (reprezentând adevărat) dacă numărul este par, și **`0`** (reprezentând fals) dacă este impar.

<br/>
<AdmonitionType type="tip">

Folosiți operatorul modulo (`%`) pentru a găsi restul împărțirii la 2. Apoi, folosiți operatorul relațional (`==`) pentru a compara acest rest cu 0. Rezultatul direct al acestei comparații (`numar % 2 == 0`) va fi stocat într-o variabilă `int` și afișat.

</AdmonitionType>
<br/>

### Exemple de interacțiune:
```text
Introduceti un numar intreg: 10
Este numarul par? (1=Da, 0=Nu): 1
```

```text
Introduceti un numar intreg: 7
Este numarul par? (1=Da, 0=Nu): 0
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

1. Cere utilizatorului să introducă un număr întreg format din exact 3 cifre.
2. Calculează și afișează suma cifrelor acelui număr.

</div>
<br/>

<AdmonitionType type="tip">

Pentru a extrage cifrele, folosiți o combinație de operatori de împărțire (`/`) și modulo (`%`) cu 10.
- `numar % 10` vă dă ultima cifră.
- `numar / 10` elimină ultima cifră.

</AdmonitionType>
<br/>

### Exemplu de interacțiune:
```text
Introduceti un numar de 3 cifre: 385
Suma cifrelor este: 16 // 3 + 8 + 5 = 16
```