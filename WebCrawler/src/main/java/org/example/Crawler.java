package org.example;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashSet;

public class Crawler {
    HashSet<String> urlSet;
    int MAX_DEPTH = 2;
    Crawler() {
        urlSet = new HashSet<String>();
    }
    public void getPageTextsAndLinks(String url, int depth) {
        if(urlSet.contains(url)) return;
        if(depth >= MAX_DEPTH) return;
        if(urlSet.add(url)) System.out.println(url);
        depth++;
        try {
            Document document = Jsoup.connect(url).timeout(5000).get();
            Indexer indexer = new Indexer(document, url);
            // Indexer work start here.
            System.out.println("----------"+ depth +"-------------");
            System.out.println(document.title());
            System.out.println(document.text());
            Elements availableLinksOnPage = document.select("a[href]");
            for (Element currentLink : availableLinksOnPage) {
                getPageTextsAndLinks(currentLink.attr("abs:href"), depth);
            }
        }
        catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }
    public static void main(String[] args) {
        Crawler crawler = new Crawler();
        crawler.getPageTextsAndLinks("https://www.javatpoint.com", 0);
    }

    public static class DatabaseConnection {
        static Connection connection = null;
        public Connection getConnection() {
            if(connection != null) {
                return connection;
            }
            String user = "root";
            String pwd = "saddam";
            String db = "searchengineapp";
            return getConnection(user, pwd, db);
        }
        private Connection getConnection(String user, String pwd, String db) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost/"+db+"?user="+user+"&password="+pwd);
            }
            catch (SQLException | ClassNotFoundException sqlException) {
                sqlException.printStackTrace();
            }
            return connection;
        }
    }
}