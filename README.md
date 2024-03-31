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

# Instalation

### Opencv
1. Download the opencv-xxx.zip from opencv.org
2. Extract it and cd into it
3. make new folder and cd into it `mk build; cd build`
4. run `cmake -D OPENCV_GENERATE_PKGCONFIG=ON ..`
5. run `make -j$(nproc)`
6. run `sudo make install`
7. run `sudo cp -r /usr/local/include/opencv4/opencv2 /usr/local/include/`
8. run `sudo cp -r unix-install/opencv4.pc /usr/local/lib/pkgconfig`
9. run `export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig` 
(in the same windows as in you are going to run make)
10. run `sudo ldconfig`
11. run `export LD_LIBRARY_PATH=/usr/local/lib`

### GL (Arch Linux)
1. install it using aur packet manager
    `yay -S glew`

### MYSQL (arch)
1. Download the zip from official website
2. extarct the zip and cd into it
3. run `sudo cp -r ./include/jdbc /usr/local/include`
4. run `sudo mv /usr/local/incude/jdbc/cppconn  /usr/local/include`
5. run `sudo cp -r ./lib64/* /usr/local/lib`


# Running
Just run `make` and it will build the executable.