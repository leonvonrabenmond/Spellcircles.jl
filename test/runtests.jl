using Spellcircles
using Test

@testset "Spellcircles.jl" begin
    # Write your tests here.
end

@testset "Construct.jl" begin
	@test polygonpt(3,1) == [(0.0, 1.0),(0.87, -0.5),(-0.87, -0.5)]
	@test polygonpt(12,4) == [(0.0, 4.0),(2.0, 3.46),(3.46, 2.0),(4.0, 0.0),(3.46, -2.0),(2.0, -3.46),(0.0, -4.0),(-2.0, -3.46),(-3.46, -2.0),(-4.0, -0.0),(-3.46, 2.0),(-2.0, 3.46)]
	@test polygonpt(3,1,180) == [(0.0, 1.0),(-0.87, -0.5),(0.87, -0.5)]
end
