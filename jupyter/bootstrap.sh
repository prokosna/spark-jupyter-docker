#!/bin/bash

. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

# Activate extensions configurator
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user

# jupyter-vim-binding
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding
cd --

/spark/bin/pyspark --master $SPARK_MASTER --driver-memory $PYSPARK_DRIVER_MEMORY --executor-memory $PYSPARK_EXECUTOR_MEMORY >> $PYSPARK_LOG/pyspark.out