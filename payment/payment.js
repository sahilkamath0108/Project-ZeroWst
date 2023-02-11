const Web3 = require('web3');
const web3 = new Web3('http://127.0.0.1:7545');

const makePayment = async(req,res) => {
    const buyerPub = req.body.buyerPub
    const buyerPri = req.body.buyerPri

    const orgPub = req.body.orgPub

    const value = req.body.value


    const nonce = await web3.eth.getTransactionCount(buyerPub);
    const gasPrice = await web3.eth.getGasPrice();
    const gasLimit = 6721975;
  
    const transaction = {
      nonce,
      gasPrice,
      gasLimit,
      to: orgPub,
      value: value,
    };
  
    const signedTransaction = await web3.eth.accounts.signTransaction(transaction, buyerPri);
    const result = await web3.eth.sendSignedTransaction(signedTransaction.rawTransaction);
    res.json({
        success: true,
        transactionHash : result.transactionHash
    })


}

module.exports = {
    makePayment
}