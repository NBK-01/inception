# latest alpine version is 3.22 hence the use of (penultimate) 3.21
FROM alpine:3.21

#		installing mariadb       #
RUN apk update && apk add mariadb mariadb-client

## adding a user group and user mysql (following mariadb official image) ##		
RUN addgroup -g 4242 mysql && \
    adduser -u 4242 -G mysql -s /sbin/nologin -D mysql

### copy conf and tools file into /etc/ ###
COPY ./tools/db.sh /usr/local/bin/db.sh
COPY ./conf/maraidb.conf /etc/mariadb.conf

#### Create directories and change ownership to mysql ####
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

##### give exec perms to entrypoint script #####
RUN chmod +x /usr/local/bin/db.sh

###### switching to user (mysql) ######
USER mysql

####### expose port ######
EXPOSE 3306

########  run script ######## 
ENTRYPOINT ["/usr/local/bin/db.sh"]


