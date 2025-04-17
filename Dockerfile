FROM maven
# RUN git clone https://gitlab.com/ongresinc/txbenchmark.git
COPY txbenchmark /txbenchmark
RUN cd /txbenchmark && mvn install -DskipTests=false
RUN ln -s /txbenchmark/cli/target/benchmark-1.3.jar ./benchmark.jar
CMD ["java", "-jar", "/txbenchmark/cli/target/benchmark-1.3.jar"]  

