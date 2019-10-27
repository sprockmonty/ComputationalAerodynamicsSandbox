FROM debian
COPY software /usr/bin/
RUN apt-get update && apt-get install -y build-essential gfortran xfoil libx11-dev gedit
WORKDIR /usr/bin/Avl/plotlib
RUN make gfortran
WORKDIR /usr/bin/Avl/eispack
RUN make -f Makefile.gfortran
WORKDIR /usr/bin/Avl/bin
RUN make -f Makefile.gfortran

