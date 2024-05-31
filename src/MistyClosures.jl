module MistyClosures

using Core: OpaqueClosure
using Core.Compiler: IRCode

struct MistyClosure{Toc<:OpaqueClosure}
    oc::Toc
    ir::IRCode
    function MistyClosure(ir::IRCode; kwargs...)
        oc = OpaqueClosure(ir; kwargs...)
        return new{typeof(oc)}(oc, ir)
    end
end

(mc::MistyClosure)(x::Vararg{Any, N}) where {N} = mc.oc(x...)

export MistyClosure

end
