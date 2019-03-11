FROM node:lts-alpine
COPY --chown=root:root ./dist /authserver/
COPY --chown=root:root ./authserver.sh /authserver/authserver.sh
COPY --chown=root:root ./package.json /authserver/package.json

WORKDIR "/authserver"
RUN ls -lart
RUN npm install

EXPOSE 7070/tcp

RUN chmod +x /authserver/authserver.sh
CMD ["/bin/sh", "/authserver/authserver.sh"]