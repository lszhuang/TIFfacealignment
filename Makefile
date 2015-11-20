OPENCV_PREFIX = /usr/local
BOOST_PREFIX= /usr/local
INCLUDES = -I$(OPENCV_PREFIX)/include/opencv2 \
           -I$(OPENCV_PREFIX)/include/opencv \
	-I$(OPENCV_PREFIX)/include\
           -I$(BOOST_PREFIX)/include\
	   -I./dlib-18.10
LIBS = -lopencv_highgui -lopencv_imgproc -lopencv_imgcodecs -lopencv_core -lopencv_videoio\
       -lboost_system -lboost_thread -lboost_serialization -lboost_filesystem -lpthread -lX11
LIBDIRS = -L$(OPENCV_PREFIX)/lib \
          -L$(BOOST_PREFIX)/lib \
          -L/usr/local/lib \
	-L/lib64
CC=g++
CFLAGS= -c -Wall -O3
SOURCES= ./dlib-18.10/dlib/all/source.cpp facealignment.cpp 
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=TIF

all: $(SOURCES) $(EXECUTABLE)
clean: 
	rm -f *.o
    
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) $(LIBDIRS) $(LIBS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@
