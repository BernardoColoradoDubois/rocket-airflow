FROM apache/airflow:2.9.2
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  nano \
  vim \
  curl \
  postgresql \
  libpq-dev \
  gcc \
  openssl \
  python3-dev \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade wheel
RUN pip install --upgrade setuptools
RUN pip install --upgrade psycopg2
RUN pip install --no-cache-dir apache-airflow==${AIRFLOW_VERSION}
RUN pip install --no-cache-dir apache-airflow-providers-postgres
RUN pip install --no-cache-dir apache-airflow-providers-http
RUN pip install --no-cache-dir -r /requirements.txt