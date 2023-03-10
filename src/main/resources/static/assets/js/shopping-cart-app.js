const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function ($scope, $http) {
    /*
     * QUẢN LÝ GIỎ HÀNG
     */
    $scope.cart = {
        items: [],

        //Thêm sản phẩm vào giỏ hàng
        add(id) {
            var item = this.items.find((item) => item.id == id);
            if (item) {
                item.qty++;
                this.saveToLocalStorage();
            } else {
                $http.get(`rest/products/${id}`).then((resp) => {
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();
                });
            }
        },

        reduction(id) {
            var item = this.items.find((item) => item.id == id);
            if (item.qty > 1) {
                item.qty--;
                this.saveToLocalStorage();
            } else {
                $http.get(`rest/products/${id}`).then((resp) => {
                    this.items.splice(item, 1);
                    this.saveToLocalStorage();
                });
            }
        },

        //Xoá sản phẩm khỏi giỏ hàng
        remove(id) {
            var index = this.items.findIndex((item) => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },

        //Xoá sạch các mặt hàng trong giỏ
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },

        //Tính thành tiền của một sản phẩm
        amt_of(item) {},

        //Tính tổng số lượng các mặt hàng trong giỏ
        get count() {
            return this.items.map((item) => item.qty).reduce((total, qty) => (total += qty), 0);
        },

        //Tổng thành tiền các mặt hàng trong giỏ
        get amount() {
            return this.items.map((item) => item.qty * item.price).reduce((total, qty) => (total += qty), 0);
        },
        //Lưu giỏ hàng vào local storage
        saveToLocalStorage() {
            //dùng angular để copy xong đổi các mặt hàng sang json
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },

        //Đọc giỏ hàng từ local storage
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        },
    };

    $scope.cart.loadFromLocalStorage();

    $scope.checkout = document.querySelector("#checkout");
    if ($scope.checkout != undefined) {
        $scope.checkout.addEventListener("click", (e) => {
            e.preventDefault();
            if ($scope.cart.count > 0) {
                window.location.replace("/order/checkout");
            } else {
                alert("Vui lòng mua thêm sản phẩm");
            }
        });
    }

    $scope.order = {
        createDate: new Date(),
        address: "",
        phone: "",
        status: "Đang giao hàng",
        account: { username: $("#username").text() },
        get orderDetails() {
            return $scope.cart.items.map((item) => {
                return {
                    product: { id: item.id },
                    price: item.price,
                    quantity: item.qty,
                };
            });
        },

        purchase() {
            var cart = angular.copy(this);
            var form = document.querySelector("#form-order");
            if ($scope.order.address != "" && $scope.order.phone != "") {
                $http
                    .post("/rest/orders", cart)
                    .then((resp) => {
                        //Thực hiện đặt hàn
                        alert("Đặt hàng thành công!");
                        $scope.cart.clear();
                        location.href = "/order/detail/" + resp.data.id;
                    })
                    .catch((err) => {
                        alert("Đặt hàng lỗi!");
                    });
            } else {
                alert("Vui lòng nhập đủ thông tin");
            }
        },
    };
});
