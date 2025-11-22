function definir_tamanio()::Int
    # respuesta predeterminada en caso de no poder leer los argumentos
    result = 8
    # buscamos la posicion siguiente a -N
    index = findfirst(==("-N"), ARGS)

    if(isnothing(index))
        return result
    end

    arg = tryparse(Int, ARGS[index + 1])
    if (arg !== nothing && isinteger(arg))
        result = arg
    end

    return result
end

function definir_tipo_mult()
    # respuesta predeterminada en caso de no poder leer los argumentos
    result = "sec"
    
    index = findfirst(==("-tipo"), ARGS)

    if(isnothing(index))
        return result
    end

    return strip(ARGS[index + 1])
end