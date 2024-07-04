module MistyClosures

using Core: OpaqueClosure
using Core.Compiler: IRCode

struct MistyClosure{Toc<:OpaqueClosure}
    oc::Toc
    ir::IRCode
end

MistyClosure(ir::IRCode; kwargs...) =  MistyClosure(OpaqueClosure(ir; kwargs...), ir)

(mc::MistyClosure)(x::Vararg{Any, N}) where {N} = mc.oc(x...)

# You can't deepcopy an `IRCode` because it contains a module.
function Base.deepcopy_internal(x::T, dict::IdDict) where {T<:MistyClosure}
    return T(Base.deepcopy_internal(x.oc, dict), x.ir)
end

export MistyClosure

end
