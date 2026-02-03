#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec4 forward;
    vec4 position;
} camera;

in gl_PerVertex {
    vec4 gl_Position;
} gl_in[];

out gl_PerVertex {
    vec4 gl_Position;
} gl_out[];


layout(location = 0) in vec4 in_v1[];
layout(location = 1) in vec4 in_v2[];
layout(location = 2) in vec4 in_v3[];
layout(location = 3) in vec4 in_v4[];

layout(location = 0) out vec4 out_v1[];
layout(location = 1) out vec4 out_v2[];
layout(location = 2) out vec4 out_v3[];
layout(location = 3) out vec4 out_v4[];

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    out_v1[gl_InvocationID] = in_v1[gl_InvocationID];
    out_v2[gl_InvocationID] = in_v2[gl_InvocationID];
    out_v3[gl_InvocationID] = in_v3[gl_InvocationID];
    out_v4[gl_InvocationID] = in_v4[gl_InvocationID];

	// TODO: Set level of tesselation
    gl_TessLevelInner[0] = 4.0;
    gl_TessLevelInner[1] = 4.0;
    gl_TessLevelOuter[0] = 4.0;
    gl_TessLevelOuter[1] = 4.0;
    gl_TessLevelOuter[2] = 4.0;
    gl_TessLevelOuter[3] = 4.0;
}
