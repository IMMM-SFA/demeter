# base image
FROM python:2.7

# set env
ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# copy any dependencies to the working directory
COPY requirements.txt /code/
WORKDIR /code

# install dependencies
RUN pip install --upgrade pip \
    &&  pip install --trusted-host pypi.python.org --requirement requirements.txt

# copy package
COPY . /code

# install demeter
RUN python setup.py install

# command to run on start
ENTRYPOINT [ "python", "demeter/model.py" ]