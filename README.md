# Nodi di Leja - Calcolo Numerico

## Descrizione
Questo progetto implementa e analizza i **nodi di Leja**, secondo le istruzioni del [file di riferimento](Prog1.pdf). 
I nodi di Leja costituiscono un insieme di punti utilizzati in interpolazione numerica e approssimazione di funzioni. 

Il lavoro si inserisce nel contesto del corso di **Calcolo Numerico**, a.a. 2024/2025 e include:
- Algoritmi per la generazione dei nodi di Leja su diversi domini.
- Confronto con altri metodi di interpolazione (es. nodi di Chebyshev, equispaziati).
- Analisi degli errori e stabilità numerica.
- Esempi ed esperimenti computazionali.

## 📜 Descrizione delle Funzioni

- **[DLP](Src/DLP.m)**  
  Implementa il primo algoritmo per il calcolo dei nodi di Leja approssimati.  
  - **Input:**  
    - `x`: vettore di punti nell'intervallo `[a, b]`  
    - `d`: grado del polinomio interpolante  
  - **Output:**  
    - `dlp`: vettore con i `d+1` nodi di Leja approssimati  
  - **Metodo:** seleziona iterativamente i nodi massimizzando la produttoria  
    \[
    \prod |x - ξ_i|
    \]

- **[DLP2](Src/DLP2.m)**  
  Variante del primo algoritmo che utilizza la **fattorizzazione LU** con pivoting sulla matrice di Vandermonde basata su polinomi di Chebyshev.  
  - Input e output simili a `DLP.m`, ma con una differente strategia di selezione dei nodi.  
  - Più efficiente per gradi elevati.  

- **[leb_con](Src/leb_con.m)**  
  Calcola la **costante di Lebesgue** valutando la funzione di Lebesgue sui nodi interpolanti.  
  - **Input:**  
    - `z`: nodi dell'interpolante  
    - `x`: punti di valutazione  
  - **Output:**  
    - `L`: costante di Lebesgue approssimata  
  - **Metodo:** utilizza massimo un ciclo per l'efficienza computazionale.  

## 🔬 Esperimenti e Test

Gli esperimenti previsti includono:  
✅ Confronto dei tempi computazionali di `DLP.m` e `DLP2.m` per gradi \(d = 1, \dots, 50\).  
✅ Grafico della **costante di Lebesgue** in scala semilogaritmica.  
✅ Confronto dell'interpolante con funzione di test \( f(x) = \frac{1}{x - 1.3} \) usando nodi di Leja e nodi equispaziati.  


## Contributi
Questo progetto è completo e destinato solo alla consultazione. Non sono previsti contributi esterni.

## Licenza
Questo progetto è distribuito sotto la licenza MIT. Consulta il file `LICENSE` per maggiori dettagli.
