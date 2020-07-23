import jscore
import jsffi
import p5
#js interfaces
type PNumber = int or float
#p5 interfaces
proc setUniform(self:Shader,uniformName: cstring;
               data: JsObject | PNumber | bool | openArray[PNumber]){.importc.}
#Shaders
const vertShader="""
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec4 aColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform float uTime;

varying vec2 vTexCoord;
varying vec4 vColor;
varying float vTime;
void main(){
    vTexCoord=aTexCoord;
    vColor=aColor;
    vTime=uTime;
    vec4 positionVec4=vec4(aPosition,1.0);
    gl_Position=uProjectionMatrix*uModelViewMatrix*positionVec4;
}
"""
const fragShader="""
precision mediump float;
varying vec2 vTexCoord;
varying vec4 vColor;
varying float vTime;
void main(){
    vec2 points[5];
    points[0]=vec2(0.2,0.2);
    points[1]=vec2(0.7,0.25);
    points[2]=vec2(0.1,0.9);
    points[3]=vec2(0.8,0.7);
    points[4]=vec2(0.4,0.6);
    vec2 coord=vTexCoord;
    float mdist=1.0;
    for(int i=0;i<5;++i){
        float dist=distance(points[i],coord);
        if(dist<mdist){
            mdist=dist;
        }
    }
    mdist-=smoothstep(0.3,0.7,abs(sin(100.0*mdist+vTime/200.0)));
    mdist*=4.0;
    gl_FragColor=vec4(mdist,mdist*(1.0+sin(vTime/1000.0)),mdist*(1.0+sin(vTime/2000.0)),1.0);
//    gl_FragColor=vec4(vColor.y,vColor.x,vColor.z,1.0);
}
"""
#globals
var myshader: Shader
var rotationAngle = 0.0
#custom shapes
proc squar(x,y,z,s:int)=
  beginShape()
  vertex(x-s,y-s,z,0,0)
  vertex(x+s,y-s,z,1,0)
  vertex(x+s,y+s,z,1,1)
  vertex(x-s,y+s,z,0,1)
  endShape(CLOSE)
#p5 routines
proc preload(){.exportc.}=
  discard 1-1
proc setup(){.exportc.}=
  createCanvas(displayWidth,displayHeight,WEBGL)
  myshader=createShader(vertShader, fragShader)
proc draw(){.exportc.}=
  let st: cstring="uTime"
  background(0)
  myshader.setUniform(st, Date.now() mod 100000)
  noStroke()
  camera(0,0,500,0,0,0,0,1,0)
  shader(myshader)
  squar(0,-150,0,50)
  push()
  rotateY(rotationAngle)
  rotateX(3.0*rotationAngle)
  ellipsoid(50,10)
  pop()
  push()
  rotateY(rotationAngle)
  torus(60,10)
  pop()
  translate(0,120,0)
  rotateY(-rotationAngle)
  box(100)
  rotationAngle+=0.01

