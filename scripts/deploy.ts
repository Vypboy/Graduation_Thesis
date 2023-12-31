import { ethers, hardhatArguments } from 'hardhat';
import * as Config from './config';
import * as config from "../config.json";


async function main() {

  await Config.initConfig();

  const network = hardhatArguments.network ? hardhatArguments.network : 'dev';
  const [deployer] = await ethers.getSigners();
  console.log('deploy from address: ', deployer.address);
////////////////////////////////////////////////////////////////////////////////
/////////////////////     DEPLOY TOKEN   ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  const flp = await ethers.deployContract("Floppy");
  console.log('Floppy Token address: ', await flp.getAddress());
  Config.setConfig(network + '.FLP', (await flp.getAddress()).toString());

  ////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
/////////////////////   DEPLOY NFT   ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  // const flpnft = await ethers.deployContract("FLPNFT");
  // console.log('FLP_NFT address: ', (await flpnft.getAddress()).toString());
  // Config.setConfig(network + '.FLPNFT', (await flpnft.getAddress()).toString());

//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
  await Config.updateConfig();
}

main().then(() => process.exit(0))
    .catch(err => {
        console.error(err);
        process.exit(1);
});