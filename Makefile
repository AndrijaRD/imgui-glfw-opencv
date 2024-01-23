EXE = outputApp
IMGUI_DIR = ./imgui
BAKCENDS_DIR = ./backends
BUILD_DIR = ./build
LIB_DIR = ./lib

SOURCES = main.cpp
SOURCES += $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_demo.cpp $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(BAKCENDS_DIR)/imgui_impl_glfw.cpp $(BAKCENDS_DIR)/imgui_impl_opengl3.cpp

LIB_SOURCES = $(wildcard $(LIB_DIR)/*.cpp)
LIB_OBJS = $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(notdir $(basename $(LIB_SOURCES)))))

OBJS = $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(basename $(notdir $(SOURCES)))))
OBJS += $(LIB_OBJS)

UNAME_S := $(shell uname -s)
LINUX_GL_LIBS = -lGL

CXXFLAGS = -std=c++11 -I$(IMGUI_DIR) -I$(BAKCENDS_DIR) -I$(LIB_DIR)
CXXFLAGS += -g -Wall -Wformat `pkg-config --cflags opencv4` -DGLEW_STATIC
LIBS = `pkg-config --libs opencv4` -lGLEW -lmysqlcppconn

ifeq ($(UNAME_S), Linux) # LINUX
    ECHO_MESSAGE = "Linux"
    LIBS += $(LINUX_GL_LIBS) `pkg-config --static --libs glfw3`
    CXXFLAGS += `pkg-config --cflags glfw3`
    CFLAGS = $(CXXFLAGS)
endif

##---------------------------------------------------------------------
## BUILD RULES
##---------------------------------------------------------------------

$(BUILD_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(IMGUI_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(BAKCENDS_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(LIB_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(EXE)
	@echo Build complete for $(ECHO_MESSAGE)

$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

clean:
	rm -f $(EXE) $(addprefix $(BUILD_DIR)/, $(OBJS))

