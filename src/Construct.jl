# Universal
"""
blank()

Creates a blank spellcircle.

"""
function blank()
	global rawspellcircle = [];
    return nothing
end


"""
construct()

Constructs the spellcircle.

# Arguments
- `name::String`: Names the svg file.
- `size::Int`: Size of a square svg from the middle.
- `pagedimensions::Tuple{Int64, Int64}`: Sets of the size of the svg from the middle in the `(x,y)`-directions.
- `custom::Bool`: If `true` then the outer circle will not be drawn.

"""
function construct(;name::String="Spellcircle", size::Int=100, custom::Bool=false, pagedimensions::Tuple{Int64, Int64}=(size,size))
    # Svg fluff
    spellcirclestart =  """<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100%" height="100%" viewBox="-$(pagedimensions[1]+1) -$(pagedimensions[2]+1) $(2 * (pagedimensions[1]+1)) $(2 * (pagedimensions[2]+1))">
	      """;
    pushfirst!(rawspellcircle,spellcirclestart)
    spellcircleend = """\n</svg>""";

    # Custom?
    if custom == false
        circle(size)
    end

    #Construct
    push!(rawspellcircle, spellcircleend)
	stringcircle = join(rawspellcircle)
	spellcircleconstruct = open("$name-$(Dates.now()).svg","w")
	write(spellcircleconstruct, stringcircle)
	close(spellcircleconstruct)
end

# Polygons
"""
polygonpt(n,r)

Compute all points of any regular `n`-polygon with radius `r`.

The first point is located at `(0,r)` and all further points are added clockwise.

# Arguements
- `orientation::Number`: Rotates the polygon clockwise by `θ` degrees.
- `x::Number`: Moves polygon by `x`.
- `y::Number`: Moves polygon by `y`.

# Examples
```julia-repl
julia> polygonpt(3,1)
3-element Vector{Tuple{Float64, Float64}}:
  (0.0, 1.0)
  (0.87, -0.5)
  (-0.87, -0.5)
```
"""
function polygonpt(n::Number,r::Number;orientation::Number=0,x::Number=0,y::Number=0)
    complexvectors = [round(r*ℯ^(deg2rad(90-i*360/n -orientation) * im), digits = 2) for i ∈ 0:(n-1)];
	polygonptpt = [[real(complexvectors[i])+x, imag(complexvectors[i])+y] for i ∈ 1:length(complexvectors)]
end


"""
polygon(n,r)

Constructs a regular `n`-polygon with radius `r`.

# Arguments
- `orientation::Number`: Rotates the polygon clockwise by `θ` degrees.
- `x::Number`: Moves polygon by `x`.
- `y::Number`: Moves polygon by `y`.
- `stroke::String`: Sets the colour of the lines.
- `width::Number`: Sets the width of the lines.
- `fill::String`: Sets background colour of the polygon.

"""
function polygon(n::Number,r::Number;orientation::Number=0,x::Number=0,y::Number=0, stroke::String="black", width::Number=1, fill::String="none")
	pt = polygonpt(n,r,orientation=orientation,x=x,y=y)
	polystart = ["""	<polygon points=" """]
	polyend= ["""" fill="$fill" stroke="$stroke" stroke-width="$width" />
		  """]
	polygonmid = [""" $(pt[i][1]),$(-1*pt[i][2]) """ for i in 1:length(pt)]
	polygonarr = cat(polystart, polygonmid, polyend; dims=1)
	polygon = join(polygonarr)
	push!(rawspellcircle, polygon)
	return nothing
end


function polygrampt(n::Number,r::Number;orientation::Number=0,x::Number=0,y::Number=0,edges::Int=1)
if edges > (n-3)
    println("edges must not be larger than (n-3). $edges > $(n-3)")
    return nothing
end
points = polygonpt(n,r, orientation=orientation,x=x,y=y)
polygramln = []
for i ∈ 1:n
	for j ∈ 1:n
		if j-edges ≤ i ≤ j+edges
		        continue
		elseif [points[j],points[i]] ∈ polygramln
		        continue
		elseif ((i == 1) & (j == n)) | ((j == 1) & (i == n))
			continue
        elseif ((i-1-edges+7)%n ≤ j ≤ (i-1+edges)%n) | (j-1-edges+7)%n ≤ i ≤ (j-1+edges)%n
            continue
		else
			push!(polygramln, [points[i],points[j]])
		end
	end
end
return polygramln
end


"""
polygram(n,r)

Constructs a `n`-polygram with radius `r`.

# Arguments
- `orientation::Number`: Rotates the polygon clockwise by `θ` degrees.
- `x::Number`: Moves polygon by `x`.
- `y::Number`: Moves polygon by `y`.
- `stroke::String`: Sets the colour of the lines.
- `width::Number`: Sets the width of the lines.
- `fill::String`: Sets background colour of the polygon.
- `edges::Int`: Unfinished.

"""
function polygram(n::Number, r::Number; orientation::Number=0, x::Number=0, y::Number=0, stroke::String="black", width::Number=1, fill::String="none", edges::Int=1)
    if edges > (n-3)
        println("edges must not be larger than (n-3). $edges > $(n-3)")
        return nothing
    end
    pt = polygrampt(n,r,orientation=orientation,x=x,y=y, edges=edges)
    for i in 1:length(pt)
	       polygram = """   <line x1="$(pt[i][1][1])" y1="$(-pt[i][1][2])" x2="$(pt[i][2][1])" y2="$(-pt[i][2][2])" fill="$fill" stroke="$stroke" stroke-width="$width" /> """
	       push!(rawspellcircle, polygram)
    end
	return nothing
end

# Circles
"""
circle(r)

Constructs a circle with radius `r`.

# Arguments
- `x::Number`: Moves polygon by `x`.
- `y::Number`: Moves polygon by `y`.
- `stroke::String`: Sets the colour of the lines.
- `width::Number`: Sets the width of the lines.
- `fill::String`: Sets background colour of the polygon.
"""
function circle(r::Number; x::Number=0,y::Number=0, stroke::String="black", width::Number=1, fill::String="none")
	circle = """	<circle cx="$x" cy="$(-y)" r="$r" stroke="$stroke" stroke-width="$width" fill="$fill" />
	      """
	push!(rawspellcircle, circle)
	return nothing
end
