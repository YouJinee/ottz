package com.ottz.contents.web;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.ottz.contents.vo.RankVO;

public class MovieRank {
	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	public static final String WEB_DRIVER_PATH = "/home/pc34/tools/chromedriver"; //드라이버 경로
	
	public ArrayList<RankVO> rank () {
		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<RankVO> rankList = new ArrayList<RankVO>();
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		
		WebDriver driver = new ChromeDriver(options);
		String url = "https://m.kinolights.com/ranking/kino";
		driver.get(url);
		
		try {Thread.sleep(1000);} catch (InterruptedException e) {}
		List<WebElement> el4 = driver.findElements(By.className("left-content-wrap"));
		for (int i = 1; i <= 15; i++) {
			RankVO rankVO = new RankVO();
			rankVO.setRank(i);
			rankVO.setMovieNm(el4.get(i).getText());
			rankList.add(rankVO);
		}
		try {
			if(driver != null) {
				driver.close(); //드라이버 연결 해제
				//프로세스 종료
				driver.quit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return rankList;
	}
}

