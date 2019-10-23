FROM debian
COPY software /usr/bin/
RUN apt-get update && apt-get install -y build-essential gfortran xfoil
WORKDIR /usr/bin/Avl/plotlib
RUN make
WORKDIR /usr/bin/Avl/bin
RUN make -f Makefile.gfortran

