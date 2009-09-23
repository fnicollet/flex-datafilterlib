// data providers for samples
import mx.collections.ArrayCollection;

[Bindable]
private var productData:ArrayCollection = new ArrayCollection([{ productName: "Solar Panel", productPrice: 1500, productType: "home", productCondition: "recent", productVendor: "SunPan" },
                                                               { productName: "Laptop Battery", productPrice: 80, productType: "computers", productCondition: "used", productVendor: "Laptop INC." },
                                                               { productName: "Laptop Screen", productPrice: 300, productType: "computers", productCondition: "recent", productVendor: "Laptop INC." },
                                                               { productName: "Temp. Monitor", productPrice: 95, productType: "home", productCondition: "recent", productVendor: "YourHome LTD" },
                                                               { productName: "Motion Sensor", productPrice: 2500, productType: "home", productCondition: "recent", productVendor: "Secu-Dome" },
                                                               { productName: "Brake Disk", productPrice: 200, productType: "auto", productCondition: "used", productVendor: "Voltran" },
                                                               { productName: "Safety Belt", productPrice: 500, productType: "auto", productCondition: "recent", productVendor: "PanAuto West" },
                                                               { productName: "Multimeter", productPrice: 40, productType: "electro", productCondition: "recent", productVendor: "VOID" },
                                                               { productName: "Capacitor", productPrice: 5, productType: "electro", productCondition: "recent", productVendor: "VOID" }]);
