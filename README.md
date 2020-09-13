# safra-hackathon
Repositório para projeto da Hackathon technee do Banco Safra

Pitch: https://youtu.be/wo7Q52r5ACI
[![IMAGE ALT TEXT](http://img.youtube.com/vi/wo7Q52r5ACI/0.jpg)](http://www.youtube.com/watch?v=wo7Q52r5ACI&feature=youtu.be "Safra Market")


# PresenceControlApp (BackEnd)

PresenceControlApp is an application developed for supporting teachers/professors to manage presence control of their students. As of this moment, it allows searches for students of a class and mark them as present or absent.
- BackEnd:
	The back-end exposes an API for getting the list of students registered in a class and updating the student status as present or absent. 

## Usage (for testing)
Under the project root folder (BackEnd/PresenceControlApp/)

1- Run:
	python src/PresenceControlWebApp.py
2- Run the application on the FrontEnd folder (FrontEnd/presence-control-app/), see instructions in its README.md file

To run unit tests:	
	python tests/PresenceControlTest.py

## Code Organization:

BackEnd/PresenceControlApp/			# Root Folder
	README.md						# Read me file
	src/							# Source Folder
		__init__.py
		DTO.py
		Models.py					# Model/business
		Service.py					# Controller
		PresenceControlWebApp.py	# API
	tests/							# Tests folder
		UnitTests.py
