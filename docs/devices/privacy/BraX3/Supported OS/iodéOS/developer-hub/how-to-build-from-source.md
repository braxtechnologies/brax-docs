---
title: How to build from source
---

This guide explains how to build iodéOS for BraX3 from source using a Docker-based build environment. By the end, you will have locally built OTA and fastboot images that you can flash to your device.

## Why Docker?

Using Docker ensures all required dependencies are pre-installed and properly configured.  
You do not need to install complex toolchains or modify your host system.

---

## Requirements

### Software

- **Linux distribution**  
  A recent 64 bit Linux distribution installed on the host system, for example Ubuntu 22.04 LTS or Debian.

- **Docker**  
  Install Docker using the official script:

  ```bash
  curl -fsSL https://get.docker.com | sh
  ```

- **Git**
  [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

- **Repo tool**
  Install the Google `repo` tool:

  ```bash
  mkdir -p ~/bin
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  chmod a+x ~/bin/repo
  export PATH=~/bin:$PATH
  ```

### Hardware

- **Disk:** Minimum 500 GB of free space for source code and build artifacts. An SSD is strongly recommended.

- **CPU:** 64 bit processor (Intel i5/i7 or AMD Ryzen 5/7 and above recommended, 8 cores or more preferred)

- **RAM:** 64GB recommended (16GB minimum)

---

## Usage

1. **Clone this repository** to your local machine and move into it:
   ```bash
   git clone https://git.os-source.co/IodeOs/build.git
   cd build
   ```
2. **Initialize the Android manifest** in the `IodeOs/build` checkout directory:
   ```bash
   repo init -u https://git.os-source.co/IodeOs/manifests_android -b v6-staging --git-lfs
   ```
3. **Configure HTTP credentials for Google repositories** to avoid `quota reached` errors during sync:
   > - In your browser, go to https://android-review.googlesource.com/.
   > - Sign in with your Google account.
   > - Open **Settings** from the top-right menu.
   > - In the **HTTP Credentials** section, click **Obtain password** and grant the requested permissions.
   > - Copy the command that is shown and run it in your terminal. This command creates or updates a Git authentication cookie file called `.gitcookies` in your home directory.

4. **Sync the repo** (this may take a while):
   ```bash
   repo sync
   ```
   > 💡 **Tip:** You can speed up and stabilize the sync process with additional options:
   >
   > ```bash
   > repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags -f
   > ```
   >
   > - `-c`: Sync only the current manifest branch
   > - `-j$(nproc --all)`: Use all available CPU cores for parallel sync
   > - `--force-sync`: Discard local changes and ensure a clean state
   > - `--no-clone-bundle`: Skip using potentially outdated pre-packaged bundles
   > - `--no-tags`: Avoid downloading all Git tags (saves time/space)
   > - `-f`: Continue syncing other projects even if one fails
5. **Start the build with Docker**:
   ```bash
   docker compose up -d
   ```
6. **Monitor the build logs**:
   ```bash
   docker logs -f repo_build_iode
   ```
7. **Locate the built images** once you see the `build completed successfully` message in the logs (this typically takes 90–240 minutes, depending on your hardware and the number of threads used). The images are in the `out/target/product/brax3` directory, for example:
   ```bash
   ls -la out/target/product/brax3 | grep lineage_brax3-ota.zip
   -rw-r--r--  1 root root 1424506068 Sep 30 18:34 lineage_brax3-ota.zip
   ```

---

## Troubleshooting

### Repo tool not found

If you see:

```
command not found: repo
```

Make sure `~/bin` is in your `PATH`:

```bash
export PATH=~/bin:$PATH
```

Add it to your `~/.bashrc` or `~/.zshrc` to make the change permanent.

---

### Repo sync is very slow or stalls

- Use more jobs with `-j<number>` (e.g. `repo sync -j16`) if you have a fast CPU and good network.
- If syncing fails, retry with:

  ```bash
  repo sync --force-sync --no-clone-bundle --no-tags
  ```

### `repo sync` fails with quota errors (RESOURCE_EXHAUSTED)

If you see an error like:

```
RESOURCE_EXHAUSTED: Resource has been exhausted (e.g. check quota)
type.googleapis.com/google.rpc.QuotaFailure
```

This usually means your `.gitcookies` file is missing.

Fix:

- Follow step 3 (HTTP Credentials) to generate `~/.gitcookies`.
- Then run `repo sync` again.

### `repo sync` fails with HTTP/2 PROTOCOL_ERROR

If you see:

```
fatal: unable to access 'https://android.googlesource.com/platform/external/fastrpc/': HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
```

This is commonly caused by an invalid or outdated `.gitcookies` file.

Fix:

- Recreate `~/.gitcookies` by repeating step 3 (HTTP Credentials).
- Then rerun `repo sync`.

### Repo sync did not complete fully

If the sync stops partway through, it is usually safe to rerun it.

Fix:

- Run `repo sync` again. Only missing projects and files will be downloaded.

### Docker permission denied (docker daemon socket)

If you see:

```
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
```

Fix (recommended):

```bash
sudo usermod -aG docker $USER
```

Then log out and back in (or restart your session) so the group change takes effect.

Workaround:

- Run the command with `sudo`, for example:

  ```bash
  sudo docker compose up -d
  ```

### Docker permission denied when viewing logs

If you see:

```
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
```

Fix (recommended):

```bash
sudo usermod -aG docker $USER
```

Then log out and back in (or restart your session).

Workaround:

```bash
sudo docker logs -f repo_build_iode
```
