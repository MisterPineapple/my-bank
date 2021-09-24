const PTOKEN = 10**18; // 1 PTOKEN = 1000000000000000000 weiPTOKEN

const TestToken = artifacts.require("./PatcharapolToken.sol");
var SimpleBank = artifacts.require("SimpleBank");

module.exports = function(deployer) {
  deployer.deploy(TestToken);
  deployer.deploy(SimpleBank, { value: 1000000 * PTOKEN });
};
