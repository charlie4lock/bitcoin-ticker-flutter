import 'package:http/http.dart' as http;
import 'dart:convert';

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$bitcoinAverageURL/BTC$selectedCurrency';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from BitcoinAverage.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      double lastPrice = decodedData['last'];
      //9. Output the lastPrice from the method.
      return lastPrice.toStringAsFixed(0);
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
