FROM bde2020/spark-base:2.3.0-hadoop2.7

COPY bootstrap.sh /

# Install pyenv and python 3.6, then modules you like
RUN apt-get-install gcc clang make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
    && curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash \
    && export PATH="/root/.pyenv/bin:$PATH" \
    && eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv install 3.6.5 \
    && pyenv global 3.6.5 \
    && pip install --upgrade pip \
    && pip install --upgrade jupyter jupyter_contrib_nbextensions \
    && pip install --upgrade pandas numpy scipy scikit-learn matplotlib tensorflow tensorflowonspark

ENV SPARK_HOME /spark
ENV SPARK_MASTER "spark://spark-master:7077"
ENV PYSPARK_LOG /spark/logs
ENV PYSPARK_DATA /spark/data
ENV PYSPARK_PYTHON /root/.pyenv/shims/python
ENV PYSPARK_DRIVER_PYTHON /usr/local/bin/jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS "notebook --ip=0.0.0.0 --no-browser"
ENV PYSPARK_EXECUTOR_MEMORY 1024m
ENV PYSPARK_DRIVER_MEMORY 1024m

RUN mkdir -p $PYSPARK_LOG \
    && ln -sf /dev/stdout $PYSPARK_LOG/pyspark.out \
    && chmod 777 $PYSPARK_LOG \
    && mkdir -p $PYSPARK_DATA \
    && chmod 777 $PYSPARK_DATA

EXPOSE 8888

RUN useradd -m jupyter
USER jupyter

CMD ["/bin/bash", "/bootstrap.sh"]