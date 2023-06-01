# shio - シオ
*👑 The light and fast file server* 

## Installation
Shio can be installed from source, or from docker. You will need nim installed on your system to build it
```sh
git clone https://github.com/arashi-software/shio && cd shio
nimble install
```

## Config
Shio is configured in a json file. The json file is found in the shio directory named `config.json`
```json5
{
    "use_key": true, // Wether to use an authentication key to upload a file. boolean
    "keys": ["hello"] // Valid keys, can be left blank if use_key is false. list of strings
}
```

## Usage
You can run shio by simply running the executable
```sh
shio
```

**Shio will be run on port 5000**

Files can be uploaded through curl or any other program that can create http requests.
- You must make a post request with a file
- You must provide the key that you have configured (if use_key is true in your config) as the key header
```sh
# curl
curl -X POST -F 'file=@<File-path-here>' -H 'key: <Your-configured-key-here>' <shio-url>
```

### ⭐ Leave a star if you like it
