FROM python:3.6

ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["k8s-snapshots"]

# There's a race between pod startup and kube2iam working, we tell boto to retry more
ENV AWS_METADATA_SERVICE_TIMEOUT 1
ENV AWS_METADATA_SERVICE_NUM_ATTEMPTS 10
