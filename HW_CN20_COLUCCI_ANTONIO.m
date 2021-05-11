%HOMEWORK CALCOLO NUMERICO 2020.

%Cognome   :      COLUCCI
%Nome      :      ANTONIO
%Matricola :      0124001929

%Le function implementate sono : 
% - mx = media_pesata_001929(x)
% - s = saxpy_001929(x,y,a).

  
%PUNTO 1 :

%Per il punto 1 ho usato la funzione built-in di Matlab, "rng", per fissare
%un seed di 6 cifre di cui almeno 3 distinte (254116).
%Successivamente ho assegnato al vettore riga T, 30 numeri pseudo-casuali
%di 3 cifre (intervallo 100,999) con la function "randi".

 disp("********************PUNTO 1********************");
 
 rng(254116) %seed di 6 cifre.
  
 T = randi ([100,999], 1,30) %vettore riga T contenente 30 numeri pseudo-casuali.
  
    
 
%PUNTO 2 :

%Inizialmente con il comando "unique" applicato al vettore T ho ordinato
%i numeri e rimosso le eventuali ripetizioni.
%Successivamente ho creato un vettore vuoto, X, che mi servirà per copiare
%al suo interno i valori di T eliminando tutte le componenti multiple di 6.
%Con un ciclo for che va da 1 alla lunghezza di T controllo se la function
%"mod" restituisce un numero diverso da 0 (cioè che non è multiplo di 6) e
%qualora ci fosse, lo va a mettere nel vettore riga X.

disp("********************PUNTO 2********************");

T = unique (T) %ordino i numeri all'interno di T eliminando le ripetizioni.


X = []; %vettore vuoto dove andranno copiati tutti i valori che non sono multipli di 6.
  
k = 1; %indice del vettore X inizializzato a 1.
  
  
for cont=1:length(T)
      
    if mod(T(1,cont),6) ~= 0 %se mod restituisce un valore diverso da 0
          X(1,k) = T(1,cont); %lo si va a mettere nel vettore X.
          k = k+1; %incremento dell'indice k del vettore X.
    end       
end

disp ("Vettore riga X senza ripetizioni e senza multipli di 6.");

X %il vettore X ha 23 componenti.  
  
m = min(X); %minimo del vettore X.
M = max(X); %massimo del vettore X. 
  


%PUNTO 3 :

%Per il punto numero 3 ho creato un handle alla funzione cos(5*x.^2 - 2*x -6)
%notando che almeno una volta la f cambia segno in X. Per valutare ciò
%bisogna controllare i segni delle componenti del vettore Y che contiene
%i valori corrispondenti a X mediante f.
  
  
disp("********************PUNTO 3********************");

f = @(x) cos(5*x.^2 - 2*x -6); %handle alla funzione.
  

disp ("Almeno una volta f cambia segno in X.");
Y = f(X) %valori del vettore Y.


%PUNTO 4 :

%Ho trovato lo zero della funzione usando il metodo di bisezione che prende
%in input la funzione, gli estremi m ed M e il massimo errore assoluto.


disp("********************PUNTO 4********************")

primozero = bisezione (f, m, M, 10.^-4) %zero della funzione calcolato mediante la function "bisezione".
  
  
  
%PUNTO 5 :

%Nel punto 5 ho disegnato la funzione in [m,M] evidenziando lo zero della
%funzione.

disp("********************PUNTO 5********************");

disp ("Plot della funzione.");

x = linspace (m,M,100); %Dominio in cui valutare la funzione. Vettore di 100 elementi equispaziati.
  
y = f(x); %valuto f(x) su ogni valore di ascissa.  
  

  
plot(x,y,'o-magenta') %plot della funzione.

hold on %blocco il grafico.
grid on %griglia sul grafico.

plot (primozero,f(primozero),'*-b') %plot dello zero della funzione calcolato mediante il metodo di besione.


%PUNTO 6:

%Ho fissato due valori a piacere, L ed R con L < 3.4 e R > 10.5.
%Successivamente ho creato una matrice A quadrata, di ordine 5, con entrate
%di componenti pseudo-casuali ed infine tramite det(A) che calcola il
%determinante della matrice mi sono accorto che essa non è singolare in
%quanto il determinante è diverso da 0.

disp("********************PUNTO 6********************");

L = 2.6;
R = 12.5;

A = L + (R-L) * rand(5)

disp ("Determinante : ");

det(A)


%PUNTO 7:

%Ho generato un vettore colonna chiamato x_true di 5 numeri pseudo-casuali 
%in un intervallo [10,30] dopodichè ho calcolato il vettore colonna b con
%la moltiplicazione tra la matrice A e x_true e infine ho fatto una
%verifica con l'operatore "\" per vedere se realmente x_true fosse 
%la soluzione del sistema lineare A x_true = b.

disp("********************PUNTO 7********************");

x_true = randi ([10, 30], 5,1) %vettore colonna di 5 numeri pseudo-casuali.

b = A * x_true %con questa operazione riga per colonna calcolo b.

x_true1 = A\b %con l'operazione A\b che risolve il sistema con il metodo di Gauss con pivoting mi accerto che il risultato è lo stesso del vettore x_true.

  
%PUNTO 8:

