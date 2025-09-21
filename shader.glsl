vec3 palette( in float t )
{
    vec3 a = vec3(0.520, 0.608, 0.608);
    vec3 b = vec3(0.219, 0.478, 0.480);
    vec3 c = vec3(0.750, 0.539, -1.929);
    vec3 d = vec3(-1.372, -1.038, -0.705);


    return a + b*cos( 6.283185*(c*t+d) );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy * 2.0 -1.0;
    uv.x *= iResolution.x / iResolution.y;
     vec2 uv0 = uv;
   vec3 finalCol = vec3(0.0);
    for(float i = 0.0; i< 3.0; i++){
    
    
     uv = fract(uv * 1.5) - 0.5;
    float d  = length(uv) * exp(-length(uv0));
    
    d = sin(d*8. + iTime )/8.;
  //  d -= 0.5;
    d = abs(d);
    
   //d = step(0.1,d);
  //d = smoothstep(0.0,0.1,d);
 // d = 0.01 /d;
    d = pow(0.01/d,1.2);
  
    vec3 col = palette(length(uv0) + iTime);
    finalCol += col *d;
    }
    fragColor = vec4(finalCol,1.0);
}
