#SAMPLE DOCKERFILE
FROM google/cloud-sdk:alpine

RUN apk --no-cache add ca-certificates && update-ca-certificates
RUN apk --no-cache add openjdk8

COPY . .
#RUN touch /tmp/healthy
ENTRYPOINT [ "npm", "run", "dev" ]
