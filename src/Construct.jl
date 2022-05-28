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
       function polygonpt(n::Int,r::Int,o::Int=0)
             complexvectors = [round(r*ℯ^(-1*deg2rad(90-i*360/n -o) * im), digits = 2) for i ∈ 0:(n-1)];
             polygonptpt = [(real(complexvectors[i]), imag(complexvectors[i])) for i ∈ 1:length(complexvectors)]
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
	msg = "Blank spellcirlce with a radius of 100 has been created."
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
function polygon(n::Int,r::Int,o::Int=0)
	pt = polygonpt(n,r,o)
	polystart = ["""<polygon points=" """]
	polyend= ["""" fill="none" stroke="black" />"""]
	polygonmid = [""" $(pt[i][1]),$(pt[i][2]) """ for i in 1:length(pt)]
	polygonarr = cat(polystart, polygonmid, polyend; dims=1)
	polygon = join(polygonarr)
	push!(spellcircle, polygon)
	return nothing
	end
