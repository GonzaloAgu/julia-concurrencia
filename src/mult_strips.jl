function mult_strips(A::Matrix, B::Matrix, N::Int)::Matrix
    println("Multiplicando en strips...")
    C = zeros(Float64, N, N)

    # utilizamos planificador estático, es decir que se distribuye equitativamente la tarea entre los hilos (si las tareas tuvieran distintos tamaños, en teoría convendría dynamic)
    # en teoría.. porque cuando pruebo, me dan los mismos resultados
    @threads :static for i in 1:N
        for j in 1:N
            s = 0.0
            for k in 1:N
                s += A[i,k] * B[k,j]
            end
            C[i,j] = s
        end
    end
    return C
end
