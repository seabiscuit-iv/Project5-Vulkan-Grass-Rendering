#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec4 forward;
    vec4 position;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec3 in_color;
layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color

    // outColor = vec4(1.0);
    outColor = vec4(in_color, 1.0);
}
