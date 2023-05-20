require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",

  gasReporter:{
    enabled: true,
    currency: "INR",
    outputFile: "gasReport.txt",
    noColors: true,
    coinmarketcap: "101ba401-97d3-4a59-9375-a2d4633a2cb8",
    token:"matic",
  }
};
