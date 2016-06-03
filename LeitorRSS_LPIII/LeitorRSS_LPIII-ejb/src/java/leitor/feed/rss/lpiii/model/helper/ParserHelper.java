/*
 * The MIT License
 *
 * Copyright 2016 victor.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package leitor.feed.rss.lpiii.model.helper;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import javax.management.modelmbean.XMLParseException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import leitor.feed.rss.lpiii.model.Publication;
import leitor.feed.rss.lpiii.model.Rss;

/**
 *
 * @author victor
 */
public class ParserHelper {
        
        public static List<Publication> getPublicationsFromRSS(String XML) 
                throws XMLParseException, IOException, JAXBException {
                Rss root = ParserHelper.getRSS(XML);
                
                return root.getChannel().getItem();
        }
        
        public static Rss getRSS(String XML) throws XMLParseException, IOException, JAXBException {
                if(XML == null || XML.isEmpty()) 
                    throw new XMLParseException("Empty file");
                
                if(XML.startsWith("<html>")) 
                    throw new XMLParseException("Invalid XML feed");
                
                JAXBContext jc = JAXBContext.newInstance(Rss.class);

                Unmarshaller unmarshaller = jc.createUnmarshaller();
                
                StringReader reader = new StringReader(XML);
                Rss root = (Rss) unmarshaller.unmarshal(reader);
                
                return root;
        }
        
}
