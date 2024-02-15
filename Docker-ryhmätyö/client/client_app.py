import requests
import hashlib
import os

SERVER_URL = "http://server:8088/tiedosto"

def download_file(response, save_path):
    with open(save_path, 'wb') as file:
        for chunk in response.iter_content(chunk_size=8192):
            file.write(chunk)

def calculate_md5(file_path):
    hash_md5 = hashlib.md5()
    with open(file_path, "rb") as file:
        for chunk in iter(lambda: file.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

def main():
    response = requests.get(SERVER_URL)
    save_path = "/clientdata/tiedosto"
    download_file(response, save_path)
    print(f"Tiedosto ladattu osoitteesta {SERVER_URL} ja tallennettu kohteeseen {save_path}")

    checksum = calculate_md5(save_path)
    print(f"Tiedoston checksum: {checksum}")

    server_checksum = response.headers.get('X-Checksum')
    print(server_checksum)

    if server_checksum:
        if server_checksum == checksum:
            print("WATAA!! Checksum on sama kuin palvelimella!")
        else:
            print("Checksum ei vastaa palvelimen checksumia!")
    else:
        print("Checksumia ei saatu varmistettua!")

if __name__ == "__main__":
    main()