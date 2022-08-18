FROM alpine:3.14 AS prod

RUN apk update
# needed to install numpy, else compilation fails
RUN apk add make automake gcc g++ subversion python3-dev
RUN apk add --update --no-cache python3 py3-pip

# replace "template" with project name
ADD . /template

WORKDIR /template

RUN pip install -r requirements.txt

RUN python -m pip install --upgrade build
RUN python -m build
RUN python -m pip install -e . --no-deps

# replace "template" with project name
ENV PYTHONPATH=/template


FROM prod as dev

# pip collides with apk on ditlib
RUN pip install --ignore-installed distlib -r requirements-dev.txt
