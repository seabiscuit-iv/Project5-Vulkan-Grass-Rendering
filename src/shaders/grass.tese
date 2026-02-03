#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
    vec4 forward;
    vec4 position;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 in_v1[];
layout(location = 1) in vec4 in_v2[];
layout(location = 2) in vec4 in_v3[];
layout(location = 3) in vec4 in_v4[];

layout(location = 0) out vec3 out_color;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

    vec3 basePos = in_v1[0].xyz;

    vec3 v0 = in_v1[0].xyz;
    vec3 v1 = in_v2[0].xyz;
    vec3 v2 = in_v3[0].xyz;
    vec3 up = in_v4[0].xyz;

    float orientation = in_v1[0].w;
    // float orientation = 3.14159 / 4.0;
    float height = in_v2[0].w;
    float width = in_v3[0].w;
    float stiffness = in_v4[0].w;

    vec3 a = mix(v0.xyz, v1.xyz, v);
    vec3 b = mix(v1.xyz, v2, v);
    vec3 p = mix(a, b, v);

    float threshold = 0.8;
    float width_modifier = 1.0 - clamp((v - threshold) / (1.0 - threshold), 0.0, 1.0);
    float half_width = (width * width_modifier) / 2.0;

    vec3 bitangent = vec3(sin(orientation), 0, cos(orientation));
    vec3 finalPos = p + bitangent * (u - 0.5) * (width * width_modifier);

    vec3 tangent = normalize(b - a);
    vec3 normal = normalize(cross(bitangent, tangent));

    // float v_shape_bend = 0.1; 
    // float center_dist = abs(u - 0.5) * 2.0; // 0 at center, 1 at edges
    // finalPos += normal * (1.0 - center_dist) * v_shape_bend;

    gl_Position = camera.proj * camera.view * vec4(finalPos, 1.0);
    out_color = vec3(0.07, 0.52, 0.06) * (v * 0.7 + 0.25);
}