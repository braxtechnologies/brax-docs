# Building IodeOs for BraX3

## Prerequisites

### Install the Google repo tool

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
```

### Hardware Requirements

- **Disk**: ~300 GB (source code and build artifacts). SSD recommended
- **CPU**: 64-bit processor (Intel i5/i7 or AMD Ryzen 5/7 and above recommended, 8 cores or more preferred)
- **Memory**: 
  - Minimum: 16 GB RAM
  - Bare minimum: 8 GB RAM (with swap; builds will be very slow and unstable)

## Building

### Clone the build repository

Clone this repo to your local machine and navigate into it:

```bash
git clone https://git.os-source.co/IodeOs/build.git
cd build
```

### Initialize and sync the repo

Initialize the repo into the checkout directory:

```bash
repo init -u https://git.os-source.co/IodeOs/manifests_android -b v6-staging --git-lfs
```

Sync the repo (this may take a while):

```bash
repo sync
```

!!! tip
    You can speed up and stabilize the sync process with additional options:
    
    ```bash
    repo sync -c -j $(nproc --all) --force-sync --no-clone-bundle --no-tags -f
    ```
    
    - `-c`: Sync only the current manifest branch
    - `-j$(nproc --all)`: Use all available CPU cores for parallel sync
    - `--force-sync`: Discard local changes and ensure a clean state
    - `--no-clone-bundle`: Skip using potentially outdated pre-packaged bundles
    - `--no-tags`: Avoid downloading all Git tags (saves time/space)
    - `-f`: Continue syncing other projects even if one fails

### Start the build with Docker

```bash
docker compose up -d
```

### Check the build logs

```bash
docker logs -f repo_build_iode
```

Once the "build completed successfully" message appears in the logs (this typically takes 90-240 minutes, depending on your hardware and the number of threads used), navigate to the `out/target/product/brax3` folder to find your OTA package or fastboot images.

```bash
ls -la out/target/product/brax3 | grep lineage_brax3-ota.zip
```

Expected output:
```
-rw-r--r-- 1 root root 1424506068 Sep 30 18:34 lineage_brax3-ota.zip
```

## Source

For more information, visit the [IodeOs build repository](https://git.os-source.co/IodeOs/build).