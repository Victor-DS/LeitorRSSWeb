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
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import leitor.feed.rss.lpiii.model.util.Util;

/**
 *
 * @author victor
 */
@Entity(name = "Publicacao")
@XmlAccessorType(XmlAccessType.FIELD)
public class Publication implements Serializable  {
        
        @XmlElement(name = "title")
        @Column(name = "titulo", length = 200)
        private String title;

        @Id
        @XmlElement(name = "link")
        @Column(name = "link", length = 500)
        private String url;
        
        @XmlElement(name = "comments")
        private String comments;

        @XmlElement(name = "dc:creator")
        @Column(name = "autor", length = 200)
        private String creator;

        @XmlElement(name = "category")
        private String category[];
        
        @XmlElement(name = "description")
        @Column(name = "descricao", length = 2000)
        private String description;
        
        @XmlElement(name = "content:encoded")
        @Column(name = "conteudo", length = 2000)
        private String content; 
        
        @XmlElement(name = "pubDate")
        @Column(name = "data")
        private String date;
                
        @ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="idFeed")
        private Channel feed;

        public Publication(String title, String url, String comments, String creator, String[] category, 
                String description, String content, String timestamp) {
                this.title = title;
                this.url = url;
                this.comments = comments;
                this.creator = creator;
                this.category = category;
                this.description = description;
                this.content = content;
                this.date = timestamp;
        }

        public Publication() {
        }

        public Channel getFeed() {
                return feed;
        }

        public void setFeed(Channel feed) {
                this.feed = feed;
        }
        
        public String getTitle() {
                return title;
        }

        public void setTitle(String title) {
                this.title = title;
        }

        public String getUrl() {
                return url;
        }

        public void setUrl(String url) {
                this.url = url;
        }

        public String getComments() {
                return comments;
        }

        public void setComments(String comments) {
                this.comments = comments;
        }

        public String getCreator() {
                return creator;
        }

        public void setCreator(String creator) {
                this.creator = creator;
        }

        public String[] getCategory() {
                return category;
        }

        public void setCategory(String[] category) {
                this.category = category;
        }

        public String getDescription() {
                return description;
        }

        public void setDescription(String description) {
                this.description = description;
        }

        public String getContent() {
                return content;
        }

        public void setContent(String content) {
                this.content = content;
        }

        public Date getDate() {
                return Util.timestampToDate(date);
        }
        
        public String getTimestamp() {
                return this.date;
        }

        public void setDate(String date) {
                this.date = date;
        }

        @Override
        public String toString() {
                return "                                <a href=\""+this.url+"\" target=\"_blank\">\n" +
"                                    <div class=\"ui-corner-all custom-corners\" style=\"padding: 5px\">\n" +
"                                            <div class=\"ui-bar ui-bar-a\">\n" +
"                                                    "+this.title+"\n" +
"                                            </div>\n" +
"                                            <div class=\"ui-body ui-body-a\">\n" +
"                                                    "+this.description+"                                        \n" +
"                                            </div>\n" +
"                                    </div>\n" +
"                                </a>";
        }
        
}
