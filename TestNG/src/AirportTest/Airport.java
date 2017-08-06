package AirportTest;

import org.testng.annotations.Test;



import org.testng.annotations.BeforeClass;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;


public class Airport {
  
	String adres = "https://www.travelocity.com/Flights";
	WebDriver driver;
	
  @BeforeClass
  public void beforeClass() {
	  System.setProperty("webdriver.gecko.driver", "C:\\Users\\Szymon\\Desktop\\Selenium\\geckodriver.exe");
	  driver = new FirefoxDriver();
	  driver.get(adres);
	  driver.manage().window().maximize();
	  driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
  }
  
  @Test
  public void TC_01() {
	  
	  Lotnisko.FlyingFrom(driver, "Miami");
	  Lotnisko.FlyingTo(driver, "Poznan");
	  Lotnisko.departing(driver, "08/20/2017");
	  Lotnisko.Returning(driver, "09/01/2017");
	  Lotnisko.searchbox(driver);
	  
	  
  }
  
  
  @Test
  public void TC_02() {
	  
	  Lotnisko.FlyingFrom(driver, "Miami");
	  Lotnisko.FlyingTo(driver, "Klodawa");
	  Lotnisko.departing(driver, "10.08.2017");
	  Lotnisko.Returning(driver, "01.09.2017");
	  Lotnisko.searchbox(driver);
	  
	  
	  
  }
  
  
  
  @Test
  public void TC_03() {
	  
	  Lotnisko.FlyingFrom(driver, "Miami");
	  Lotnisko.FlyingTo(driver, "Poznan");
	  Lotnisko.departing(driver, "10.08.2015");
	  Lotnisko.Returning(driver, "01.09.2017");
	  Lotnisko.searchbox(driver);
	  
  }
  
  
  @Test
  public void TC_04() {
	  
	  Lotnisko.FlyingFrom(driver, "Miami");
	  Lotnisko.FlyingTo(driver, "Poznan");
	  Lotnisko.departing(driver, "10.08.2017");
	  Lotnisko.Returning(driver, "01.09.2030");
	  Lotnisko.searchbox(driver);
	  
  }
  
  @Test
  public void TC_05() {
	  
	  Lotnisko.FlyingFrom(driver, "Miami");
	  Lotnisko.FlyingTo(driver, "Poznan");
	  Lotnisko.departing(driver, "10.08.2017");
	  Lotnisko.Returning(driver, "01.09.2017");
	  Lotnisko.advanced(driver);
	  Lotnisko.searchbox(driver);
	  
	  
  }
  
  @AfterMethod
  public void afterMethod() throws IOException, InterruptedException{
	  Thread.sleep(2000);
	  String FileName = "TC_02.jpg";
	  String directory = "C:\\Users\\Szymon\\Desktop\\";
	  
	  File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
	  FileUtils.copyFile(screenshot, new File(directory+FileName));
	  
	  
  }
  
  

  @AfterClass
  public void afterClass() throws InterruptedException, IOException {
	  Thread.sleep(2000);
	  
	  
	  driver.quit();
	  
	  
  }

}
