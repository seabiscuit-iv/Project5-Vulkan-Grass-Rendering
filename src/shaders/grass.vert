
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// TODO: Declare vertex shader inputs and outputs
layout(location = 0) in mat4 blade_data;

layout(location = 0) out vec4 v1;
layout(location = 1) out vec4 v2;
layout(location = 2) out vec4 v3;
layout(location = 3) out vec4 v4;

out gl_PerVertex {
    vec4  gl_Position;
};

void main() {
	gl_Position = model * vec4(blade_data[0].xyz, 1.0);
    
    v1 = blade_data[0];
    v2 = blade_data[1];
    v3 = blade_data[2];
    v4 = blade_data[3];
}
