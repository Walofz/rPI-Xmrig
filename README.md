# rPI-Xmrig
**Base** on [Xmrig](https://github.com/xmrig/xmrig) modify to docker.

The images is based on Alpine in a docker, recommed using for raspberry pi 4.

- Note: To make the container mining for **your wallet**, you'll need to have a monero wallet (see https://mymonero.com/) and follow instructions. Then change options for the container as explained in the following section
- Note: this is a CPU version of Xmrig, nvidia version will be proposed later, but that's a bit more complex

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
