# Roblox PNG Visualizer

Small project, uses python and [Clonetrooper's PNG library](https://github.com/MaximumADHD/Roblox-PNG-Library) to insert images from computer into a Roblox game. 
This was not meant to be as optimized as possible, you will experience FPS drops (for in-game you'll just have latency issues) while the image is being generated.   <br>
Feel free to edit this to fit your needs.   <br>

![image](https://github.com/cmodii/Roblox-PNG-visualizer/assets/100476911/b0c69f1a-696c-42f8-ae0f-a53bb84da64a)


# Note
You need a host for the web app for it to work in-game, if you're planning to insert an image into studio you can do it with a localhost.  <br>
You can use something like [ngrok](https://ngrok.com/), not the fastest but it works for a project like this.

# How to use

- Create a python environment and put main.py in the same directory
- If you're using ngrok, open it and run ```ngrok.exe http 7000```
- Should give you a link (eg: ``https://4805-41-109-150-155.ngrok-free.app/v1/get_image``) use it in line 7 of the Roblox code
- Copy the code into a server script and put it in the SSS container
- Grab Clonetrooper's PNG library module and put it under the server script
- Insert a model into the workspace, and put inside a part and name it 'example', then size it really small to operate as a pixel (bigger size = could crash studio)
- Before you press Run (in studio), make sure you have an image in your python project's directory named image.png

If you're not using ngrok just host your app, and put the specified link in line 7

The method used here is creating a site that has a listener which returns a JSONified version of the image that's on the computer's project directory, which gets fetched by Roblox using GetAsync() and then uses an algorithm to sort the pixels which are a collection of small baseparts
