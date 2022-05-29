using Spellcircles
using Test

@testset "Spellcircles.jl" begin
    # Write your tests here.
end

@testset "Construct.jl" begin
	@test polygonpt(3,1,180) == [(0.0, 1.0),(-0.87, -0.5),(0.87, -0.5)]
end
