using Printf 

function imprimir_matriz(M)
    nrows = size(M, 1)
    to_print = min(nrows, 16) 
    for i in 1:to_print
        for j in 1:to_print
            @printf("%.1f ", float(M[i, j]))
        end
        println()
    end
end