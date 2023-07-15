import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "dotenv";
// import "@nomiclabs/hardhat-ethers";
import * as dotenv from "dotenv";
dotenv.config({path: __dirname + "/.env"})
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: "hardhat",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.public.blastapi.io`,
      accounts: [process.env.PRIVATE_KEY],
      chainId: 11155111,
    }
  },
  etherscan:{
    // URL: `https://api.bscscan.com/api`,
    apiKey: process.env.API_KEY,
  }
};