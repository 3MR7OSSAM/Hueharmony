import requests
import subprocess
import os
import base64
from flask import Flask, request, jsonify

app = Flask(__name__)

def download_image(url, save_path):
    response = requests.get(url)
    if response.status_code == 200:
        with open(save_path, 'wb') as file:
            file.write(response.content)
        return save_path
    else:
        print(f"Failed to download image: {response.status_code}")
        return None

def colorize_image(image_path):
    command = f'python demo_release.py -i {image_path}'
    subprocess.run(command, shell=True)

def encode_image_to_base64(image_path):
    with open(image_path, 'rb') as file:
        encoded_image = base64.b64encode(file.read()).decode('utf-8')
    return encoded_image

@app.route('/colorize-image', methods=['POST', 'OPTIONS'])
def colorize_image_endpoint():
    if request.method == 'OPTIONS':
        response = app.make_default_options_response()
    else:
        try:
            data = request.get_json()
            image_url = data['image_url']
            image_path = 'imgs/test.jpg'
            downloaded_path = download_image(image_url, image_path)
            if downloaded_path:
                colorize_image(downloaded_path)
                encoded_image = encode_image_to_base64(downloaded_path)
                # Clean up the downloaded image
                # os.remove(downloaded_path)
                response_data = {'message': 'Image processed successfully', 'imageBase64': encoded_image}
                response = jsonify(response_data)
            else:
                response_data = {'message': 'Failed to process image'}
                response = jsonify(response_data)
        except Exception as e:
            print(f"Error: {str(e)}")
            response_data = {'message': f'Error: {str(e)}'}
            response = jsonify(response_data)
            response.status_code = 500

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
    return response

if __name__ == '__main__':
    app.run(debug=True)
