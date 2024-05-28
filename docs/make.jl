using MistyClosures
using Documenter

DocMeta.setdocmeta!(MistyClosures, :DocTestSetup, :(using MistyClosures); recursive=true)

makedocs(;
    modules=[MistyClosures],
    authors="Will Tebbutt, Frames White, and Hong Ge",
    sitename="MistyClosures.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
