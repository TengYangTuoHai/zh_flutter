import 'package:xml/xml.dart';

class XmlTools {
  static String getNodeElementValue(XmlNode node, String element){
    if(node.findElements(element).length > 0)
      return node.findElements(element).single.text;
    else
      return "";
  }
  static String getNodeElementAttributeValue(XmlNode node, String element,String attribute){
    if(node.findElements(element).length > 0)
      return node.findElements(element).single.getAttribute(attribute);
    else 
      return "";
  }
}