---
transition: slide-left
layout: top-title
align: c
color: stone-light
---

:: title ::
# Notare

:: content ::
<style>
.grade-container {
  display: flex;
  justify-content: center;
  align-items: stretch; 
  gap: 20px;
  width: 100%;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: var(--neversink-fg-color); 
}
.grade-box {
  background-color: var(--neversink-admon-bg-color);
  padding: 20px;
  border-radius: 12px;
  text-align: center;
  display: flex;
  flex-direction: column;
  border: 1px solid var(--neversink-admon-border-color);
}
.grade-box.coursework {
  flex-basis: 65%; 
}
.grade-box.exam {
  flex-basis: 35%;
  justify-content: center; 
}
.grade-title {
  font-size: 3.2em;
  font-weight: 600;
  margin: 0;
  padding-bottom: 10px; 
  border-bottom: 2px solid var(--neversink-border-color); 
  color: var(--neversink-highlight-color); 
}
.grade-subtitle {
  font-size: 1.3em;
  margin-top: 10px;
  margin-bottom: 15px; 
  opacity: 0.9;
}
.coursework-details {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 15px; 
  flex-grow: 1;
}
.detail-item {
  background-color: var(--neversink-bg-color);
  padding: 15px;
  border-radius: 8px;
  font-size: 1em;
  font-weight: 500;
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: var(--neversink-admon-text-color);
}
.detail-item span {
  display: block;
  font-weight: bold;
  font-size: 1.5em;
  margin-top: 5px; 
  color: var(--neversink-fg-code-color);
}
</style>

<div class="grade-container neversink-stone-light-scheme">
  <div class="grade-box coursework">
    <p class="grade-title">60%</p>
    <p class="grade-subtitle">Activitate Semestrială</p>
    <div class="coursework-details">
      <div class="detail-item">Atestare 1 <span>25%</span></div>
      <div class="detail-item">Atestare 2 <span>25%</span></div>
      <div class="detail-item">Laboratoare <span>25%</span></div>
      <div class="detail-item">Lucrul Individual <span>25%</span></div>
    </div>
  </div>
  
  <div class="grade-box exam">
    <p class="grade-title">40%</p>
    <p class="grade-subtitle">Examen Final</p>
  </div>
</div>

---
transition: slide-left 
layout: top-title 
align: c 
color: stone-light
---
:: title ::

# Lecții

:: content ::

<style>
.attendance-container {
display: flex;
justify-content: center;
align-items: stretch;
gap: 30px;
width: 100%;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
color: var(--neversink-fg-color);
margin-top: 2rem;
}
.attendance-box {
background-color: var(--neversink-admon-bg-color);
padding: 25px;
border-radius: 12px;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
flex-basis: 45%;
border: 1px solid var(--neversink-admon-border-color);
}
.attendance-title {
font-size: 2.2em;
font-weight: 600;
margin: 0;
padding-bottom: 15px;
color: var(--neversink-highlight-color);
}
.attendance-icon {
font-size: 4em;
margin-bottom: 15px;
color: var(--neversink-fg-code-color);
}
.attendance-description {
font-size: 1.2em;
opacity: 0.9;
color: var(--neversink-admon-text-color);
margin-bottom: 0;
}
.attendance-description strong {
color: var(--neversink-fg-color);
font-weight: 700;
}
.attendance-note {
font-size: 1em;
font-style: italic;
margin-top: 10px;
opacity: 0.8;
color: var(--neversink-admon-text-color);
}
</style>

<div class="attendance-container neversink-stone-light-scheme">
<div class="attendance-box">
<div class="attendance-icon">🧪</div>
<p class="attendance-title">Laboratoare</p>
</div>

<div class="attendance-box">
<div class="attendance-icon">📝</div>
<p class="attendance-title">Seminare</p>
</div>


<div class="attendance-box">
<div class="attendance-icon">👨‍🏫</div>
<p class="attendance-title">Cursuri</p>
</div>
</div>

---
transition: slide-left 
layout: top-title 
align: c 
color: stone-light
---

:: title ::

# Reguli Esențiale

:: content ::

<style>
.rules-container {
display: flex;
justify-content: center;
align-items: stretch;
gap: 30px;
width: 100%;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
color: var(--neversink-fg-color);
margin-top: 2rem;
}
.rules-box {
background-color: var(--neversink-admon-bg-color);
padding: 25px;
border-radius: 12px;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
flex-basis: 45%;
border: 1px solid var(--neversink-admon-border-color);
}
.rules-title {
font-size: 2.2em;
font-weight: 600;
margin: 0;
padding-bottom: 15px;
color: var(--neversink-highlight-color);
}
.rules-icon {
font-size: 4em;
margin-bottom: 15px;
color: var(--neversink-fg-code-color);
}
.rules-description {
font-size: 1.2em;
opacity: 0.9;
color: var(--neversink-admon-text-color);
}
.rules-description strong {
color: var(--neversink-fg-color);
font-weight: 700;
}
</style>

<div class="rules-container neversink-stone-light-scheme">
<div class="rules-box">
<div class="rules-icon">📅</div>
<p class="rules-title">Termene Limită</p>
<p class="rules-description">Respectarea termenelor este <strong>esențială</strong>. Lucrările întârziate nu accepta.</p>
</div>

