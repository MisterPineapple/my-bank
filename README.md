# Simple Bank

This is a modified version of the Simple Bank smart contract example using Solidity. 
Instead of rewarding all clients, which means that the bank contract should hold all that Ether beforehand,
it only rewards the 3 first clients with 1000 PTOKEN each. 

```
module.exports = function(deployer) {
  deployer.deploy(SimpleBank, { value: 30 * PTOKEN });
};
```

The contract features an additional method to retrieve all the Ether in the contract.

## Requirements

Contract deployment and testing is done via [Truffle](https://truffleframework.com/). To install Truffle:

```
npm install -g truffle
```

Note: checked with version

* Truffle v5.4.11 / Solidity v0.8.7

## Deployment and Testing

First, start a local development network:

```
truffle develop
```

This will start Truffle Develop at http://127.0.0.1:9545 together with 10 sample accounts.

Then, compile the contracts in a different terminal (truffle develop keeps running the network):

```
truffle compile
```

If there are no errors, the contracts can be deployed to the local development network:

```
truffle migrate
```

If you want to deploy the contracts to Kovan Test Network:

```
truffle migrate --network kovan
```

Finally, they can be tested:

```
truffle test
```

With the following expected output:

```
Using network 'development'.

  Contract: SimpleBank - basic initialization
    ✓ should reward 3 first clients with 1 balance (168ms)
    ✓ should deposit correct amount (63ms)

  Contract: SimpleBank - proper withdrawal
    ✓ should withdraw correct amount (63ms)

  Contract: SimpleBank - incorrect withdrawal
    ✓ should keep balance unchanged if withdraw greater than balance (73ms)

  Contract: SimpleBank - fallback works
    ✓ should revert ether sent to this contract through fallback


  5 passing (482ms)
```
# my-bank
