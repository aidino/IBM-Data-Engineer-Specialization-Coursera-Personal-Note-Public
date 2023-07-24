## Infrastructure

- **Airflow Official**
  - x.x.x.x:8080
  - username: airflow (_AIRFLOW_WWW_USER_USERNAME)
  - password: airflow (_AIRFLOW_WWW_USER_PASSWORD)

- **Postgres**
  - x.x.x.x:5432
  - db: postgres
  - user: admin (POSTGRES_USER)
  - password: admin (POSTGRES_PASSWORD)


- **Kafka**
  - `export DOCKER_HOST_IP=x.x.x.x`
  - **Full stack**
    - file: `full-stack`
    - login: `admin@admin.io`
    - password: `admin`
    - Conduktor-platform: `$DOCKER_HOST_IP:8080`
    - Single Zookeeper: `$DOCKER_HOST_IP:2181`
    - Single Kafka: `$DOCKER_HOST_IP:9092`
    - Kafka Schema Registry: `$DOCKER_HOST_IP:8081`
    - Kafka Rest Proxy: `$DOCKER_HOST_IP:8082`
    - Kafka Connect: `$DOCKER_HOST_IP:8083`
    - KSQL Server: `$DOCKER_HOST_IP:8088`
    - (experimental) JMX port at `$DOCKER_HOST_IP:9001`

  - **Single Zookeeper / Single Kafka**
    - file: `zk-single-kafka-single.yml`
    - Zookeeper will be available at `$DOCKER_HOST_IP:2181`
    - Kafka will be available at `$DOCKER_HOST_IP:9092`
    - (experimental) JMX port at `$DOCKER_HOST_IP:9999`

  - **Single Zookeeper / Multiple Kafka**
    - file: `zk-single-kafka-multiple.yml`
    - Zookeeper will be available at `$DOCKER_HOST_IP:2181`
    - Kafka will be available at `$DOCKER_HOST_IP:9092,$DOCKER_HOST_IP:9093,$DOCKER_HOST_IP:9094`
  
  - **Multiple Zookeeper / Single Kafka**
    - file: `zk-multiple-kafka-single.yml`
    - Zookeeper will be available at `$DOCKER_HOST_IP:2181,$DOCKER_HOST_IP:2182,$DOCKER_HOST_IP:2183`
    - Kafka will be available at `$DOCKER_HOST_IP:9092`
    - (experimental) JMX port at `$DOCKER_HOST_IP:9999`


  - **Multiple Zookeeper / Multiple Kafka**
    - file: `zk-multiple-kafka-multiple.yml`
    - Zookeeper will be available at `$DOCKER_HOST_IP:2181,$DOCKER_HOST_IP:2182,$DOCKER_HOST_IP:2183`
    - Kafka will be available at `$DOCKER_HOST_IP:9092,$DOCKER_HOST_IP:9093,$DOCKER_HOST_IP:9094`

- **Superset - BI tools**
  - update: `x-superset-image: ... superset:${TAG:-latest-dev}` to `x-superset-image: ... superset:2.1.0` in `docker-compose-non-dev.yml`
  - file: `docker-compose-non-dev.yml`
  - x.x.x.x:8088
  - username: admin
  - password: admin

- **MongoDB**
  - mongo: x.x.x.x:27017
  - mongo-express: x.x.x.x:8081
  - username: admin
  - password: adminpass 

- **Cassandra**
  - x.x.x.x: 9042
  - CASSANDRA_SEEDS=cassandra
  - CASSANDRA_PASSWORD_SEEDER=yes
  - CASSANDRA_PASSWORD=cassandra