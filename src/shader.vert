#version 330 core
layout (location = 0) in vec2 inPosition;
layout (location = 1) in vec2 inUV;
out vec2 TexCoord;
void main() {
    gl_Position = vec4(inPosition, 0.0, 1.0);
    TexCoord = inUV;
}
