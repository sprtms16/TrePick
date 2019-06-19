package trapick.recommend.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import trapick.recommend.domain.Item;

public class Crawling {

	private static Crawling crawling = new Crawling();

	public static Crawling getInstance() {
		return crawling;
	}

	public List<Item> Getcrawling(String country_name, String city_name) {

		List<Item> list = new ArrayList<>();
		Item item;

		int item_idx = 0;
		String name = null;
		String latitude = "0";
		String longitude = "0";
		String detail;
		int time_defference = 0; // 받아야됨
		int price;
		String img;
		int sales = 0; // 판매량
		int hits = 0; // 인기

		String input = city_name + "+입장권";
		String lat = null;
		String lng = null;

		try {
			String url_naver = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=";
			String url_daum = "https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q=";
			url_naver += input;
			url_daum += input;
			Document doc_naver = Jsoup.connect(url_naver).get();
			Document doc_daum = Jsoup.connect(url_daum).get();

			Elements hotdeal_naver = doc_naver.select("._page_group ul");
			Elements deal_naver = hotdeal_naver.select("li");

			Elements hotdeal_daum = doc_daum.select(".cont_shop ul");
			Elements deal_daum = hotdeal_daum.select("li");

			// naver
			for (Element el : deal_naver) {

				// idx
				item_idx += 1;
				// name
				name = el.select(".detail_area").select(".tit").select("a").attr("title");
				// detail > 여행사로 함
				detail = el.select(".detail_area").select(".mall_area").select("a").text();
				// price
				String temp = el.select(".detail_area").select(".price_num").text().replace(",", "");
				temp = temp.replace("원", "");
				price = Integer.parseInt(temp);
				// img
				img = el.select(".thumb_area").select("img").attr("src");
				// sales
				String sales_temp = el.select(".detail").select(".txt_review").select("em").text();

				if (sales_temp.length() < 1) {
					sales = 0;
				} else {
					sales = Integer.parseInt(sales_temp);

				}

				// latitude, longitude
				String url_rocation = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + name
						+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

				Document doc_rocation = Jsoup.connect(url_rocation).get();

				lat = doc_rocation.select("location").select("lat").text();
				lng = doc_rocation.select("location").select("lng").text();

				if (lat.length() < 10) {
					String url_temp = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + city_name
							+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

					Document doc_temp = Jsoup.connect(url_temp).get();

					lat = doc_temp.select("location").select("lat").text();
				}

				if (lng.length() < 10) {
					String url_temp = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + city_name
							+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

					Document doc_temp = Jsoup.connect(url_temp).get();

					lng = doc_temp.select("location").select("lng").text();
				}

				if (lat.length() > 15) {
					lat = lat.substring(lat.lastIndexOf(" ") + 1);
				}

				if (lng.length() > 15) {
					lng = lng.substring(lng.lastIndexOf(" ") + 1);
				}

				latitude = lat;
				longitude = lng;

				item = new Item(item_idx, name, latitude, longitude, detail, city_name, time_defference, country_name,
						price, img, sales, hits);
				list.add(item);

				System.out.println(item);

			}
			// daum
			for (Element da : deal_daum) {

				// idx
				item_idx += 1;
				// name
				name = da.select(".wrap_cont").select(".wrap_tit").select("strong").text();
				// detail > 여행사로 함
				detail = da.select(".wrap_cont").select(".dl_comm").select(".cont").text().replaceAll("[0-9]", "");
				// price
				String temp = da.select(".wrap_cont").select(".txt_price").text().replace(",", "");
				temp = temp.replace("원", "");
				price = Integer.parseInt(temp);
				// img
				img = da.select(".wrap_thumb").select("img").attr("src");
				// sales
				String sales_temp = da.select(".wrap_cont").select(".dl_comm").select(".cont").text()
						.replaceAll("[^0-9]", "");
				if (sales_temp.length() < 1) {
					sales = 0;
				} else {
					sales = Integer.parseInt(sales_temp);
				}

				// latitude, longitude
				String url_rocation = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + name
						+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

				Document doc_rocation = Jsoup.connect(url_rocation).get();

				lat = doc_rocation.select("location").select("lat").text();
				lng = doc_rocation.select("location").select("lng").text();

				if (lat.length() < 10) {
					String url_temp = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + city_name
							+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

					Document doc_temp = Jsoup.connect(url_temp).get();

					lat = doc_temp.select("location").select("lat").text();
				}

				if (lng.length() < 10) {
					String url_temp = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + city_name
							+ "&key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg";

					Document doc_temp = Jsoup.connect(url_temp).get();

					lng = doc_temp.select("location").select("lng").text();
				}

				if (lat.length() > 15) {
					lat = lat.substring(lat.lastIndexOf(" ") + 1);
				}

				if (lng.length() > 15) {
					lng = lng.substring(lng.lastIndexOf(" ") + 1);
				}

				latitude = lat;
				longitude = lng;

				item = new Item(item_idx, name, latitude, longitude, detail, city_name, time_defference, country_name,
						price, img, sales, hits);

				System.out.println(item);

				list.add(item);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

//	가격순 정렬
	public void priceSort(List<Item> list) {
		Collections.sort(list, new Comparator<Item>() {
			@Override
			public int compare(Item o1, Item o2) {
				if (o1.getPrice() < o2.getPrice()) {
					return -1;
				} else if (o1.getPrice() > o2.getPrice()) {
					return 1;
				}
				return 0;
			}
		});
		for (Item item : list) {
			System.out.println(item);
		}
	}

//	판매량순 정렬
	public void salesSort(List<Item> list) {
		Collections.sort(list, new Comparator<Item>() {
			@Override
			public int compare(Item o1, Item o2) {
				if (o1.getSales() > o2.getSales()) {
					return -1;
				} else if (o1.getSales() < o2.getSales()) {
					return 1;
				}
				return 0;
			}
		});
		for (Item item : list) {
			System.out.println(item);
		}
	}

// 	인기순 정렬
	public void hitsSort(List<Item> list) {
		Collections.sort(list, new Comparator<Item>() {
			@Override
			public int compare(Item o1, Item o2) {
				if (o1.getHits() > o2.getHits()) {
					return -1;
				} else if (o1.getHits() < o2.getHits()) {
					return 1;
				}
				return 0;
			}
		});
		for (Item item : list) {
			System.out.println(item);
		}
	}
}
