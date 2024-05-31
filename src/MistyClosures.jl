module MistyClosures

using Core: OpaqueClosure
using Core.Compiler: IRCode

struct MistyClosure{Toc<:OpaqueClosure}
    oc::Toc
    ir::IRCode
end

MistyClosure(ir::IRCode; kwargs...) =  MistyClosure(OpaqueClosure(ir; kwargs...), ir)

(mc::MistyClosure)(x::Vararg{Any, N}) where {N} = mc.oc(x...)

export MistyClosure

end
