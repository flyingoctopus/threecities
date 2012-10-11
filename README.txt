How to use the Prototypes:

1.) Replace the GML4U Library in your Processing Library Folder with the one 
    in the GML4UPatch folder
2.) Copy the folder proJMS folder to your Processing Library Folder
3.) Run the messagingRecorder
4.) Run the messagingPlayer (or vice versa), the version started first will 
	run a broker (marked by a circle in the application window)
5.) Start to draw in the recorder window, your drawing should appear in the 
	player window
6.) Press 'd' to delete drawing in recorder window, drawing in player window
	will be deleted as well
	

There are two networking options:

Peer to peer
Player and recorder in the same network will find each other automically. 
No configuration or starting brokers needed. This won't work with apps outside 
of the network.

Static broker
Every player and recorder connects to the same broker. This option will work 
through most firewalls and with apps running in different networks.

Options can be changed be commenting/uncommenting the specific initialization 
of the Consumer/Publisher