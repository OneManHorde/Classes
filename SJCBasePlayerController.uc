class SJCBasePlayerController extends UDKPlayerController;

function UpdateRotation( float DeltaTime )
{
   local Rotator   DeltaRot, ViewRotation;

   ViewRotation = Rotation;

   // Calculate Delta to be applied on ViewRotation
   DeltaRot.Yaw = Pawn.Rotation.Yaw;
   DeltaRot.Pitch   = PlayerInput.aLookUp;

   ProcessViewRotation( DeltaTime, ViewRotation, DeltaRot );
   SetRotation(ViewRotation);
}   

defaultproperties
{
}