<div class="rules-box">
<div class="rules-icon">⚠️</div>
<p class="rules-title">Integritate</p>
<p class="rules-description">Toleranță <strong>zero</strong> pentru plagiat. Toate temele și proiectele trebuie să fie individuale.</p>
</div>
</div>

---
transition: slide-left
layout: top-title 
align: c 
color: stone-light
---

:: title ::

# Date de Contact

:: content ::

<style>
.presence-container {
display: flex;
justify-content: center;
align-items: stretch;
gap: 30px;
width: 100%;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
color: var(--neversink-fg-color);
margin-top: 2rem;
}
.presence-box {
background-color: var(--neversink-admon-bg-color);
padding: 25px;
border-radius: 12px;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
flex-basis: 45%;
border: 1px solid var(--neversink-admon-border-color);
}
.presence-title {
font-size: 2.2em;
font-weight: 600;
margin: 0;
padding-bottom: 15px;
color: var(--neversink-highlight-color);
}
.presence-icon {
font-size: 4em;
margin-bottom: 15px;
color: var(--neversink-fg-code-color);
}
.presence-description {
font-size: 1.2em;
color: var(--neversink-admon-text-color);
opacity: 0.9;
}
.contact-list {
text-align: left;
width: 100%;
}
.contact-item {
display: flex;
align-items: center;
margin-bottom: 10px;
font-size: 1.1em;
}
.contact-item-icon {
margin-right: 15px;
font-size: 1.5em;
}
</style>

<div class="presence-container neversink-stone-light-scheme">

<div class="presence-box">
<div class="presence-icon">📬</div>
<p class="presence-title">Contact</p>
<div class="contact-list">
<div class="contact-item">
<span class="contact-item-icon">✉️</span>
<span>cristian.crudu@usm.md</span>
</div>
<div class="contact-item">
<span class="contact-item-icon">📞</span>
<span>+373 67 277 471</span>
</div>
</div>
</div>
</div>

---
transition: slide-left 
layout: top-title 
align: c 
color: stone-light
---

:: title ::

# Lucru Individual

:: content ::

<style>
.work-focus-container {
display: flex;
justify-content: center;
align-items: center;
height: 100%;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.work-focus-box {
background-color: var(--neversink-admon-bg-color);
padding: 30px 40px;
border-radius: 12px;
text-align: center;
max-width: 65%;
border: 1px solid var(--neversink-admon-border-color);
}
.work-focus-icon {
font-size: 4.5em;
margin-bottom: 20px;
color: var(--neversink-fg-code-color);
}
.work-focus-text {
font-size: 1.5em;
color: var(--neversink-fg-color);
font-weight: 500;
line-height: 1.4;
}
</style>

<div class="work-focus-container neversink-stone-light-scheme">
<div class="work-focus-box">
<div class="work-focus-icon">💻</div>
<p class="work-focus-text">
La sfarsitul semestrului veți avea un mic colocviu. Veti primi intrebari teoretice si sarcini practice pe toate temele care le veti trece pe parcursul anului.
</p>
</div>
</div>

---
transition: slide-left 
layout: top-title 
align: c 
color: stone-light
---
:: title ::

# Atestări & Examen

:: content ::

<style>
.eval-container {
display: flex;
justify-content: center;
align-items: stretch;
gap: 20px;
width: 100%;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
color: var(--neversink-fg-color);
margin-top: 2rem;
}
.eval-box {
background-color: var(--neversink-admon-bg-color);
padding: 20px;
border-radius: 12px;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
flex-basis: 30%;
border: 1px solid var(--neversink-admon-border-color);
}
.eval-title {
font-size: 1.8em;
font-weight: 600;
margin: 0;
padding-bottom: 10px;
color: var(--neversink-highlight-color);
}
.eval-icon {
font-size: 3.5em;
margin-bottom: 15px;
color: var(--neversink-fg-code-color);
}
.eval-description {
font-size: 1.0em;
opacity: 0.9;
color: var(--neversink-admon-text-color);
}
</style>

<div class="eval-container neversink-stone-light-scheme">
<div class="eval-box">
<div class="eval-icon">1️⃣</div>
<p class="eval-title">Atestare 1</p>
<p class="eval-description">Evaluare teoretică și practică la mijlocul semestrului.</p>
<p>(Seminar)</p>
</div>

<div class="eval-box">
<div class="eval-icon">2️⃣</div>
<p class="eval-title">Atestare 2</p>
<p class="eval-description">A doua evaluare semestrială.</p>
<p>(Laborator)</p>
</div>

<div class="eval-box">
<div class="eval-icon">🏁</div>
<p class="eval-title">Examen Final</p>
<p class="eval-description">Verificarea finală a cunoștințelor acumulate.</p>
<p>(Curs)</p>
</div>
</div>

---
transition: slide-left
layout: top-title
align: c
color: stone-light
---

:: title ::

# Scutire de Laboratoare (Opțional)

:: content ::

<div class="mt-8">
<AdmonitionType type="info" class="text-center text-xl">

# Studenții care doresc să fie scutiți de laboratoarele semestriale pot rezolva și susține **Sarcinile Suplimentare**.

# Aceste sarcini sunt mai complexe și vor fi evaluate mai strict, dar finalizarea lor cu succes va înlocui nota pentru toate laboratoarele.

</AdmonitionType>
</div>