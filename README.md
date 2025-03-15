# brat Setup

This repository contains a [script](./brat.sh) that takes care of doing all the setup for [brat rapid annotation tool](https://brat.nlplab.org/) on a Unix system.
The only prerequisite is Python > 2.5.
Without cloning, you can run the script using the one-liner

```sh
wget "https://raw.githubusercontent.com/xujustinj/brat-setup/refs/heads/main/brat.sh" --output-document=- | bash
```

This will download `brat.sh`, run it to install brat at `~/brat/brat-1.3p1`, initialize a default user account (username: `editor`, password: `annotate`), and run the local web server.
Open [localhost:8001](https://127.0.0.1:8001) to access the server.
The script is idempotent, so the copypasta can be used in place of learning how to run brat properly...

Of course, you will still need to add your own data at `~/brat/brat-1.3p1/data`.

## Installing Python 2

Python 2 is deprecated for good reasons.
You can still download it from [python.org](https://www.python.org/downloads/release/python-2718/).
However, it might be a good idea to install it in a self-contained environment.
If you have `conda` or something similar, you can do this with the one-liner

```sh
conda create --name=brat --yes python=2.7 && conda activate brat
```

## Using SSH

If you are running this script in a machine connected with SSH, make sure to forward the `8001` port in your SSH connection command:

```sh
# ssh $REMOTE
ssh -L 127.0.0.1:8001:$REMOTE:8001 $REMOTE
```

Replace `$REMOTE` with whatever you are trying to connect to.
