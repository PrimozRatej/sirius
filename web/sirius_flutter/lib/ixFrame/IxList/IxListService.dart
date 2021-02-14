abstract class IxListService {
  bool isLoading = false;
  Future<List<dynamic>> getListData(dynamic dto);
}
