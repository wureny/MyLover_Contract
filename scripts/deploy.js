const hre=require('hardhat');
const ethers=hre.ethers;
const main=async ()=>{
    //获取部署账户信息；
    //在hardhat的配置文件中需要加上goerli网络的url及配置的accounts信息
    const [deployer]=await ethers.getSigners();
    const myloverfactory=await ethers.getContractFactory('MyLover');
    const mylover=await myloverfactory.deploy();
    console.log(`准备上链：\n`);
    await mylover.deployed();
    console.log(`地址：\n`);
    console.log(mylover.address);

}
main()