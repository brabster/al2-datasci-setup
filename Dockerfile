FROM amazonlinux:2

COPY .github .github/

RUN .github/workflows/ci_user_setup.sh

USER tester
WORKDIR /home/tester

ENV CI=true
COPY setup.sh .
RUN ./setup.sh

RUN python --version \
    && pipenv --version \
    && pip --version \
    && http --version