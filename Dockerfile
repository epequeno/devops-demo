FROM ubuntu:20.04
# Note: NOT using the `latest` tag to help ensure repeatable builds
# ideally I'd use scratch or distroless containers to reduce the number of 
# packages in the container for both size and security purposes but for the sake
# of brevity I'll go ahead and use a full os image.
# see: https://sysdig.com/blog/dockerfile-best-practices/

WORKDIR /app

# run privileged commands
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install wget -y && \
    chown --recursive nobody /app && \
    wget https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz && \
    tar xzf litecoin-0.18.1-x86_64-linux-gnu.tar.gz && \
    rm litecoin-0.18.1-x86_64-linux-gnu.tar.gz

# run as non-root user
USER nobody

# provide a writeable location for litecoin data 
RUN mkdir data

CMD ["/app/litecoin-0.18.1/bin/litecoind", "-datadir=/app/data"]