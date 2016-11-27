# A simple mountebank server
# BUILD
# 1. docker build -t mymountebank -f mountebank.dockerfile .
# SHIP (optional)
# 1. docker push mymountebank:latest <docker_registry> --  i.e. if you wish to share this docker image through a central registry
# RUN
# Start a plain mountebank server listening on host port 2525. Assuming you need 10 ports for creating new imposters, expose 4545-4555
# 1. docker run --name mymountebank-1 -d -p 2525:2525 -p 4545-4555:4545-4555 mymountebank:latest 
# Start a mountebank server by injecting imposters
# docker run  -v $(pwd)/templates:/templates -p IMPOSTER_1_PORT:IMPOSTER_1_PORT ...] -p 2525:2525 -d mymountebank:latest --configfile templates/imposters.ejs --allowInjection
# e.g. docker run -v $(pwd)/templates/sample:/templates -p 4546:4546 -p 5555:5555 -p 2525:2525 -d mymountebank:latest --configfile templates/imposters.ejs --allowInjection

FROM alpine:3.2
ENV MOUNTEBANK_VERSION=1.6.0
EXPOSE 2525

RUN apk add --update nodejs
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

ENTRYPOINT ["mb"]
CMD ["start"]