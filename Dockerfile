FROM janpk/oraclejava8:latest
LABEL maintainer Jan-Petter Kruger <jpk@mosedotten.com>

WORKDIR /app

EXPOSE 9001

ENV HSQLDB_VERSION 2.3.3

RUN wget -O /app/hsqldb.jar http://central.maven.org/maven2/org/hsqldb/hsqldb/${HSQLDB_VERSION}/hsqldb-${HSQLDB_VERSION}.jar && \
    wget -O /app/sqltool.jar http://central.maven.org/maven2/org/hsqldb/sqltool/${HSQLDB_VERSION}/sqltool-${HSQLDB_VERSION}.jar

ENTRYPOINT java -cp /app/hsqldb.jar org.hsqldb.Server -database.0 mem:test -dbname.0 test -trace true -silent false -remote_open true
