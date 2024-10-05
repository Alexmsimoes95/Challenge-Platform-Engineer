FROM oraclelinux:9

RUN yum update -y && yum install -y wget openssl java-17-openjdk.x86_64

ENV JAVA_HOME=/usr
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

RUN wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.tar.gz -O /tmp/tomcat.tar.gz \
    && mkdir -p $CATALINA_HOME \
    && tar xzf /tmp/tomcat.tar.gz --strip-components=1 -C $CATALINA_HOME \
    && rm /tmp/tomcat.tar.gz

COPY . $CATALINA_HOME


RUN cd $CATALINA_HOME \
&& openssl genpkey -algorithm RSA -out tomcat-key.pem \
&& openssl req -new -key tomcat-key.pem -out tomcat.csr -subj "/C=PT/ST=Lisboa/L=Lisboa/O=MyCompany/OU=IT/CN=tomcat.challenge" \
&& openssl x509 -req -in tomcat.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out tomcat-cert.pem -days 365 -sha256 \ 
&& openssl pkcs12 -export -in tomcat-cert.pem -inkey tomcat-key.pem -out tomcat.p12 -name tomcat -CAfile ca-cert.pem -caname root -password pass:xpandit \
&& keytool -importkeystore -deststorepass xpandit -destkeypass xpandit -destkeystore keystore.jks -srckeystore tomcat.p12 -srcstoretype PKCS12 -srcstorepass xpandit -alias tomcat

RUN cp $CATALINA_HOME/keystore.jks $CATALINA_HOME/conf \
&& cp $CATALINA_HOME/server.xml $CATALINA_HOME/conf/server.xml \
&& sed -i '/<\/Context>/i <Loader jakartaConverter="TOMCAT"/>' $CATALINA_HOME/conf/context.xml \
&& chmod ug+rwx $CATALINA_HOME/conf/keystore.jks \
&& chmod o+rx $CATALINA_HOME/conf/keystore.jks

RUN wget https://tomcat.apache.org/tomcat-10.0-doc/appdev/sample/sample.war -O $CATALINA_HOME/webapps/challenge.war

EXPOSE 4041

CMD ["catalina.sh","run"]
