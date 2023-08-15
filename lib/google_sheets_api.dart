import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi{
   static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "expense-tracker-gsheets-392218",
  "private_key_id": "62a359dc8f54dbda0871dd608bc560fb4360e016",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDdzxN2SVnHUZWD\nBQVEU4FGoIPVnX1X+DIIQ0eyw9iVXBZBMYXjurGcFR+pQvVigHeP22kvjznUkQeb\n9g8Scp/dXJrAZNBv4nmv1EIRtBIXl7GS3O04829hs65ILZadoe/otuEgvUVmXtzy\nFmIBi02Lu04TH5K1ogyL6SvEdoJU41N9CrKGTH7s+6udniHSYEinRs8DLcG72LI+\nxMxVb0IhPqzZlnN9118XToD6J2k9NQV9SsNP7/Og4AWYqrILAWez2HmeHK8WJStz\n6zoX34Pp0QvFRzJXJHL8QpeYEs3uH+GM1dtNF2b3ihfGo1t241dgh/lWygdDn22k\nULm5YlVhAgMBAAECggEABMp6BEAM5ijKvQv1YZv8IfWC8bDpJmacqnyUNMRHDjZi\n+8gr1YGe0c7oVCnT3M8G4ol2stRIQGFcOu/v3vWxFIEqOFBKeSdOQZA3O1Y3CH4W\nvnlWQQ39d6yN35WuRkMigTkudI4iBZ1e7pLOFOYDKByaQqsJsYcX253H7ZCjgrK6\nOo8fXlndTa3Efy5Ij9XXsyj45gBtsZXCzgpIS9gi7Yd4z8lEiC4IijjrIXdUyo9z\nlzEmi7cmercPMiCPGdpnViL7bNjRNFUDcfWZRe9xgxLBgyxrDsaYwcJYQ0kEPgBN\n47j8TRNABe2UyOaAmKFmNO8fTwdgoxcPYfgFeQ7SkQKBgQD1O4gY+S70HlVhX/iU\nhGObHnNGdeJOeibNOwVKLIBBf/MShGTr+OquOXfiiCkv/3gmxgTiq2JEFM5MC79c\n7z4MegNQ3f5SbwdwexwWqXCkh56uhMN3/1Enu/v6Uky/2vyxxGQzzAtqxX2mWKYt\nf/07++Ih4qs1EosycOuQ0LmThwKBgQDnjEHekcue0sGL0Uc8dt2n98kS57hBTM4d\n4IHWu8i5Wyy3e6Ov7Zfsik3k/JmBUYwDiFwRmKwnSu1KQVQ+P0I3hXMjefx5TNqT\nXwU1wtwfyuET68USlO8bw7GNOVMzoKmYq3h7aAzpalf9KG5moEswrEOoXZyCp5vx\nOpN6NzbZ1wKBgQCCcjlR93LHfj8yfedvsQB+6fKtv1UzI3zyXHvS2dsbfGEjL3Oz\npgPHy1//CyjFlGIoVdsRa9LonhyijPktCUH7RwfugzeeR9swNPxa/aSikFWTRaHo\nedKEjVVa8V5MC8OxF+OpPdew4v6UdsFmoJdmyfSey8EAiS2sFi7oKG8ejwKBgDZv\nK8EWR2dUJrom/fdB/oQRZYzzOsbnNoGhmQSRavPgclfEUkv2sEOklAFkPPZA5Iik\nEvj0CmzGWZieWR61Im0JC3NopykhHzWMHh5wa+1xdY6IW/EtYDUHwYLw2hWGDLje\nftmMMZTiMkNKsQGhZ2vO46z+LOAuZSPF4IvX1SZLAoGBAJ+TDcyU+wJ9ET76tFU6\nTQkCRVNM2VtsAnR/cOS5dC6zU4KLBocQPg3WM/fNZwsGAcu/6UAnAf4/PSM5c4DL\n4r+HYIzdu2Hi0hCpYo6R4Ki6MCGlQCCKf3IclJAw5gZ4XfBDplzok6uulXHGEHg4\nAORMfi02Rz/QTLYAteVKgeW0\n-----END PRIVATE KEY-----\n",
  "client_email": "expense-tracker-gsheets@expense-tracker-gsheets-392218.iam.gserviceaccount.com",
  "client_id": "111086214941526166334",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expense-tracker-gsheets%40expense-tracker-gsheets-392218.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''' ;
  // set up & connect to the spreadsheet
 static final _spreadsheetId = '12BJsK6Bjyu6ZGmQas8ajtWXfcnrG_a710Q63GTpvnPQ';
  static  final _gSheets = GSheets( _credentials);
  static Worksheet? _worksheet ;

    static int numberOfTransactions = 0 ;
     List<List<dynamic>> currentTransaction = [] ;
    static bool loading = true;

//   initialise the spreadsheet!
  Future init() async{
    final ss = await _gSheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('WorkSheet1');
    countRows();
  }
   Future countRows () async{
    while( await _worksheet!.values.value(column: 1, row: numberOfTransactions +1) != '')
      numberOfTransactions++ ;
     loadTransactions();
}
Future loadTransactions() async{
    if( _worksheet ==null) return ;
    for( int i=0;i< numberOfTransactions ; i++){
      String  transactionName =
          await _worksheet!.values.value(column: 1, row: i+1) ;
      String  transactionMoney =
      await _worksheet!.values.value(column: 2, row: i+1) ;
      String  transactionType =
      await _worksheet!.values.value(column: 3, row: i+1) ;
      if(currentTransaction.length < numberOfTransactions) {
        currentTransaction.add([
          transactionName,transactionMoney,transactionType
        ]);
      }
    }
    loading = false;

}
}