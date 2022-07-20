FROM amazonlinux:2

COPY .github .github/

RUN .github/workflows/ci_user_setup.sh

COPY setup.sh .

USER tester

ENV CI=true
RUN ./setup.sh
