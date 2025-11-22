function mult_bloques(A, B, b)
    println("Multiplicando en bloques...")
    n = size(A, 1)
    C = zeros(Float64, n, n)

    for ii in 1:b:n
        for jj in 1:b:n
            @threads for kk in 1:b:n
                i_end = min(ii + b - 1, n)
                j_end = min(jj + b - 1, n)
                k_end = min(kk + b - 1, n)

                for i in ii:i_end
                    for j in jj:j_end
                        s = 0.0
                        for k in kk:k_end
                            s += A[i,k] * B[k,j]
                        end
                        C[i,j] += s
                    end
                end
            end
        end
    end

    return C
end

