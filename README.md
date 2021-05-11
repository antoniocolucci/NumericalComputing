#Progetto Calcolo Numerico

#Traccia
1. Defnire un vettore riga T di 30 numeri interi positivi, pseudo-casuali,
di 3 cifre.
(Assegnare preliminarmente un seed prefissato di 6 cifre, di cui almeno 3
distinte, alla function rng. 
Esempio: >> rng(143362); non usare 143362 e non usare sequenze di cifre consecutive come 123456, 456789, 765432,
etc)
2. Denominare X il vettore ottenuto ordinando il vettore T ed eliminandone
poi eventuali ripetizioni e tutti le componenti multiple di 6.
Definire m e M rispettivamente come il minimo e il massimo di X.
(controllare che X abbia tra 20 e 30 componenti. In caso diverso assegnare
un altro valore al seed al punto 1.)
3. Definire un handle alla funzione f = g(p), composta di una funzione
trigonometrica g e di una polinomiale p.
Per definire fissare:
- p come un polinomio di secondo grado con coefficienti diversi da 0, +-1;
- g come una tra le funzioni: seno, coseno, tangente e cotangente.
Esempio: g(x) = cot(x), p(x) = 3x^2 - 7x - 4 e f(x) = cot(3x^2 - 7x - 4).
N.B. usare una funzione diversa dall'esempio.
N.B. non è necessario definire esplicitamente p e g
(Verificare che f cambia segno almeno una volta in X. Per tale scopo valutare
i segni delle componenti del vettore Y che contiene i valori corrispondenti a X
mediante f).
4. Trovare uno zero di f in [m;M] con un metodo numerico opportuno
(descrivere). Fissare l'accuratezza a piacere tra 10􀀀4 e 10􀀀8.
5. Disegnare gracamente la funzione f in [m;M].
 Evidenziare i punti di f di ascisse nel vettore Y al punto 2.
 Evidenziare inoltre lo zero della funzione.
6. Fissare a piacere due valori non interi L e R, con L < 3:4 e R > 10:5.
 Generare una matrice A quadrata di ordine 5, pseudo-casuale con entrate
uniformemente distribuite in [L;R].
 Verificare che A non sia singolare, altrimenti cambiare nuovamente il
valode del seed in rng immediatamente prima di generare A.
7. Generare un vettore colonna, da denominare x true, di 5 componenti
intere in un intervallo a piacere.
Determinare il vettore colonna b anche x true sia la soluzione del
sistema lineare Ax true = b
8. Chiamare x sol la soluzione del sistema Ax = b calcolata con uno o piu
dei metodi studiati (Descrivere brevemente il metodo/i nei commenti)
Calcolare l'errore che si commette prendendo come soluzione x sol in
luogo di x true.
9. Inverti due righe di A.
Sostituire le entrate di A minori di media col valore media (media
denota la media tra L e R).
10. Definire x come un vettore estratto da X scegliendo dieci componenti
non consecutive di quest'ultimo (fissare le 10 componenti a piacere, o
pseudo-casualmente).
Definire il vettore xx come griglia tta in [min(x); max(x)] di N punti
(ssare N > 120).
11. Interpolare f in x con un polinomio pol int di grado opportuno.
Approssimare f in x con un polinomio pol app di grado 3.
Approssimare f in x con un polinomio trigonometrico trig di grado 2.
12. Disegnare graficamente in una seconda gura:
 i punti del graco di f in x;
 i punti del graco di pol int in xx;
 i punti del graco di pol app in xx;
 i punti del graco di trig in xx.
13. Denire x mediato come l'output della funzione:
mx=media pesata NUMMAT(x)
dove l'input e il vettore x.
14. Denire sxy come l'output della funzione:
s=saxpy NUMMAT(x,y,a)
dove x e y sono i due vettori precedentemente deniti e a e un numero
reale scelto a caso.
15. Sviluppare la funzione mx=media pesata NUMMAT(x).
(NUMMAT indica le ultime 6 cifre della propria matricola.).
Tale funzione riceve un vettore di n componenti x = (x1; x2; : : : ; xn) e
restituisce in output un vettore mx di componenti:
mx(i) =
8>><
>>:
x(1)+x(2)
2 i = 1
x(i􀀀1)+2x(i)+x(i+1)
4 2  i  n 􀀀 1
x(n􀀀1)+x(n)
2 i = n
16. Sviluppare la funzione s=saxpy NUMMAT(x,y,a).
(NUMMAT indica le ultime 6 cifre della propria matricola.).
Tale funzione riceve due vettori di n componenti x = (x1; x2; : : : ; xn) e
y = (y1; y2; : : : ; yn), un numero reale a e restituisce in output un vettore
s di componenti:
s(i) = a  x(i) + y(i); i = 1; 2; : : : ; n
