FROM node:6.9.4

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json tools/ $HOME/workoutlogger/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/workoutlogger
RUN npm install

USER root
COPY . $HOME/workoutlogger
RUN chown -R app:app $HOME/*
USER app

CMD ["npm", "start", "-s"]
