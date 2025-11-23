function mult_strips_manual(A::Matrix, B::Matrix, N::Int)::Matrix
    println("Multiplicando en strips alt...")
    C = zeros(Float64, N, N)

    num_thr = nthreads()
    if N % num_thr != 0 
        println("Para usar esta multiplicacion, el tamaño de la matriz debe ser un multiplo de la cantidad de hilos.")
        exit(-1)
    end
    rows_per_thr = N / num_thr

    @threads for worker in 1:num_thr

        first_row = round(Int, rows_per_thr * (worker - 1) + 1)
        last_row = round(Int, first_row + rows_per_thr - 1)

        #println("Worker $worker: Fila inicial $first_row - Final $last_row")

        for i in first_row:last_row
            for j in 1:N
                s = 0.0
                for k in 1:N
                    s += A[i,k] * B[k,j]
                end
                C[i,j] = s
            end
        end
    end  
    return C
end