# Read instructions from mountebank.dockerfile. The only difference is adding --debug option when starting the server
# When --debug is added, 
# Include a matches array with each stub in the body of a GET imposter response for debugging why a particular stub did or did not match a request.
# http://www.mbtest.org/docs/api/overview#get-imposter

FROM alpine:3.2

EXPOSE 2525
ENTRYPOINT ["mb"]
CMD ["start","--debug"]
ENV MOUNTEBANK_VERSION=1.6.0

RUN apk add --update nodejs
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production
