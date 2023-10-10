
## Introduction

This tutorial will guide you through the process of creating a simple JavaScript application that interacts with the `IFtsoRegistry` Solidity interface on the Ethereum blockchain. By the end of this tutorial, you will have a clearer understanding of how to invoke methods from a Solidity smart contract using JavaScript.


## Prerequisites

* A basic understanding of JavaScript.
* Node.js installed on your machine.
* Familiarity with Ethereum and Solidity (at a high level).

## Table of Contents

1. Setting Up Your Development Environment
2. Writing the JavaScript Application
3. Running the Application
4. Conclusion

## Setting Up Your Development Environment

### Install the Dependencies
Start by setting up a new Node.js project:

```
mkdir FlareApp
cd FlareApp
npm init -y
```

Now, install the required libraries:

```
npm install ethers dotenv
```

* **ethers:** A library for interacting with the Ethereum blockchain.
* **dotenv:** Allows you to load environment variables from a .env file.


## Writing the JavaScript Application
### Create the Interface
In the root directory, create a new file named `FtsoRegistryInterface.json` and paste the ABI of the `IFtsoRegistry` contract.

#### Write the JavaScript Code

Create a file named `app.js`:

```javascript
const { ethers } = require("ethers");
require('dotenv').config();

const ABI = require("./FtsoRegistryInterface.json");

const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;

const provider = new ethers.providers.JsonRpcProvider(API_KEY);
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
const contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer);

async function getSupportedSymbols() {
    const symbols = await contract.getSupportedSymbols();
    console.log("Supported Symbols:", symbols);
}

async function getCurrentPriceWithDecimals(symbol) {
    const { _price, _timestamp, _assetPriceUsdDecimals } = await contract.getCurrentPriceWithDecimals(symbol);
    console.log(`Price of ${symbol}:`, _price / (10 ** _assetPriceUsdDecimals));
}

async function main() {
    await getSupportedSymbols();
    await getCurrentPriceWithDecimals("ETH");
}

main();
```

## Running the Application
To run the application, simply execute the following command in your terminal:

``` 
node app.js
```

Ensure you have the `.env` file set up with the appropriate values:

```
API_KEY=YOUR_API_KEY
PRIVATE_KEY=YOUR_PRIVATE_KEY
CONTRACT_ADDRESS=YOUR_CONTRACT_ADDRESS
```

Replace the placeholders with your actual API key, private key, and the contract address.

## Conclusion 🚀
Bravo! 🎉 You've not only crafted a JavaScript application that communicates seamlessly with a Solidity interface on the Ethereum blockchain, but you've also taken a significant leap into the realm of decentralized applications. With the solid groundwork laid, the horizons are endless. Whether it's enhancing the current application, adding richer functionalities, or weaving it into a stunning frontend UI, you're all set to redefine the dApp landscape. Keep innovating and happy coding! 🌟👩‍💻👨‍💻🔗






