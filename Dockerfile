FROM alpine:3.20 AS su-exec-src
RUN apk add --no-cache su-exec

FROM n8nio/n8n:2.28.6

USER root

COPY --from=su-exec-src /sbin/su-exec /usr/local/bin/su-exec

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]
