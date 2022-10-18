mixin DbOperations<Model> {
  Future<int> create(Model model);
  Future<List<Model>> read();
  Future<Model?> show(int id); // search for Model to be shown
  Future<bool> update(Model model);
  Future<bool> delete(int id);
}

//  CRUD operations - create read update delete .