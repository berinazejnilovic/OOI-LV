# Vildana Tabaković 18968, Berina Zejnilović 18805

using LinearAlgebra

function rijesi_simplex(A, b, c)
    m = size(b, 1)  #broj redova b
    n = size(A, 2)  #broj kolona A
    B = zeros(m)    #baza
    
    m_A = size(A,1) #broj redova A
    n_b = size(b,2) #broj kolona b
    m_c = size(c,1) #broj redova c
    n_c = size(c,2) #broj kolona c

    #provjera dimenzija
    if (m != m_A || n_b != 1 || n_c != n || m_c != 1) 
        throw(ErrorException);
    end


    tabela = [b A I(m); 0 c zeros(1, m)] #simplex tabela

    for i in 1:m
        B[i] = n + i;   #dopunske promjenjive u bazi
    end


    terminira = false;

    while terminira == false
        cmax, q = findmax(tabela[m+1, 2:end]);
        q += 1;

        if cmax <= 0
            terminira = true;
        else 
             tmax = Inf;
             p = 0;
            for i in 1:m
                if tabela[i, q] > 0
                    if (tabela[i, 1] / tabela[i, q]) == tmax && tmax != Inf
                        if rand(1)<0.5
                            p = i;
                        end
                    elseif (tabela[i, 1] / tabela[i, q]) < tmax           
                        tmax = (tabela[i, 1] / tabela[i, q]);         
                        p = i;   #pivot red
                    end
                end
            end

            if tmax == Inf
                return "Rješenje je neograničeno";
            end

            B[p] = q-1;
            pivot = tabela[p, q]; #vrijednost pivot elementa


            for j in 1:m+n+1                               
                tabela[p, j] = tabela[p, j] / pivot;
            end
          
            for i in 1:m+1                                
                if i != p
                  factor = tabela[i, q];
                  for j in 1:m+n+1                         
                      tabela[i, j] = tabela[i, j] - factor * tabela[p, j];
                  end
                end
            end

        end
    end

    x = zeros(1,n+m)

    for i in 1:m
        x[floor(Int, B[i])] = tabela[i, 1];              
    end
    
    Z = tabela[m+1,1];                 
    
    return x, -Z;
end


#Primjer 1
x, Z = rijesi_simplex([0.5 0.3; 0.1 0.2], [150; 60], [3 1]);

println("Optimalna vrijednost funkcije cilja:")
println(Z)
println("Rjesenja:")
println(x)


#Primjer 2
x, Z = rijesi_simplex([25 20 40; 2 4 5], [1000; 500], [100 200 300]);

println("Optimalna vrijednost funkcije cilja:")
println(Z)
println("Rjesenja:")
println(x)


#Primjer 3
x, Z = rijesi_simplex([30 16; 14 19; 11 26; 0 1], [22800; 14100; 15950; 550], [800 1000]);

println("Optimalna vrijednost funkcije cilja:")
println(Z)
println("Rjesenja:")
println(x)
