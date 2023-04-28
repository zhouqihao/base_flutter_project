
class StringUtil{

  ///这个用来解决Text省略号有时候省略太多了的问题，
  static String  breakWord(String word){
    if(word == null || word.isEmpty){
      return word;
    }
    String breakWord = ' ';
    word.runes.forEach((element){
      breakWord += String.fromCharCode(element);
      breakWord +='\u200B';
    });
    return breakWord;
  }



}