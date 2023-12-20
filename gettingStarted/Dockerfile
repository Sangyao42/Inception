FROM ubuntu

RUN apt-get -y update && apt-get -y install
RUN apt-get -y install clang

COPY ./src /app
WORKDIR /app

RUN c++ -std=c++98 -Wall -Wextra -Werror -fsanitize=address helloWorld.cpp -o helloWorld

CMD ["./helloWorld"]