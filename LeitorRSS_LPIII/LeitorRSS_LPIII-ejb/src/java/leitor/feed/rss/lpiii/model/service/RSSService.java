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
package leitor.feed.rss.lpiii.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.management.modelmbean.XMLParseException;
import javax.xml.bind.JAXBException;
import leitor.feed.rss.lpiii.controller.Teste;
import leitor.feed.rss.lpiii.model.Publication;
import leitor.feed.rss.lpiii.model.Rss;
import leitor.feed.rss.lpiii.model.User;
import leitor.feed.rss.lpiii.model.dao.FeedDAO;
import leitor.feed.rss.lpiii.model.dao.RSSDAO;
import leitor.feed.rss.lpiii.model.dao.UserDAO;
import leitor.feed.rss.lpiii.model.helper.ParserHelper;
import leitor.feed.rss.lpiii.model.helper.Util;

/**
 *
 * @author victor
 */
@Stateless(mappedName = "RSSService")
@LocalBean
public class RSSService implements RSSServiceRemote{
        
        @EJB
        private RSSDAO rssDAO;
        
        @EJB
        private UserDAO userDAO;
        
        @EJB
        private FeedDAO feedDAO;

        @Override
        public ArrayList<Publication> getPublications(User user) {
                return rssDAO.getPublications(user.getNome());
        }

        @Override
        public void registerFeed(String url, User user) {
                Rss rss = null;
                try {
                        String xml = Util.getFromURL(url);
                        rss = ParserHelper.getRSS(xml);                        
                } catch (IOException ex) {
                        Logger.getLogger(Teste.class.getName()).log(Level.SEVERE, null, ex);
                } catch (XMLParseException ex) {
                        Logger.getLogger(Teste.class.getName()).log(Level.SEVERE, null, ex);
                } catch (JAXBException ex) {
                        Logger.getLogger(Teste.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                rss.getChannel().addUser(user);
                rss.getChannel().setFeedLink(url);
                
                feedDAO.addFeed(rss.getChannel());
        }
        
}
