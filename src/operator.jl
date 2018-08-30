export ++

import Base.*

++ = vcat

@eval $(:(=)) = ==
@eval export $(:(=))

*(x::Integer, ::Type{T}) where {T <: Primitives} = T(x)

*(x::Type...) = Tuple{x...} # cannot use × since it is not associative

import Base.|

|(x::Type, y::Type) = Union{x, y}

# import Base.ctranspose

# ctranspose(x::Primitives) = ntoh(x)

using InteractiveUtils

import Base.in

# hack to circumvent a fucking warning
in(x::Union{subtypes(AbstractString)...}, y::Union{subtypes(AbstractString)...}) = occursin(x, y)
