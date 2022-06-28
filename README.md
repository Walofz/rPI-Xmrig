# rPI-Xmrig
**Base** on [Xmrig](https://github.com/xmrig/xmrig) modify to docker.

The images is based on Alpine in a docker, recommed using for raspberry pi 4.

- Note: To make the container mining for **your wallet**, you'll need to have a monero wallet (see https://mymonero.com/) and follow instructions. Then change options for the container as explained in the following section
- Note: this is a CPU version of Xmrig
- Note: For Raspberry PI 4 using `arm64` image or build from source.
- Note: For Linux 64 Bit (or WSL2) using `amd64` or build from source.
- Note: Docker Image is build-in my wallet, if you want help me. Just use it ~ (XD)

# Docker Image
- For Linux 64 bit.
```bash
docker pull walofz/xmrigrpi:6.18.0-amd64
```
- For Arm 64 bit
```bash
docker pull walofz/xmrigrpi:6.18.0-arm64
```

**Using**
```bash
docker run -d --name miner walofz/xmrigrpi:6.18.0
```

# Setup in Dockerfile

```bash
WALLET = "your address"
POOL = "pool"
PASS = "your name or something"
DONATE = "0 ~ 5"
COIN = "monero"
```

# Modify
in `src` folder, i'm change config in some line, set donate to 0% `gomen ne.`

# Default

By default:

- pool server is `gulf.moneroocean.stream:10001` #recommend for raspberry pi 4
- user is me
- password is me

To not make your CPU burning, this container set:
- number of threads = number CPU / 2
- priority to CPU idle (0) - that makes mining process to be activated only when CPU is not used

Complete list of supported environment variable:
- `WALLET`: your wallet address, default to me
- `POOL`: the pool address, default to `gulf.moneroocean.stream:10001`
- `PASS`: the pool password, or worker id, default to me
- `DONATE`: percentage of donation to Xmrig.com project, default is 0 (you can change it on `src/c_donate.h`)
- `PRIORITY`: CPU priority. 0=idle, 1=normal, 2 to 5 for higher priority
- `THREADS`: number of thread to start, default to number CPU / 2
- `COIN`: that is the coin option instead of algorithm (default is monero)
