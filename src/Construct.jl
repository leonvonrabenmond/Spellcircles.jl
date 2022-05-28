"""
           polygonpt(n,r)

       Compute all points of any regular `n`gon with radius `r`.

       The first point is located at `(0,r)` and all further points are added clockwise.

       # Examples
       ```julia-repl
       julia> polygonpt(3,1)
       3-element Vector{Tuple{Float64, Float64}}:
        (0.0, 1.0)
        (0.87, -0.5)
        (-0.87, -0.5)
       ```
       """
       function polygonpt(n,r)
             complexvectors = [round(r*ℯ^(deg2rad(90-i*360/n) * im), digits = 2) for i ∈ 0:(n-1)];
             polygonptpt = [(real(complexvectors[i]), imag(complexvectors[i])) for i ∈ 1:length(complexvectors)]
      end

