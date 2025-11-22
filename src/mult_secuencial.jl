function mult_secuencial(A::Matrix, B::Matrix, N::Int)::Matrix
    println("Multiplicando secuencialmente...")
    C = zeros(Float64, N, N)
    for i in 1:N
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
