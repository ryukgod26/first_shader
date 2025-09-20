void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy * 2.0 -1.0;
    uv.x *= iResolution.x / iResolution.y;
    
    float d  = length(uv);
    
    d = sin(d*8. + iTime )/8.;
  //  d -= 0.5;
    d = abs(d);
    
   //d = step(0.1,d);
  //d = smoothstep(0.0,0.1,d);
  d = 0.01 /d;
    fragColor = vec4(d,d,d,1.0);
}
