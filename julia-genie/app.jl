using Genie

import Genie.Router: route, @params
import Base.convert


convert(::Type{Int}, s::SubString{String}) = parse(Int, s)


route("/sum/:x::Int/:y::Int") do
    @params(:x) + @params(:y)
end

route("/hello") do
    "Welcome to Genie!"
end

route("/") do
    "root"
end

Genie.AppServer.startup(8080)

Base.JLOptions().isinteractive == 0 && wait()
