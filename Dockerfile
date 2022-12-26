FROM golang

WORKDIR /app

ENTRYPOINT ["go"] 

CMD ["run", "."]