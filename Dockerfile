FROM alpine:3.20.2

MAINTAINER Cycloid <devops-team@cycloid.io>

# curl -L -s https://dl.k8s.io/release/stable.txt
ARG KUBE_VERSION=v1.29.8

RUN apk add --update --no-cache ca-certificates curl jq \
    && curl -L https://dl.k8s.io/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Replace for non-root version
ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
