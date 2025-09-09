This is a chat login programme written in the windows' batch scripting language. The objective of this programme is to provide the user with an interface where they can
choose an option or exit the programme. Among the choices available, it's possible to create a user, login with an existing user or just exit the application. Should
the user choose to login with an nonexistent user, they will be prompted to create said user, being taken to this option after a short time interval (around 3 secs). 
The user can then be set up with a username and password, which will get saved into an empty file in the folder "users". The login process simply compares the user's input
with the contents of this folder and authenticates the user when they have entered the correct username and password. Else, an error message is displaying informing the
user that their credentials are incorrect. The user is then taken to a simple chatroom, where they can freely input whatever they want and the information is logged
in an auxiliary cmd windows which displays the textual contents of the user's messages, including actions undertaken by the user such a entering or leaving the chat.
The whole setup is organised into a simple 3-folder structure. The directory "C:\analyst\batch\chat" should house the file titled: corrected.bat. The directory
"C:\analyst\batch\program_files" should contain the files chatroom.chat and nsgbox.bat. The directory "C:\analyst\batch\users"starts out empty and will eventually get populated
with txt files holding the information for usernames and passwords of the created users. 
