import 'package:http/http.dart';
import 'package:phonix_scanner/models/blockchain_networks.dart';
import 'package:web3dart/web3dart.dart' as web3dart;
import 'package:web3dart/web3dart.dart';

class Wrapper {
  bool? ownership;
  String? error;
}

class BlockchainService {
  static const Map<BlockchainNetworks, String> _rpcEndpoints = {
    BlockchainNetworks.ethereumMainnet: 'https://eth.llamarpc.com',
    BlockchainNetworks.polygon: 'https://polygon-bor-rpc.publicnode.com',
    BlockchainNetworks.optimism: 'https://optimism-rpc.publicnode.com',
    BlockchainNetworks.arbitrumOne: 'https://arbitrum-one-rpc.publicnode.com',
    BlockchainNetworks.base: 'https://base-rpc.publicnode.com',
    BlockchainNetworks.gnosisChain: 'https://gnosis-rpc.publicnode.com',
  };

  static Future<Wrapper> checkNftOwnership(
    BlockchainNetworks blockchain,
    String contractAddress,
    String walletAddress,
  ) async {
    web3dart.Web3Client? client;
    try {
      final rpcUrl = _rpcEndpoints[blockchain];
      if (rpcUrl == null) throw Exception('Unsupported blockchain network');

      client = web3dart.Web3Client(rpcUrl, Client());

      const abi = '''
      [
        {
          "constant": true,
          "inputs": [{"name": "owner", "type": "address"}],
          "name": "balanceOf",
          "outputs": [{"name": "", "type": "uint256"}],
          "type": "function"
        }
      ]
      ''';

      final contract = DeployedContract(
        ContractAbi.fromJson(abi, 'ERC721'),
        EthereumAddress.fromHex(contractAddress),
      );

      final balanceOfFunction = contract.function('balanceOf');

      final result = await client.call(
        contract: contract,
        function: balanceOfFunction,
        params: [EthereumAddress.fromHex(walletAddress.toLowerCase())],
      );

      if (result.isEmpty || result.first is! BigInt) {
        return Wrapper()..ownership = false;
      }

      final balance = result.first as BigInt;
      return Wrapper()..ownership = (balance > BigInt.zero);
    } on RangeError {
      // Most commonly happens when the call returns empty/invalid data
      // (wrong contract, wrong chain, or non-ERC721 ABI) and web3dart can't decode.
      // Treat as "no ownership" for UX.
      return Wrapper()..ownership = false;
    } on FormatException {
      return Wrapper()..ownership = false;
    } on ArgumentError {
      return Wrapper()..ownership = false;
    } catch (e) {
      return Wrapper()..error = 'Error checking NFT ownership: $e';
    } finally {
      if (client != null) {
        await client.dispose();
      }
    }
  }
}