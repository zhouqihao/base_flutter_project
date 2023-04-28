
class StringUtil{

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