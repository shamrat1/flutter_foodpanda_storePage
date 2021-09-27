
class MenuItem {
    MenuItem({
        this.id,
        this.title,
        this.detail,
        this.specification,
        this.imageUrl,
        this.price,
        this.isAvailable,
        this.isPrescription,
        this.status,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.cartLimit,
        this.offerPrice,
        this.serveStarts,
        this.serveEnds,
        this.itemStarts,
        this.itemEnds,
        this.stockLimit,
        this.orderLimit,
        this.itemOptions,
        this.storeOptions,
        this.availableLimit,
        // this.categories,
        this.availableStock,
        // this.orderitems,
    });

    int? id;
    String? title;
    String? detail;
    dynamic specification;
    String? imageUrl;
    int? price;
    int? isAvailable;
    int? isPrescription;
    String? status;
    int? storeId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? cartLimit;
    dynamic offerPrice;
    String? serveStarts;
    String? serveEnds;
    dynamic itemStarts;
    dynamic itemEnds;
    int? stockLimit;
    int? orderLimit;
    String? itemOptions;
    String? storeOptions;
    int? availableLimit;
    // List<Category>? categories;
    int? availableStock;
    // List<dynamic>? orderitems;

    factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        id: json["id"],
        title: json["title"],
        detail: json["detail"] == null ? null : json["detail"],
        specification: json["specification"],
        imageUrl: json["image_url"],
        price: json["price"],
        isAvailable: json["is_available"],
        isPrescription: json["is_prescription"],
        status: json["status"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cartLimit: json["cart_limit"],
        offerPrice: json["offer_price"],
        serveStarts: json["serve_starts"],
        serveEnds: json["serve_ends"],
        itemStarts: json["item_starts"],
        itemEnds: json["item_ends"],
        stockLimit: json["stock_limit"] == null ? null : json["stock_limit"],
        orderLimit: json["order_limit"] == null ? null : json["order_limit"],
        itemOptions: json["item_options"] == null ? null : json["item_options"],
        storeOptions: json["store_options"] == null ? null : json["store_options"],
        availableLimit: json["available_limit"] == null ? null : json["available_limit"],
        // categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        availableStock: json["available_stock"] == null ? null : json["available_stock"],
        // orderitems: json["orderitems"] == null ? null : List<dynamic>.from(json["orderitems"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "detail": detail == null ? null : detail,
        "specification": specification,
        "image_url": imageUrl,
        "price": price,
        "is_available": isAvailable,
        "is_prescription": isPrescription,
        "status": status,
        "store_id": storeId,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "cart_limit": cartLimit,
        "offer_price": offerPrice,
        "serve_starts": serveStarts,
        "serve_ends": serveEnds,
        "item_starts": itemStarts,
        "item_ends": itemEnds,
        "stock_limit": stockLimit == null ? null : stockLimit,
        "order_limit": orderLimit == null ? null : orderLimit,
        "item_options": itemOptions == null ? null : itemOptions,
        "store_options": storeOptions == null ? null : storeOptions,
        "available_limit": availableLimit == null ? null : availableLimit,
        // "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "available_stock": availableStock == null ? null : availableStock,
        // "orderitems": orderitems == null ? null : List<dynamic>.from(orderitems.map((x) => x)),
    };
}
