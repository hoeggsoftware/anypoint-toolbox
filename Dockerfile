FROM node
MAINTAINER ryan@hoegg.software

RUN apt-get update && apt-get install -y jq \
 && rm -rf /var/lib/apt/lists/*
 RUN npm install anypoint-cli

ENV PATH=/node_modules/.bin/:$PATH

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY is-app-started.sh /bin/is-app-started
COPY deploy.sh /bin/deploy

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "help" ]