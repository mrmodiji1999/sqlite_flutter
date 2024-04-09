class notes {
   int? Id;
   String Title;
   String Description;
   DateTime? Create_at;

   notes({
     this.Id,
    required this.Title,
    required this.Description,
     this.Create_at
  });
  Map<String, Object?> toMap() {
    return {
      'Create_at': Create_at.toString(),
      'Title': Title,
      'Description': Description,
    };
  }
}
 


  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'Dog{id: $id, name: $name, age: $age}';
//   }
// }