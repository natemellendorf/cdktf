FROM hashicorp/terraform:1.1.8 AS terraform
FROM node:current-alpine3.15

COPY --from=terraform /bin/terraform /usr/local/bin/

RUN apk add python3 && npm install --global \
cdktf-cli@latest \
@cdktf/provider-aws

ENTRYPOINT ["/bin/ash"]
