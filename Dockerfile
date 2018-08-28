FROM teracy/angular-cli:1.5.0 as compiler

ADD . hello-k8s

RUN cd hello-k8s ; \
    npm install ; \
    ng build --base-href src

FROM nginx:stable-alpine

COPY --from=compiler hello-k8s/dist /usr/share/nginx/html
