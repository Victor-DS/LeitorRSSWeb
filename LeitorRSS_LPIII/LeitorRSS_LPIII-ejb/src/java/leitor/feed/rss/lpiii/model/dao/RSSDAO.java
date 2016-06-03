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
package leitor.feed.rss.lpiii.model.dao;

import java.util.ArrayList;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import leitor.feed.rss.lpiii.model.Channel;
import leitor.feed.rss.lpiii.model.Publication;
import leitor.feed.rss.lpiii.model.Rss;

/**
 *
 * @author victor
 */
@Stateless
@LocalBean
public class RSSDAO {        
        
        @PersistenceContext(unitName = "LeitorRSSPU")
        private EntityManager em;
        
        public Channel addFeed(Channel feed, String user) {
                return em.merge(feed);
        }
        
        public ArrayList<Publication> addPublications(Rss rss, String user) {
                ArrayList<Publication> publications = new ArrayList<Publication>();
                
                for(Publication p : rss.getChannel().getItem()) {
                        p.setFeed(rss.getChannel());
                        publications.add(addPublication(p, user));
                }
                        
                return publications;
        }
        
        private Publication addPublication(Publication p, String user) {
                return em.merge(p);                
        }
        
        public ArrayList<Publication> getPublications(String user) {                
                TypedQuery<Publication> query =  
                        em.createQuery("SELECT P  "
                                + "FROM  Publicacao P", Publication.class);
                
                ArrayList<Publication> publications = new ArrayList<>();
                publications.addAll(query.getResultList());
                
                return publications;
        }
}
