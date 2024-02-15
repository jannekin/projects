import os
import random
import string
import hashlib

from flask import Flask, send_from_directory, Response

app = Flask(__name__)

@app.route('/tiedosto', methods=['GET'])
def serve_file():
    with open('/serverdata/tiedosto.txt', 'w') as f:
        random_text = ''.join(random.choices(string.ascii_letters + string.digits, k=1024))
        f.write(random_text)

    checksum = calculate_md5('/serverdata/tiedosto.txt')
    
    response = send_from_directory('/serverdata', 'tiedosto.txt')
    response.headers['X-Checksum'] = checksum
    return response

def calculate_md5(file_path):
    hash_md5 = hashlib.md5()
    with open(file_path, "rb") as file:
        for chunk in iter(lambda: file.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8088)