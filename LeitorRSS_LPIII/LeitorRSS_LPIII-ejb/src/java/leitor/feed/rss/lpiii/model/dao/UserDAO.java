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
import javax.persistence.TypedQuery;
import leitor.feed.rss.lpiii.model.User;

/**
 *
 * @author victor
 */
@Stateless
@LocalBean
public class UserDAO {

        @PersistenceContext(unitName = "LeitorRSSPU")
        private EntityManager em;
        
        public User addUser(User u) {
                return em.merge(u);
        }
        
        public User getUser(String nome) {
                TypedQuery<User> query =  
                        em.createQuery("SELECT u FROM Usuarios u WHERE  nome = "+nome, User.class);
                
                ArrayList<User> users = new ArrayList<>();
                users.addAll(query.getResultList());
                
                if(users.isEmpty()) return new User(nome, null);
                
                return users.get(0);
        }
                
        
}
