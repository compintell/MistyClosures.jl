module MistyClosures

using Core: OpaqueClosure
using Core.Compiler: IRCode

struct MistyClosure{Toc<:OpaqueClosure}
    oc::Toc
    ir::IRCode
end

(mc::MistyClosure)(x::Vararg{Any, N}) where {N} = mc.oc(x...)

export MistyClosure

end
