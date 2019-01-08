# Note: Ubuntu is being used due to familiarity only
FROM ubuntu:18.04

COPY . /app
WORKDIR /app

USER root

# Julia install dependencies and Python development
RUN apt-get update && apt-get install -yq --no-install-recommends \
    wget \
    ca-certificates \
    python3 \
    python3-dev \
    python3-pip


# Julia dependencies
# Install Julia packages in /opt/julia instead of $HOME
ENV JULIA_DEPOT_PATH=/opt/julia
ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=1.0.2

RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    echo "e0e93949753cc4ac46d5f27d7ae213488b3fef5f8e766794df0058e1b3d2f142 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Install PyJulia requirement PyCall
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e 'import Pkg; Pkg.add("PyCall")'

# Install PyJulia
RUN python3 -m pip install julia && \
    python-jl --version

# Use the command python-jl, because finding the julia install is hard
CMD ["python-jl", "app.py"]
