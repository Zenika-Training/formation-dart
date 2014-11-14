public class Car {

  private int price;
  private String type;
  private String brand;

  public Car(type, brand, price) {
    this.type = type;
    this.brand = brand;
    this.price = price;
  }

  public int getPrice() {
    return price;
  }

  public String getType() {
    return type;
  }

  /* ... */

  public void setType(String type) {
    this.type = type;
  }

  public String getBrand() {
    return brand;
  }

  public void setBrand(String brand) {
    this.brand = brand;
  }

}
