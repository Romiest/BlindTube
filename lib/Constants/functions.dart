
List cats = ["cats1", "cats2", "cats3",];
List cat_titles = ["Orange cats", "Blue Eyes", "Siamese cat"];
List dogs = ["dogs1", "dogs2", "dogs3"];
List dog_titles = ["smiling dog", "2 puppies", "slow mo"];



List  relatedVids(String animal,String video){

  List ans=[];
  if(animal=="c")
    for(int i=0;i<cats.length;i++){
      if(cats[i]!=video) {
        ans.add(cats[i]);
      }
    }
  else{
    for(int i=0;i<dogs.length;i++){
      if(dogs[i]!=video)
        ans.add(dogs[i]);
    }
  }
  return ans;

}
List  relatedTitles(String animal,String title) {
  List ans = [];
  if (animal == "c")
    for (int i = 0; i < cat_titles.length; i++) {
      if (cat_titles[i] != title)
        ans.add(cat_titles[i]);
    }
  else {
    for (int i = 0; i < dogs.length; i++) {
      if (dog_titles[i] != title)
        ans.add(dog_titles[i]);
    }
  }
  return ans;
}