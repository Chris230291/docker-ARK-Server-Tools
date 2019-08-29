Simple dockerized instance of ARK Server Tools

I bind mount "/etc/arkmanager", "/home/steam/ARK" and "/home/steam/Steam" to a seperate drive on the host for easy configuration and to not fill up my OS drive with ARK. eg "-v /host/path:/home/steam/ARK"

Parameters

-e UPDATETOOLS=1      <-- Try to update ARK Server Tools when the container starts

-e STARTSERVERS=1     <-- Start all instances when the container starts
