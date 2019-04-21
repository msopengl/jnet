CXX = g++

CXXFLAGS =    -O2 -g -Wall -fmessage-length=0
CFLAGS = `pkg-config --cflags lcm`
LDFLAGS=`pkg-config --libs lcm`\
        -lpthread

OBJS =        DSRC_module.o    \
            LCMHandler.o    \
            UDPHandler.o

TARGET =    DSRC_module
$(TARGET):    $(OBJS)
    $(CXX) -o $@ $^ $(LDFLAGS)
　DSRC_module.o: DSRC_module.cpp 
  　　$(CXX) $(CFLAGS) -I. -o $@ -c $<
  LCMHandler.o: LCMHandler.cpp 
  　　$(CXX) $(CFLAGS) -I. -o $@ -c $<
  UDPHandler.o: UDPHandler.cpp
  　　$(CXX) $(CFLAGS) -I. -o $@ -c $<
  all:	$(TARGET)
  clean:
  　　rm -f $(OBJS) $(TARGET)