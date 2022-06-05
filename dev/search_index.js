var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Spellcircles","category":"page"},{"location":"#Spellcircles","page":"Home","title":"Spellcircles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Spellcircles.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Spellcircles]","category":"page"},{"location":"#Spellcircles.blank-Tuple{}","page":"Home","title":"Spellcircles.blank","text":"blank()\n\nCreates a blank spellcircle.\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.circle-Tuple{Number}","page":"Home","title":"Spellcircles.circle","text":"circle(r)\n\nDraws a circle with radius r.\n\nArguments\n\nx::Number: Moves polygon by x.\ny::Number: Moves polygon by y.\nstroke::String: Sets the colour of the lines.\nwidth::Number: Sets the width of the lines.\nfill::String: Sets background colour of the polygon.\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.construct-Tuple{}","page":"Home","title":"Spellcircles.construct","text":"construct()\n\nConstructs the spellcircle.\n\nArguments\n\nname::String: Names the svg file.\nsize::Int: Size of a square svg from the middle.\npagedimensions::Tuple{Int64, Int64}: Sets of the size of the svg from the middle in the (x,y)-directions.\ncustom::Bool: If true then the outer circle will not be drawn.\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.lines-Tuple{Tuple{Number, Number}, Tuple{Int64, Int64}}","page":"Home","title":"Spellcircles.lines","text":"lines(pt1,pt2)\n\nDraws a line from pt1 to pt2, where each point is a tuple of (x,y).\n\nArguments\n\nstroke::String: Sets the colour of the lines.\nwidth::Number: Sets the width of the lines.\nfill::String: Sets background colour of the polygon.\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.polygon-Tuple{Number, Number}","page":"Home","title":"Spellcircles.polygon","text":"polygon(n,r)\n\nConstructs a regular n-polygon with radius r.\n\nArguments\n\norientation::Number: Rotates the polygon clockwise by θ degrees.\nx::Number: Moves polygon by x.\ny::Number: Moves polygon by y.\nstroke::String: Sets the colour of the lines.\nwidth::Number: Sets the width of the lines.\nfill::String: Sets background colour of the polygon.\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.polygonpt-Tuple{Number, Number}","page":"Home","title":"Spellcircles.polygonpt","text":"polygonpt(n,r)\n\nCompute all points of any regular n-polygon with radius r.\n\nThe first point is located at (0,r) and all further points are added clockwise.\n\nArguements\n\norientation::Number: Rotates the polygon clockwise by θ degrees.\nx::Number: Moves polygon by x.\ny::Number: Moves polygon by y.\n\nExamples\n\njulia> polygonpt(3,1)\n3-element Vector{Tuple{Float64, Float64}}:\n  (0.0, 1.0)\n  (0.87, -0.5)\n  (-0.87, -0.5)\n\n\n\n\n\n","category":"method"},{"location":"#Spellcircles.polygram-Tuple{Number, Number}","page":"Home","title":"Spellcircles.polygram","text":"polygram(n,r)\n\nConstructs a n-polygram with radius r.\n\nArguments\n\norientation::Number: Rotates the polygon clockwise by θ degrees.\nx::Number: Moves polygon by x.\ny::Number: Moves polygon by y.\nstroke::String: Sets the colour of the lines.\nwidth::Number: Sets the width of the lines.\nfill::String: Sets background colour of the polygon.\nedges::Int: Unfinished.\n\n\n\n\n\n","category":"method"}]
}