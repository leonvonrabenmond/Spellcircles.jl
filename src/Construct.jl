        """
           polygonpt(n,r,o)

       Compute all points of any regular `n`-polygon with radius `r`.

       The first point is located at `(0,r)` and all further points are added clockwise. The polygons can be orientated with an angle of `o`.

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
    blank(r)

    Creates a blank spellcircle with an outer radius of `r`.

     """
function blank(r::Int)
	global spellcirclestart =  """<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100%" height="100%" viewBox="-$(r+1) -$(r+1) $(2 * (r+1)) $(2 * (r+1))">
	      	<circle cx="0" cy="0" r="$r" stroke="black" stroke-width="1" fill="none" />
	      """;
	global spellcircleend = """</svg>""";
	global spellcircle = [spellcirclestart];
	return nothing
end

"""
    construct(n)

    Constructs the spellcircle and outputs it as an svg file with name `n`.
     """
function construct(n::String)
	spellname = n
	push!(spellcircle, spellcircleend)
	stringcircle = join(spellcircle)
	spellcircleconstruct = open("$spellname.svg","w")
	write(spellcircleconstruct, stringcircle)
	close(spellcircleconstruct)
end


"""
    polygon(n,r,o)

       Constructs a regular `n`-polygon with radius `r`.

       The first point is located at `(0,r)` and all further points are added clockwise. The polygons can be orientated with an angle of `o`.
"""
function polygon(n::Number,r::Number;orientation::Number=0,x::Number=0,y::Number=0, stroke::String="black", width::Number=1, fill::String="none")
	pt = polygonpt(n,r,orientation=orientation,x=x,y=y)
	polystart = ["""	<polygon points=" """]
	polyend= ["""" fill="$fill" stroke="$stroke" stroke-width="$width" />
		  """]
	polygonmid = [""" $(pt[i][1]),$(-1*pt[i][2]) """ for i in 1:length(pt)]
	polygonarr = cat(polystart, polygonmid, polyend; dims=1)
	polygon = join(polygonarr)
	push!(spellcircle, polygon)
	return nothing
end


"""
    circle(r)

    Constructs a circle with radius `r`.
"""
function circle(r::Number; x::Number=0,y::Number=0, stroke::String="black", width::Number=1, fill::String="none")
	circle = """	<circle cx="$x" cy="$(-y)" r="$r" stroke="$stroke" stroke-width="$width" fill="$fill" />
	      """
	push!(spellcircle, circle)
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
		if j-1 ≤ i ≤ j+1
		        continue
		elseif [points[j],points[i]] ∈ polygramln
		        continue
		elseif ((i == 1) & (j == n)) | ((j == 1) & (i == n))
			continue
		else
			push!(polygramln, [points[i],points[j]])
		end
	end
end
return polygramln
end



function polygram(n::Number,r::Number;orientation::Number=0,x::Number=0,y::Number=0, stroke::String="black", width::Number=1, fill::String="none", edges::Int=1)
    if edges > (n-3)
        println("edges must not be larger than (n-3). $edges > $(n-3)")
        return nothing
    end
    pt = polygrampt(n,r,orientation=orientation,x=x,y=y, edges=edges)
    for i in 1:length(pt)
	       polygram = """   <line x1="$(pt[i][1][1])" y1="$(-pt[i][1][2])" x2="$(pt[i][2][1])" y2="$(-pt[i][2][2])" fill="$fill" stroke="$stroke" stroke-width="$width" """
	       push!(spellcircle, polygram)
    end
	return nothing
end
