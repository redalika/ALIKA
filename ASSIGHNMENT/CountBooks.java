package SAXParser;

import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class CountBooks {

	public static void main(String[] args) {
		String jaxpPropertyName = "javax.xml.parsers.SAXParserFactory";
		if (System.getProperty(jaxpPropertyName) == null) {
			String apacheXercesPropertyValue = "org.apache.xerces.jaxp.SAXParserFactoryImpl";
			System.setProperty(jaxpPropertyName, apacheXercesPropertyValue);
		}
		String filename = null;
		if (args.length > 0) {
			filename = args[0];
		} else {
			String extensions = "xml";
			WindowUtilities.setNativeLookAndFeel();
			filename = ExtensionFileFilter.getFileName(".", "XML Files", extensions);
			if (filename = null) {
				filename = "orders.xml";
			}
		}
		CountBooks(filename);
		System.exit(0);
	}

	private static void countBooks(String filename) {
		DefaultHandler handler = new CountHandler();
		SAXParserFactory factory = SAXParserFactory.newInstance();
		try {
			SAXParser saxParser = factory.newSAXParser();
			parser.parse(filename, handler);
		} catch (ParserConfigurationException | SAXException | IOException e) {
			String errorMessage = "Error parsing " + filename + ": " + e;
			System.err.println(errorMessage);
		}
	}
}