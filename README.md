# NOMP KawPoW Algorithm Pool -Neoxa
Highly Efficient mining pool for Coins based on KawPoW algo!

This is opensource mining pool for Neoxa, Please visit [Neoxa](https://www.neoxa.net) for more information


-------
### Screenshots
#### Home<br />
![Home](https://raw.githubusercontent.com/Satoex/kawpow-pool/master/docs/frontend/home.png)

#### Pool Stats<br />
![Pool Stats](https://raw.githubusercontent.com/Satoex/kawpow-pool/master/docs/frontend/poolstats.png)<br /><br />

#### Miner Stats<br />
![Miner Stats](https://raw.githubusercontent.com/Satoex/kawpow-pool/master/docs/frontend/minerstats.png)<br /><br />

#### Payments<br />
![Payments](https://raw.githubusercontent.com/Satoex/kawpow-pool/master/docs/frontend/payments.png)<br /><br />

-------
### Node Open Mining Portal consists of 3 main modules:
| Project | Link |
| ------------- | ------------- |
| [KawPoWNOMP](https://github.com/NeoxaChain/kawpow-pool) | https://github.com/NeoxaChain/kawpow-pool |
| [Stratum Pool](https://github.com/tweetyf/kawpow-stratum-pool.git) | https://github.com/tweetyf/kawpow-stratum-pool.git |
| [Node Multihashing](https://github.com/zone117x/node-multi-hashing.git) | https://github.com/zone117x/node-multi-hashing.git |

-------
### Requirements
***NOTE:*** _These requirements will be installed in the install section!_<br />
* Ubuntu Server 18.04.* LTS
* Coin daemon
* Node Version Manager
* Node 12.13.0
* Process Manager 2 / pm2
* Redis Server
* ntp

-------

### Install Neoxa Daemon

    sudo adduser pool
    sudo usermod -aG sudo pool
    su - pool
    cd ~
    sudo apt install wget
    mkdir -p neoxa
    cd neoxa
    wget https://github.com/NeoxaChain/Neoxa/releases/download/v1.0.3/neoxad-linux64.zip   (Ensure LATEST!)
    sudo apt install unzip (May not be installed by Default)
    unzip neoxad-linux64.zip
    rm -r neoxad-linux64.zip
    
### Daemon Permissions    
    chmod +x neoxad 
    chmod +x neoxa-cli
    
### Add The Following If You Like For Convenience
    sudo ln -s ~/neoxa/neoxa-cli /usr/bin/neoxa-cli
    sudo ln -s ~/neoxa/neoxad /usr/bin/neoxad
    
### Create Neoxa Config  
    mkdir -p ~/.neoxa/
    touch ~/.neoxa/neoxa.conf
    

    
### Add The Following Into The Config. Change The Values As Needed!   
    echo "rpcuser=user1" > ~/.neoxa/neoxa.conf
    echo "rpcpassword=pass1" >> ~/.neoxa/neoxa.conf
    echo "prune=550" >> ~/.neoxa/neoxa.conf
    echo "daemon=1" >> ~/.neoxa/neoxa.conf
    echo "listen=1" >> ~/.neoxa/neoxa.conf
    echo "#checkmempool=100" >> ~/.neoxa/neoxa.conf
    echo "#maxmempool=800" >> ~/.neoxa/neoxa.conf
    echo "#maxconnections=500" >> ~/.neoxa/neoxa.conf
    echo "#dbcache=800" >> ~/.neoxa/neoxa.conf
    echo "#server=1" >> ~/.neoxa/neoxa.conf
    echo "#upnp=1" >> ~/.neoxa/neoxa.conf
    
### Or Just Paste If You Know How - Start By Editing The Config 
    
    nano ~/.neoxa/neoxa.conf
    
    rpcuser=user1
    rpcpassword=pass1
    prune=550
    daemon=1
    listen=1
    #checkmempool=100
    #maxmempool=800
    #maxconnections=500
    #dbcache=800
    #server=1
    #upnp=1
    
### Start Daemon, Get New Address For Pool Config    
    ./neoxad
    ./neoxa-cli getnewaddress
    
    Example output: GcyPqoF5gUNGR1vwG1KofWKVmhrhdSsUPF - it is the address of your pool, you need to remember it and specify it in the configuration file pool_configs/neoxacoin.json.

### Wallet Commands
    neoxa-cli getaddressesbyaccount ""
    
Information about pool wallet address.
    
    neoxa-cli getwalletinfo
    
Get more information.

    neoxa-cli getblockcount
    
Information about synchronization of blocks in the main chain.

    neoxa-cli help

-------

### Install Pool

    sudo apt install git -y
    cd ~
    git config --global http.https://gopkg.in.followRedirects true
    git clone https://github.com/dogemackenzie/kawpow-pool
    cd kawpow-pool/
    chmod +x install.sh
    ./install.sh

-------
### Configure Pool

If your daemon is hosted locally, keep your settings to 127.0.0.1, if you choose to submit blocks to an external daemon then edit the IP details below accordingly.

    cd ~/kawpow-pool
    nano config.json

### Example Pool Config
```javascript
{
    
    "poolname": "Neoxa Pool",
    
    "devmode": false,
    "devmodePayMinimim": 0.25,
    "devmodePayInterval": 120,
    
    "logips": true,       
    "anonymizeips": true,
    "ipv4bits": 16,
    "ipv6bits": 16,
    "poolwarningmsg": "",
    
    "defaultCoin": "neoxacoin",
    
    "poollogo": "/static/icons/neoxa.png",
    
    "discordtwitterfacebook": "",
    
    "pagetitle": "Neoxa Coin Pool - 0% Fees Promo",
    "pageauthor": "Neoxa project",
    "pagedesc": "A reliable, 0% fee, easy to use mining pool for cryptocurrency! No matter your experience with mining cryptocurrency, we make it easy! Get started mining today!",
    "pagekeywds": "GPU,CPU,Hash,Hashrate,Cryptocurrency,Crypto,Mining,Pool,Bitcoin,Neoxa,Wavi,Wavicoin,Dixicoin,Dixi,QBic,QBicCoin,Easy,Simple,How,To",

    "btcdonations": "",
    "ltcdonations": "",
    "ethdonations": "",

    "logger" : {
        "level" : "debug",
        "file" : "./logs/nomp_debug.log"
    },

    "cliHost": "127.0.0.1",
    "cliPort": 17117,

    "clustering": {
        "enabled": false,
        "forks": "auto"
    },

    "defaultPoolConfigs": {
        "blockRefreshInterval": 1000,
        "jobRebroadcastTimeout": 55,
        "connectionTimeout": 600,
        "emitInvalidBlockHashes": false,
        "validateWorkerUsername": true,
        "tcpProxyProtocol": false,
        "banning": {
            "enabled": true,
            "time": 600,
            "invalidPercent": 50,
            "checkThreshold": 500,
            "purgeInterval": 300
        },
        "redis": {
            "host": "127.0.0.1",
            "port": 6379
        }
    },

    "website": {
        "enabled": true,
        "sslenabled": false,
        "sslforced": false,
        "host": "0.0.0.0",
        "port": 8080,
        "sslport": 443,
        "sslkey": "~/nomp-kawpow-pool/certs/privkey.pem",
        "sslcert": "~/nomp-kawpow-pool/certs/fullchain.pem",
        "stratumHost": "Change To Your IP",
        "stats": {
            "updateInterval": 30,
            "historicalRetention": 172800,
            "hashrateWindow": 600
        },
        "adminCenter": {
            "enabled": false,
            "password": "NOT_WORKING_YET_:P_LESHACAT_CAN_DO_ADMIN_PANEL_FUNCTIONALITY_TOO"
        }
    },

    "redis": {
        "host": "127.0.0.1",
        "port": 6379
    },

    "switching": {
        "switch1": {
            "enabled": false,
            "algorithm": "sha256",
            "ports": {
                "3333": {
                    "diff": 10,
                    "varDiff": {
                        "minDiff": 16,
                        "maxDiff": 512,
                        "targetTime": 15,
                        "retargetTime": 90,
                        "variancePercent": 30
                    }
                }
            }
        },
        "switch2": {
            "enabled": false,
            "algorithm": "scrypt",
            "ports": {
                "4444": {
                    "diff": 10,
                    "varDiff": {
                        "minDiff": 16,
                        "maxDiff": 512,
                        "targetTime": 15,
                        "retargetTime": 90,
                        "variancePercent": 30
                    }
                }
            }
        },
        "switch3": {
            "enabled": false,
            "algorithm": "x11",
            "ports": {
                "5555": {
                    "diff": 0.001,
                    "varDiff": {
                        "minDiff": 0.001,
                        "maxDiff": 1, 
                        "targetTime": 15, 
                        "retargetTime": 60, 
                        "variancePercent": 30 
                    }
                }
            }
        }
    },

    "profitSwitch": {
        "enabled": false,
        "updateInterval": 600,
        "depth": 0.90,
        "usePoloniex": true,
        "useCryptsy": true,
        "useMintpal": true,
        "useBittrex": true
    }

}
```
### Create a pool config for you coins:
    
    mv pool_configs/neoxa_example.json pool_configs/neoxa.json

    
### Edit Pool Config
### Change "address": "Your Generated Address", to your pool created wallet address in file neoxa.json: Make sure to change the user/password for Daemon user. Needs to make what you created in ~/.neoxa/neoxa.conf

    cd pool_configs
    nano neoxa.json

### Sample Pool Config -- Please Edit And Add Your Info
```javascript
{
    "enabled": true,
    "coin": "neoxa.json",

    "address": "Your Generated Address",
    
    "donateaddress": "Your Generated Address",

    "rewardRecipients": {
	    "Your Generated Address":0.5
    },

    "paymentProcessing": {
        "enabled": true,
        "schema": "PROP",
        "paymentInterval": 300,
        "minimumPayment": 5,
        "maxBlocksPerPayment": 50000,
        "minConf": 30,
        "coinPrecision": 8,
        "daemon": {
            "host": "127.0.0.1",
            "port": 9766,
            "user": "user1",
            "password": "pass1"
        }
    },

    "ports": {
		"10001": {
            "diff": 0.001,
    	    "varDiff": {
    	        "minDiff": 0.001,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10002": {
            "diff": 0.01,
    	    "varDiff": {
    	        "minDiff": 0.01,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10003": {
            "diff": 0.1,
    	    "varDiff": {
    	        "minDiff": 0.1,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10004": {
            "diff": 0.5,
    	    "varDiff": {
    	        "minDiff": 0.5,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10005": {
            "diff": 1,
    	    "varDiff": {
    	        "minDiff": 1,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10006": {
            "diff": 2,
    	    "varDiff": {
    	        "minDiff": 2,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10007": {
            "diff": 4,
    	    "varDiff": {
    	        "minDiff": 4,
    	        "maxDiff": 64,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        },
		"10008": {
            "diff": 0.5,
    	    "varDiff": {
    	        "minDiff": 0.5,
    	        "maxDiff": 32,
    	        "targetTime": 10,
    	        "retargetTime": 60,
    	        "variancePercent": 30,
    		    "maxJump": 25
    	    }
        }
    },

    "daemons": [
        {
            "host": "127.0.0.1",
            "port": 9766,
            "user": "user1",
            "password": "pass1"
        }
    ],

    "p2p": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 19333,
        "disableTransactions": true
    },

    "mposMode": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 3306,
        "user": "me",
        "password": "mypass",
        "database": "ltc",
        "checkPassword": true,
        "autoCreateWorker": false
    },

    "mongoMode": {
        "enabled": false,
        "host": "127.0.0.1",
        "user": "",
        "pass": "",
        "database": "ltc",
        "authMechanism": "DEFAULT"
    }

}

```

### Run Pool - In Sequence
    cd ~
    screen -S NeoxaDaemon ./neoxad --daemons #Only Run If Not Already Running
    cd ~/kawpow-pool
    screen -S NOMP node ./init.js
