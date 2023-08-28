include("AtlasMesh.jl")
using .GridTools

# TODO: Make this a Module

struct StateContainer
    rho::Field{<:AbstractFloat, 2, Tuple{Vertex_, K_}, <:Tuple}
    vel::Tuple{
        Field{<:AbstractFloat, 2, Tuple{Vertex_, K_}, <:Tuple},
        Field{<:AbstractFloat, 2, Tuple{Vertex_, K_}, <:Tuple},
        Field{<:AbstractFloat, 2, Tuple{Vertex_, K_}, <:Tuple},
    }
end

function St_from_mesh(mesh::AtlasMesh)
    vertex_dim = getfield(mesh, Symbol(DIMENSION_TO_SIZE_ATTR[Vertex]))
    k_dim = getfield(mesh, Symbol(DIMENSION_TO_SIZE_ATTR[K]))
    return StateContainer(
        Field((Vertex, K), zeros((vertex_dim, k_dim))),
        (
            Field((Vertex, K), zeros((vertex_dim, k_dim))),
            Field((Vertex, K), zeros((vertex_dim, k_dim))),
            Field((Vertex, K), zeros((vertex_dim, k_dim)))
        )
    )
end

    