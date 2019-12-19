FROM node:alpine as builder

COPY ./ /scratch-gui
RUN cd scratch-gui \
    && npm install \
    && npm run build

FROM nginx:alpine
COPY --from=builder /scratch-gui/build /usr/share/nginx/html
