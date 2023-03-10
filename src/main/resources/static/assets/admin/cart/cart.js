app.controller("shopping-cart-ctrl", function ($scope, $http, $location) {
    /*
     * QUẢN LÝ GIỎ HÀNG
     */
    $scope.items = [];
    $scope.details = [];
    $scope.form = {};
    $scope.initialize = function () {
        //load cart
        $http.get("/rest/orders").then((resp) => {
            $scope.items = resp.data;
        });
    };
    $scope.edit = function (item) {
        console.log(item);
        $scope.form = angular.copy(item);
        $("#pills-home-tab").tab("show");
        $http.get(`/rest/orders/detail/${item.id}`).then((resp) => {
            $scope.details = resp.data;
        });
    };
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http
            .put(`/rest/orders/${item.id}`, item)
            .then((resp) => {
                var index = $scope.items.findIndex((p) => p.id == item.id);
                $scope.items[index] = item;
                alert("Cập nhật danh mục thành công!");
                console.log(resp.data);
            })
            .catch((err) => {
                alert("Lỗi cập nhật danh mục!");
                console.log("Error ", err);
            });
    };
    $scope.initialize();

    $scope.pager = {
        page: 0,
        size: 8,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil((1.0 * $scope.items.length) / this.size);
        },
        first() {
            this.page = 0;
        },
        previous() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        },
    };
});
