FROM bde2020/spark-master:2.3.0-hadoop2.7

# Install python 3.6 and modules
RUN echo 'deb http://ftp.jp.debian.org/debian testing main' >> /etc/apt/sources.list \
    && apt-get-install python3.6 python3.6-distutils \
    && curl https://bootstrap.pypa.io/get-pip.py | python3.6 \
    && pip install --upgrade jupyter jupyter_contrib_nbextensions \
    && pip install --upgrade pandas numpy scipy scikit-learn matplotlib tensorflow tensorflowonspark \
    && pip install --upgrade easydict

ENV SPARK_HOME /spark
ENV SPARK_MASTER "spark://spark-master:7077"
ENV PYSPARK_LOG /spark/logs
ENV PYSPARK_DATA /spark/data
ENV PYSPARK_PYTHON /usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON /usr/bin/python3

RUN mkdir -p $PYSPARK_LOG \
    && ln -sf /dev/stdout $PYSPARK_LOG/pyspark.out \
    && chmod 777 $PYSPARK_LOG \
    && mkdir -p $PYSPARK_DATA \
    && chmod 777 $PYSPARK_DATA
