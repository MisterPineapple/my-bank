const PAT = 10**18; // 1 PAT = 1000000000000000000 weiPAT

const TestToken = artifacts.require("./PatcharapolToken.sol");
// var SimpleBank = artifacts.require("SimpleBank");

module.exports = function(deployer) {
  deployer.deploy(TestToken);
  // deployer.deploy(SimpleBank, { value: 5000 * PTOKEN });
};
