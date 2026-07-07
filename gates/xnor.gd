extends BaseGate

var GateMeshInstance = MeshInstance3D.new()
var GateMesh = BoxMesh.new()
var ObjectMaterial = StandardMaterial3D.new()
var Collider = CollisionShape3D.new()
var ColliderShape = BoxShape3D.new()

func _init() -> void:
	GateName = "XNOR"

func _definePegs() -> void:
	Pegs = [Peg.new(), Peg.new(), Peg.new()]
	Pegs[0].Type = Peg.Types.INPUT
	Pegs[1].Type = Peg.Types.INPUT
	Pegs[2].Type = Peg.Types.OUTPUT
	Pegs[0].position = Vector3(-0.2, 0, -0.1)
	Pegs[1].position = Vector3(-0.2, 0, 0.1)
	Pegs[2].position = Vector3(0.1, 0, 0)
	Pegs[2].rotation_degrees = Vector3(0,0,90)
	add_child(Pegs[0])
	add_child(Pegs[1])
	add_child(Pegs[2])

func _draw() -> void:
	add_child(GateMeshInstance)
	add_child(Collider)
	Collider.shape = ColliderShape
	GateMeshInstance.mesh = GateMesh
	GateMeshInstance.scale = Vector3(0.3,0.3,0.3)
	Collider.scale = GateMeshInstance.scale
	ObjectMaterial.albedo_color = Color("#ffff00")
	GateMeshInstance.material_overlay = ObjectMaterial

func _gateBehaviour():
	if Pegs[0].State != Pegs[1].State : Pegs[2].State = Peg.States.OFF
	else: Pegs[2].State = Peg.States.ON
