#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution;
    
    // Cor base do laser
    vec3 laserColor = vec3(1.0, 0.0, 0.0); // Vermelho

    // Efeito de brilho pulsante
    float pulse = sin(u_time * 10.0) * 0.5 + 0.5;

    // Centro do laser (linha central)
    float laser = smoothstep(0.48, 0.52, uv.x) * pulse;

    // Simulação do impacto no escudo
    float impact = exp(-10.0 * length(uv - vec2(0.5, 0.5))) * pulse;

    vec3 color = mix(vec3(0.0), laserColor, max(laser, impact));

    gl_FragColor = vec4(color, 1.0);
}
