package xml;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XmlTester {

	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document d = db.parse(new File("test.xml"));
		System.out.println(d.getDocumentURI());
		System.out.println(d.getXmlVersion());
		System.out.println(d.toString());

		System.out.println(d.getNodeValue());
		System.out.println(d.getTextContent());
		System.out.println(d.getElementsByTagName("content"));

//		for (int i=0 ; i > nl.getLength(); i++ ) {
//			Node n = nl.item(i);
//			System.out.println(n.toString());
//			System.out.println(n.getTextContent());
//		}
	}
}
