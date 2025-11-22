using BenchmarkTools
using Base.Threads

include("src/leer_args.jl")
include("src/mult_secuencial.jl")
include("src/mult_bloques.jl")
include("src/mult_strips.jl")
include("src/imprimir_matriz.jl")


nth = nthreads()
println("$nth hilos.")

# lee parametros de entrada del usuario
N = definir_tamanio()
tipo_mult = definir_tipo_mult()

matriz_A = ones(N, N)
matriz_B = ones(N, N)

matriz_resultante = [[]]

function multiplicar()
    global matriz_resultante
    if tipo_mult == "sec"
        matriz_resultante = mult_secuencial(matriz_A, matriz_B, N)
    elseif tipo_mult == "strips"
        matriz_resultante = mult_strips(matriz_A, matriz_B, N)
    end
end

t = @elapsed multiplicar()

imprimir_matriz(matriz_resultante)
println("Tiempo de espera: $t segundos")