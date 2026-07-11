extends BaseGate


var GateMesh = BoxMesh.new()
var ObjectMaterial = StandardMaterial3D.new()
var Collider = CollisionShape3D.new()
var ColliderShape = BoxShape3D.new()

func _init() -> void:
	GateName = "Buffer"
	
func _definePegs() -> void:
	Pegs = [Peg.new(), Peg.new()]
	Pegs[0].Type = Peg.Types.INPUT
	Pegs[1].Type = Peg.Types.OUTPUT
	Pegs[0].position = Vector3(-0.2, 0, 0)
	Pegs[1].position = Vector3(0.1, 0, 0)
	Pegs[1].rotation_degrees = Vector3(0,0,90)
	add_child(Pegs[0])
	add_child(Pegs[1])
		
	Pegs[0].name = "In0"
	Pegs[1].name = "Out0"
	
func _draw() -> void:
	GateMeshInstance = MeshInstance3D.new()
	add_child(GateMeshInstance)
	add_child(Collider)
	Collider.shape = ColliderShape
	GateMeshInstance.mesh = GateMesh
	GateMeshInstance.scale = Vector3(0.3,0.3,0.3)
	Collider.scale = GateMeshInstance.scale
	ObjectMaterial.albedo_color = Color("#ffffff")
	GateMeshInstance.material_override= ObjectMaterial

func _gateBehaviour():
	if Pegs[0].State == Peg.States.ON:
        Pegs[1].State = Peg.States.ON
    else:
        Pegs[1].State = Peg.States.OFF
