# imgui-glfw-opencv

This is a template for creating a ImGui apllication using openGL and GLFW.

To use it just clone it, cd into it and then run make.
The Makefile is going to compile all of the files from ImGui and it will put
all of the output files inside ./build folder, there is also ./lib folder
in which you can add any lib that you want (make your on) and the Makefile
will automaticly link all of them with main.cpp.

In the ./lib there is already an exaple called myLib that for now is
just being run every frame and it prints "Hello".

In the Makefile few addition libraries are also linked:
 - opencv4
 - mysql
 - glew

(They are aslo included in main.cpp file)
