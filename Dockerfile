FROM nimlang/nim

WORKDIR \shio

COPY . .

RUN nimble install -y -d:ssl

CMD ["shio"]