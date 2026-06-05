# Guitar Girl Revival Server

A custom, reverse-engineered backend server implementation for the mobile game **Guitar Girl**.

> ⚠️ **Status: Work In Progress (WIP)**
> This project is currently in development. It currently allows players to authenticate and successfully log into the game, but many in-game features and endpoints are still broken or unimplemented.

## About the Game

*Guitar Girl* was a relaxing, music-themed idle simulation mobile game developed and published by NEOWIZ. Players helped a shy girl build confidence and become a popular idol by performing music, decorating her room, and engaging with followers through an in-game social media feature. The official service for the game ended on December 31, 2025. This project aims to preserve the game's functionality by providing a custom backend server.


## Prerequisites

- Python 3.x
- Custom SSL certificates (`cert.pem` and `cert.key`) to intercept and handle the game's HTTPS traffic.

## Setup & Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/lehuymanhtan/guitar-girl-revival.git
   cd guitar-girl-revival
   ```

2. **Create a virtual environment (Recommended):**
   ```bash
   python -m venv .venv
   .venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Database Setup:**
   Run the initial Django migrations to set up the SQLite database:
   ```bash
   python manage.py migrate
   ```

## Running the Server

Since the game client expects to communicate over HTTPS, the server must be run using SSL. 

### On Windows
You can use the provided `run-server.bat` script. 
**Note:** You must edit `run-server.bat` first and update the paths to point to your local `cert.pem` and `cert.key` files.

```cmd
run-server.bat
```

### Manual Run
Alternatively, run the server manually specifying the paths to your SSL certificate and key:

```bash
python manage.py runsslserver --certificate /path/to/cert.pem --key /path/to/cert.key 0.0.0.0:443
```

## Contributing

As many features are still WIP (e.g., event rewards, follower systems, etc.), contributions and pull requests are welcome! You can check the Thrift endpoint implementations in the `gameapi` and `thrift_src` directories to see what needs work.

## License

This project is released into the public domain under [The Unlicense](https://unlicense.org/).
