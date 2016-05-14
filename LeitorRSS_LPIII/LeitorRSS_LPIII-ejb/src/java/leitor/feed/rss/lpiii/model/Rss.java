/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leitor.feed.rss.lpiii.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author victor
 */
@XmlRootElement(name = "rss")
@XmlAccessorType(XmlAccessType.FIELD)
public class Rss {
        
        private Channel channel;

        public Rss(Channel channel) {
                this.channel = channel;
        }

        public Rss() {
        }

        public Channel getChannel() {
                return channel;
        }

        public void setChannel(Channel channel) {
                this.channel = channel;
        }
        
        
        
}
