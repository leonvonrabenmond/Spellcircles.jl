using Spellcircles
using Documenter

DocMeta.setdocmeta!(Spellcircles, :DocTestSetup, :(using Spellcircles); recursive=true)

makedocs(;
    modules=[Spellcircles],
    authors="Leon von Rabenmond",
    repo="https://github.com/leonvonrabenmond/Spellcircles.jl/blob/{commit}{path}#{line}",
    sitename="Spellcircles.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://leonvonrabenmond.github.io/Spellcircles.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/leonvonrabenmond/Spellcircles.jl",
    devbranch="main",
)
