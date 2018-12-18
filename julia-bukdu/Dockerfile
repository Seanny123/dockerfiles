FROM julia:1.0.2

COPY . /app
WORKDIR /app

# Install PyJulia requirement PyCall
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e 'using Pkg; pkg"add https://github.com/wookay/Bukdu.jl"'

EXPOSE 8080

CMD ["julia", "app.jl"]
