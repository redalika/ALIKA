package SAXParser;

import org.xml.sax.*;
import org.xml.sax.helpers.*;
import javax.swing.*;

public class CountHandler extends DefaultHandler {
    private boolean collectCount = false;
    private boolean collectISBN = false;
    private int currentCount = 0;
    private int totalCount = 0;

    @Override
    public void startElement(String namespaceUri, String localName, String qualifiledName,
            Attributes attributes) throws SAXException {
        if (qualifiledName.equals("count")) {
            collectCount = true;
            currentCount = 0;
        } else if (qualifiledName.equals("isbn")) {
            collectISBN = true;
        }
    }

    @Override
    public void endElement(String namespaceUri, String localName, String qualifiledName)
            throws SAXException {
        if (qualifiledName.equals("count")) {
            collectCount = false;
            currentCount = 0;
        } else if (qualifiledName.equals("isbn")) {
            collectISBN = false;
        }
    }

    @Override
    public void characters(char[] chars, int startIndex, int length) {
        if (collectCount || collectISBN) {
            String dataString = new String(chars, startIndex, length).trim();
            if (collectCount) {
                try {
                    currentCount = Integer.parseInt(dataString);
                } catch (NumberFormatException nfe) {
                    System.err.println("Ignoring malformed count: " + dataString);
                }
            } else if (collectISBN) {
                if (dataString.equals("0130897930")) {
                    totalCount = totalCount + currentCount;
                }
            }
        }
    }

    @Override
    public void endDocument() throws SAXException {
        String message = "You ordered " + totalCount + " copies of \n" +
                "Core Web Programming Second Edition.\n";
        if (totalCount < 250) {
            message = message + "Please order more next time!";
        } else {
            message = message + "Thanks for your order.";
        }
        JOptionPane.showMessageDialog(null, message);
    }
}