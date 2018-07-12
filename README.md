# Jupyter Notebook for PySpark

This repo can easily setup Jupyter Notebook
with PySpark cluster (using [big-data-europe/docker-spark](https://github.com/big-data-europe/docker-spark))
for just playground or development environment on a single host.

By default, a jupyter container image includes:

- pandas
- numpy
- scipy
- scikit-learn
- matplotlib
- tensorflow 
- tensorflowonspark

You can add the other modules by editing ./jupyter/Dockerfile.

## Get started

You just command:

```
$ mkdir data
$ docker-compose up -d
```

This command starts:
- 1 Spark master
- 2 Spark workers
- 1 Jupyter Notebook
    - ./data is mounted to /spark/data in the container

Then you can get a token to access notebook by a following command.

```
$ docker-compose logs spark-jupyter
```

Now you can access notebook at http://localhost:8888/?token=<YOUR_TOKEN>.
