class SideScrollPawn extends SJCBasePawn
	dependson(SJCBasePawn);

var bool bJumping;

function bool Dodge(eDOubleClickDir DoubleClickMove)
{
	return false;
}

DefaultProperties
{
	//Components
	Begin Object Class=SkeletalMeshComponent Name=SKMComp
		SkeletalMesh=SkeletalMesh'SJCMeshes.Mesh.PlayerMesh'
		bAcceptsLights=true
	End Object
	
	Components.Add(SKMComp)

	//Variables
	bCanStrafe = false
	JumpZ = 500
}
