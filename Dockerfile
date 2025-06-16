FROM ubuntu:22.04

ARG VERSION=0.5.2
ADD https://github.com/Arch-Network/arch-node/releases/download/v${VERSION}/local_validator-x86_64-unknown-linux-gnu \
    /usr/local/bin/validator
RUN chmod +x /usr/local/bin/validator

ENV NETWORK_MODE=testnet
ENV DATA_DIR=/data
ENV RPC_BIND_IP=0.0.0.0
ENV RPC_BIND_PORT=9000
# ENV BOOT_NODE_ENDPOINT=
# ENV P2P_BIND_PORT=7000
# ENV ELECTRS_ENDPOINT=
ENV TITAN_ENDPOINT=http://127.0.0.1:3030

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["exec /usr/local/bin/validator \
      --rpc-bind-ip \"$RPC_BIND_IP\" \
      --rpc-bind-port \"$RPC_BIND_PORT\" \
      --titan-endpoint \"$TITAN_ENDPOINT\"" \
]