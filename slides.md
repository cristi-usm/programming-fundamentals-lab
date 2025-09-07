---
title: 'Programming Fundamentals Labs'
theme: neversink
transition: slide-left
layout: cover
color: stone-light
info: 'Programming Fundamentals Labs · Crudu Cristian · 2025'

highlighter: shiki
shiki:
  theme:
    dark: vitesse-dark
    light: vitesse-light
lineNumbers: true
draw:
  enabled: true
favicon: './C.png'
addons:
    - slidev-addon-excalidraw
    - slidev-addon-cpp-runner
c:
  compiler: 'gcc'
  standard: 'c2x'
  optimization: 'O2'
  flags: '-Wall -Wextra -pedantic -pthread -pedantic-errors'
  libraries: '-lm -latomic'
  extraCommands: ''
  alwaysShowCompilerOutput: true
---
 
# Fundamentele Programarii
limbajul *`C`*

---
layout: top-title
color: stone-light
align: c
---

:: title ::
# Cuprins

:: content ::



<div class="ns-c-tight">

- [**Lab 1.** Introducere. Structura unui program C. Variabile.](10) 
- [**Lab 2.** Tipuri de Date. Operatori & Operanzi.](31)

</div>


---
src: ./presentations/0-overview/slides.md
---

---
src: ./presentations/1-intro/slides.md
---

---
src: ./presentations/2-data-types/slides.md
---