#inferred type
let x=5
echo "x=",x
#type specified
let y:int=6
echo "y=",y
#ddclare multiple
var
  w,z:int
  a,b=2 #assign 2 to both a and b
#[
Note: If you are declaring a variable a assigning its value later, let keyword wont work
]#
echo a,",",b
w=3
echo "w has been set to ",w
