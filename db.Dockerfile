# Use a TimescaleDB image that includes pgvector.
# Check https://hub.docker.com/r/timescale/timescaledb-ha for available tags
FROM timescale/timescaledb-ha:pg15-all

# Install MADlib
# MADlib requires postgresql-server-dev or equivalent for compilation
# and other dependencies like cmake, g++, etc.
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cmake \
    g++ \
    libboost-all-dev \
    libeigen3-dev \
    postgresql-server-dev-15 \
    # postgresql-common needs to be explicitly installed for pg_config
    postgresql-common \
    # For MADlib installation process
    wget \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download and install MADlib
# Check for the latest version compatible with PostgreSQL 15
# Using a known version for now
ARG MADLIB_VERSION=1.19.0
RUN wget https://downloads.apache.org/madlib/apache-madlib-${MADLIB_VERSION}/apache-madlib-${MADLIB_VERSION}-src.tar.gz && \
    tar -xzf apache-madlib-${MADLIB_VERSION}-src.tar.gz && \
    cd apache-madlib-${MADLIB_VERSION}-src && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    make install

# Switch back to postgres user
USER postgres

# TODO: Investigate installation for Korvus, Mistral, pgraph extensions.
# These may require specific build instructions or pre-compiled binaries
# compatible with this PostgreSQL version and environment.
# For now, they are not included.

# Optional: Add a script to initialize extensions in new databases if needed,
# or handle this through initdb scripts / entrypoint customizations.
# For example, to install MADlib in a specific database:
# After the database starts, connect to it and run:
# CREATE EXTENSION madlib;

# pgvector should be pre-installed in timescale/timescaledb-ha:pg15-all
# To verify after container start:
# Connect to psql and run:
# CREATE EXTENSION IF NOT EXISTS vector;
# \dx (to list installed extensions)

# Default PostgreSQL port
EXPOSE 5432
