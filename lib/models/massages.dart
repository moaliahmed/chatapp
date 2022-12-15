class Massage{
String text;
String sender;
DateTime now;
Massage ({required this.text,required this.sender,required this.now});

tomap(){
  return { 
    'text':text,
    'sender':sender,
    'time':now
  };
}

}