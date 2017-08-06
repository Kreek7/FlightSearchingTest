package AirportTest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

public class Lotnisko {
	
	public static WebElement element = null;
	
	
	public static WebElement FlyingFrom(WebDriver driver, String miejscowosc){
		
		element = driver.findElement(By.id("flight-origin"));
		element.sendKeys(miejscowosc);
		return element;
	}
	
public static WebElement FlyingTo(WebDriver driver, String miejscowosc){
		
		element = driver.findElement(By.id("flight-destination"));
		element.sendKeys(miejscowosc);
		return element;
	}


public static WebElement departing(WebDriver driver, String data){
	
	element = driver.findElement(By.id("flight-departing"));
	element.sendKeys(data);
	return element;
}


public static WebElement Returning(WebDriver driver, String data){
	
	element = driver.findElement(By.id("flight-returning"));
	element.sendKeys(data);
	return element;
}



public static WebElement advanced(WebDriver driver){
	
	element = driver.findElement(By.id("advanced-options"));
	element.click();
	element = driver.findElement(By.id("flight-advanced-preferred-airline"));
	Select sel = new Select(element);
	sel.selectByValue("CA");
	return element;
}



public static WebElement searchbox(WebDriver driver){
	
	element = driver.findElement(By.id("search-button"));
	element.click();
	return element;
}

	
	
	
	
	
	

}
