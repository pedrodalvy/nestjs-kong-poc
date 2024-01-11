FROM node:20.10.0-alpine As development

WORKDIR /app

COPY --chown=node:node package*.json ./
RUN yarn install --frozen-lockfile
COPY --chown=node:node . .

USER node

FROM node:20.10.0-alpine As build

WORKDIR /app

COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /app/node_modules ./node_modules
COPY --chown=node:node . .

RUN npm run build

ENV NODE_ENV production
RUN yarn install --frozen-lockfile --production && yarn cache clean

USER node

FROM node:20.10.0-alpine

COPY --chown=node:node --from=build /app/node_modules ./node_modules
COPY --chown=node:node --from=build /app/dist ./dist

CMD [ "node", "dist/main.js" ]
