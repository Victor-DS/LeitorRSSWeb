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
package leitor.feed.rss.lpiii.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

/**
 *
 * @author victor
 */
@Entity(name = "Usuarios")
public class User implements Serializable {
        
        @Id
        @Column(name = "nome", length = 200, nullable = false)
        private String nome;

        @ManyToMany(targetEntity = Channel.class)
        private List<Channel> feeds;

        public User() {
                nome = "";
                feeds = new ArrayList<Channel>();
        }

        public User(String nome, List<Channel> feeds) {
                this.nome = nome;
                
                if(feeds != null)
                        this.feeds = feeds;
                else
                        this.feeds = new ArrayList<>();
        }

        public List<Channel> getFeeds() {
                return feeds;
        }

        public void setFeeds(List<Channel> feeds) {
                this.feeds = feeds;
        }

        public String getNome() {
                return nome;
        }

        public void setNome(String nome) {
                this.nome = nome;
        }
        
        private boolean addFeed(Channel f) {
                return feeds.add(f);
        }
        
}
