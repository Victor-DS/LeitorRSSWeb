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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author 41357205
 */
@XmlAccessorType(XmlAccessType.FIELD)
@Entity(name = "Feeds")
public class Channel implements Serializable {
    
    @Column(name = "nome", length = 45)
    private String title;
    
    @XmlElement(name = "atom:link")
    @Column(name = "feedURL", length = 200)
    private String feedLink;
    
    @XmlElement(name = "link")
    private String websiteLink;
    
    @Column(name = "descricao", length = 45)
    private String description;
    
    @Column(name = "idioma", length = 45)
    private String language;
    
    private ArrayList<Publication> item;
    
    @Id
    @Column(name = "idFeed", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    public Channel(String title, String feedLink, String websiteLink, String description, String language, ArrayList<Publication> item) {
        this.title = title;
        this.feedLink = feedLink;
        this.websiteLink = websiteLink;
        this.description = description;
        this.language = language;
        this.item = item;
    }

    public Channel() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFeedLink() {
        return feedLink;
    }

    public void setFeedLink(String feedLink) {
        this.feedLink = feedLink;
    }

    public String getWebsiteLink() {
        return websiteLink;
    }

    public void setWebsiteLink(String websiteLink) {
        this.websiteLink = websiteLink;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public ArrayList<Publication> getItem() {
        return item;
    }

    public void setItem(ArrayList<Publication> item) {
        this.item = item;
    }
}
