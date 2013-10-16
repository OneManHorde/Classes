class SJCBasePawn extends UDKPawn;

var float CamOffsetDistance;

// Forces all pawns to be on the y axis 500.
simulated function Tick(float DeltaTime)
{
	local Vector sjcLocation;
	super.Tick(DeltaTime);

	sjcLocation = Location;
	sjcLocation.Y = 500;
	SetLocation(sjcLocation);
}

simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
   out_CamLoc = Location;
   out_CamLoc.Y = CamOffsetDistance;

   out_CamRot.Pitch = 0;
   out_CamRot.Yaw = -16384;
   out_CamRot.Roll = 0;
   return true;
}

simulated singular event Rotator GetBaseAimRotation()
{
   local rotator   POVRot;

   POVRot = Rotation;
   if( (Rotation.Yaw % 65535 > 16384 && Rotation.Yaw % 65535 < 49560) ||
      (Rotation.Yaw % 65535 < -16384 && Rotation.Yaw % 65535 > -49560) )
   {
      POVRot.Yaw = 32768;
   }
   else
   {
      POVRot.Yaw = 0;
   }
   
   if( POVRot.Pitch == 0 )
   {
      POVRot.Pitch = RemoteViewPitch << 8;
   }

   return POVRot;
}   

defaultproperties
{
   CamOffsetDistance=800
}

