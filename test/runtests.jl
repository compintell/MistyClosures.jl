using MistyClosures, Test

using Core: OpaqueClosure

@testset "MistyClosures.jl" begin
    ir = Base.code_ircode_by_type(Tuple{typeof(sin), Float64})[1][1]

    # Recommended constructor.
    mc = MistyClosure(ir; do_compile=true)
    @test @inferred(mc(5.0)) == sin(5.0)

    # Default constructor.
    mc_default = MistyClosure(OpaqueClosure(ir; do_compile=true), ir)
    @test @inferred(mc_default(5.0) == sin(5.0))

    # deepcopy
    @test deepcopy(mc) isa typeof(mc)
end
