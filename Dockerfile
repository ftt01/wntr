FROM python:3.9

RUN mkdir -p ./tmp/wntr

RUN WNTR_VERSION=1.2.0 && \
    wget --directory-prefix=./tmp/wntr/ https://github.com/USEPA/WNTR/archive/refs/tags/$WNTR_VERSION.tar.gz && \
    tar -xzf ./tmp/wntr/$WNTR_VERSION.tar.gz -C ./tmp/wntr/ && \
    cd ./tmp/wntr/WNTR-$WNTR_VERSION && \
    python3 -m pip install -e .

RUN python -m pip install --upgrade pip

COPY requirements.txt ./tmp
RUN pip3 install -r ./tmp/requirements.txt

RUN mkdir -p /home/wntr/
WORKDIR /home/wntr/

# COPY resources/local_lib.py ./lib/local_lib.py
# COPY docker/metadata.json ./etc/conf/metadata.json
# # COPY docker/config.json ./etc/conf/config.json
# COPY src/bin/docker_download.py ./src/bin/download.py

# # python /home/chromedriver/src/bin/download.py /home/chromedriver/ /home/chromedriver/etc/conf/config.json
# CMD ["python","/home/chromedriver/src/bin/download.py", "/home/chromedriver/", "/home/chromedriver/etc/conf/config.json"]
CMD ["python3","--version"]

RUN rm -rf ./tmp