%Ho calcolato la soluzione del sistema Ax=b utilizzando il metodo di Gauss
%con pivoting parziale. La function che risolve il sistema si chiama
%"Sgauss_pivot" che prende in input la matrice A dei coefficienti e il
%vettore b dei termini noti. Essa richiama la function "TriangGauss_pivot"
%che serve per la triangolarizzazione di Gauss; determina il sistema Ux=p
%equivalente al sistema Ax=b, dove U è una matrice triangolare superiore ed
%è memorizzata nel triangolo superiore di A mentre p è memorizzato in b.
%Infine la Sgauss_pivot risolve il sistema triangolare con l'ausilio della
%fucntion "STriangSup".
%Nella variabile "err" ho calcolato l'errore facendo il valore assoluto tra
%(x_sol - x_true).

disp("********************PUNTO 8********************");

x_sol = Sgauss_pivot (A,b)

err = abs (f(x_sol) - f(x_true)) %errore assoluto.

disp ("Max(err)");

max(err) %massimo dell'errore assoluto.


%PUNTO 9:

%Il primo passo del punto 9 consiste nell'invertire due righe della matrice
%A e ciò è stato fatto con : A([1,3],:) = A([3,1], :) dove ho invertito la
%terza riga con la prima.
%Successivamente ho calcolato la media tra L ed R, fissati nel punto 6, e
%dove le entrate della matrice erano minori del valore di media, li ho
%sostituiti con il valore di media stesso utilizzando due cicli for
%annidati : uno con indice z=1 che scorre le righe e un secondo ciclo for
%di indice k=1 che scorre le colonne. Nel blocco if si verifica se il
%valore A(z,j) della matrice è minore del valore media.

disp("********************PUNTO 9********************");

A %stampa A.

disp("Inverto la terza riga con la prima.")

A([1,3],:) = A([3,1], :) %inverto la terza riga con la prima riga.

disp ("Media tra L ed R : ");

media = (L+R)/2 %media tra L ed R.


for z=1:length(A)
    for j=1:length(A)
        if (A(z,j) < media)
            A(z,j) = media;
        end
    end
end

disp ("Ho sostituito le entrate di A minori di media col valore media.")

A %stampa la matrice A.


%PUNTO 10:

%Ho definito x come un vettore di 10 componenti non consecutive
%estratto da X.
%Infine dichiaro una variabile xx come griglia fitta in min(x), max(x) con
%N>120.
%Con un ciclo for che va da w=1 a 10, estraggo 10 componenti non
%consevutive da X e le metto nel vettore x.

disp("********************PUNTO 10********************");

x = []; %svuoto il vettore x utilizzato precedentemente.

for w=1:10
    
    x(1,w) = X(1, randi(length(X)));
    
end

x

N = 135;

xx = linspace (min(x), max(x), N); %griglia fitta.


%PUNTO 11 :


disp("********************PUNTO 11********************");

%Interpolare f in x con un polinomio pol int di grado opportuno.

y = f(x);

pol_int = polyval(polyfit(x,y,length(x)-1),xx)


%Approssimare f in x con un polinomio pol app di grado 3.

pol_app = polyval(polyfit(x,y,3),xx);

%Approssimazione f in x con un polinomio trigonometrico trig di grado 2.

Mat =  [ones(size (x')) cos(x') cos(2*x')]

q = Mat\y'

ptrig = q(1) + q(2) * cos(xx) + q(3) * cos (2*xx)
  

     
%PUNTO 12 : 

figure
plot(x, y, 'o',xx,ptrig,xx,pol_app,xx,pol_int)

hold on
grid on
     





%PUNTO 13 :

%Ho definito x_mediato come l'output della funzione :
%mx = media_pesata_001929(x) che prende in input il vettore x 
%dichiarato nel punto 10.

disp("********************PUNTO 13********************");

x_mediato = media_pesata_001929(x)

%PUNTO 14 :

%Ho definito sxy come l'output della funzione : 
%sxy = saxpy_001929(x,y,a), dove x ed y sono i due vettori precedentemente
%definiti e a è un numero reale pseudo-casuale.

disp("********************PUNTO 14********************");

a = rand()

sxy = saxpy_001929(x,y,a)


%PUNTO 15 :

%Il punto 15 chiede di sviluppare la funzione: mx = media_pesata_001929(x).
%Ho operato in questo modo : inizialmente ho dichiarato il vettore n che 
%contiene la lunghezza del vettore x e successivamente con un ciclo for 
%che va da i ad n ho fatto una serie di controlli che chiedeva la traccia 
%dell'homework.


function mx = media_pesata_001929(x)

n = length (x);

for i=1:n
    
    if (i == 1)
        mx(i) = (x(1) + x(2))/2 ; 
    end

    if (i >= 2 && i <= n-1)
        mx(i) = (x(i-1)+ x(i)*2 + x(i+1))/4;    
    end

    if (i == n)
        mx(i) = (x(n-1) + x(n))/2;    
    end
    
end %chiude il for.

end %fine function.



%PUNTO 16 :

%L'ultimo punto dell'homework consiste nel sviluppare la function : 
%s = saxpy_001929(x,y,a). Tale funzione riceve in input due vettori di n
%componenti, x ed y, ed il numero reale "a"; restituisce in output un
%vettore s.
%Ho dapprima calcolato la lunghezza di x contenuta nella variabile size,
%poi con un ciclo for di indice pp che va da 1 fino alla lunghezza del
%vettore x calcolo il vettore s.


function s = saxpy_001929(x,y,a)

size = length(x);

for pp = 1:size
    
    s(pp) = (a * x(pp)) + y(pp);
    
end

end


     
     
     











    




    

  
 



