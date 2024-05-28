using MistyClosures, Test

using Core: OpaqueClosure
using Core.Compiler: IRCode

@testset "MistyClosures.jl" begin
    ir = Base.code_ircode_by_type(Tuple{typeof(sin), Float64})[1][1]
    oc = OpaqueClosure(ir; do_compile=true)
    mc = MistyClosure(oc, ir)
    @test mc(5.0) == sin(5.0)
end
