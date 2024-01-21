FROM nginx:stable-alpine

# Install deps
RUN apk add --no-cache git
RUN apk add --no-cache openssh
RUN apk add --no-cache yarn

# Build from remote
WORKDIR /data
RUN git clone https://github.com/Scthe/texture-extractor /data/app
WORKDIR /data/app
RUN yarn install
RUN yarn build
RUN touch build/.nojekyll
RUN cp -R build/. /usr/share/nginx/html/