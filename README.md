# brat Setup

This repository contains a script that takes care of doing all the brat setup.

```sh
bash brat.sh
```

This will install brat at `brat/brat-1.3p1`, initialize a default user account, and run the web server.
Open [localhost:8001](https://127.0.0.1:8001) to access the server.

## Using SSH

If you are running this script in a machine connected with SSH, make sure to forward the `8001` port in your SSH command:

```sh
ssh -L 127.0.0.1:8001:$REMOTE:8001 $REMOTE
```

Replace `$REMOTE` with whatever you are trying to connect to.
