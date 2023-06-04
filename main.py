from flask import Flask, request, jsonify
from threading import Thread
from PIL import Image

app = Flask('')


@app.route('/')
def home():
    return "ahoy"


@app.route('/v1/get_image', methods=['GET'])
def return_image():
    return open("image.png", "rb").read()  # there must be an image in the project directory   


def run():
    app.run(host='localhost', port=7000)


t = Thread(target=run)
t.start()
