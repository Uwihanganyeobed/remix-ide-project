// <!DOCTYPE html>
// <html>
// <head>
//     <title>My DApp</title>
// </head>

// <body>

//     <h1>My Counter DApp</h1>

//     <button onclick="connectWallet()">
//         Connect Wallet
//     </button>

//     <button onclick="increaseCounter()">
//         Increase
//     </button>

//     <h2>
//         Count:
//         <span id="count">0</span>
//     </h2>

//     <script src="https://cdn.jsdelivr.net/npm/ethers@6.13.5/dist/ethers.umd.min.js"></script>

//     <script>

//         // Replace with your deployed contract address
//         const contractAddress = "YOUR_CONTRACT_ADDRESS";

//         // ABI tells JavaScript how to communicate with Solidity
//         const contractABI = [
//             "function count() view returns (uint256)",
//             "function increase()"
//         ];

//         let provider;
//         let signer;
//         let contract;

//         async function connectWallet() {

//             // Connect MetaMask
//             provider = new ethers.BrowserProvider(window.ethereum);

//             await provider.send("eth_requestAccounts", []);

//             signer = await provider.getSigner();

//             contract = new ethers.Contract(
//                 contractAddress,
//                 contractABI,
//                 signer
//             );

//             console.log("Wallet connected");

//             getCount();
//         }

//         async function getCount() {

//             const value = await contract.count();

//             document.getElementById("count").innerText =
//                 value.toString();
//         }

//         async function increaseCounter() {

//             const transaction = await contract.increase();

//             // Wait for blockchain confirmation
//             await transaction.wait();

//             getCount();
//         }

//     </script>

// </body>
// </html>