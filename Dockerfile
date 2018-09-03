FROM teracy/angular-cli:1.5.0 as compiler

ADD . hello-k8s

RUN cd hello-k8s ; \
    npm install ; \
    ng build --base-href src

FROM nginx:1.13.8-alpine-perl

ADD config/server.conf /etc/nginx/conf.d/default.conf
ADD config/nginx.conf /etc/nginx/nginx.conf
COPY --from=compiler hello-k8s/dist /usr/share/nginx/html/hello-k8s

