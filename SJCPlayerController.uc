class SJCPlayerController extends SJCBasePlayerController
	dependson(SJCBasePlayerController);

var Rotator RLeft, RRight;

state PlayerWalking
{
ignores SeePlayer, HearNoise, Bump;

	function PlayerMove(float DeltaTime)
	{
		local Vector NewAccel;
		`Log("Processing Move");


		//Check if we have a pawn
		if(Pawn == none)
		{
			`log("NO PAWN");
		}
		else
		{

			// Move left
			if(PlayerInput.aStrafe < 0)
			{
				`Log("Rotate Left");
				NewAccel.X = PlayerInput.aStrafe;
				Pawn.FaceRotation(RLeft, DeltaTime);
			}
			//Move right
			else if (PlayerInput.aStrafe > 0)
			{
				`Log("Rotate Right");
				NewAccel.X = PlayerInput.aStrafe;
				Pawn.FaceRotation(RRight, DeltaTime);
			}
		
			if(bPressedJump)
			{
				Pawn.DoJump(bUpdating);
				bPressedJump=false;
			}
		}

		ProcessMove(DeltaTime,NewAccel,DClick_None,Pawn.Rotation);
	}
}

DefaultProperties
{
	RRight = (Pitch=0,Roll=0,Yaw=65536)
	RLeft = (Pitch=0,Roll=0,Yaw=32768)
}
