class GuideItemDataEntity {
	String msg;
	int code;
	GuideItemDataData data;
	bool success;

	GuideItemDataEntity({this.msg, this.code, this.data, this.success});

	GuideItemDataEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new GuideItemDataData.fromJson(json['data']) : null;
		success = json['success'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['success'] = this.success;
		return data;
	}
}

class GuideItemDataData {
	int startRow;
	List<int> navigatepageNums;
	int prePage;
	bool hasNextPage;
	int nextPage;
	int pageSize;
	int endRow;
	List<GuideItemDataDataList> xList;
	int pageNum;
	int navigatePages;
	int total;
	int navigateFirstPage;
	int pages;
	int size;
	bool isLastPage;
	bool hasPreviousPage;
	int navigateLastPage;
	bool isFirstPage;

	GuideItemDataData({this.startRow, this.navigatepageNums, this.prePage, this.hasNextPage, this.nextPage, this.pageSize, this.endRow, this.xList, this.pageNum, this.navigatePages, this.total, this.navigateFirstPage, this.pages, this.size, this.isLastPage, this.hasPreviousPage, this.navigateLastPage, this.isFirstPage});

	GuideItemDataData.fromJson(Map<String, dynamic> json) {
		startRow = json['startRow'];
		navigatepageNums = json['navigatepageNums']?.cast<int>();
		prePage = json['prePage'];
		hasNextPage = json['hasNextPage'];
		nextPage = json['nextPage'];
		pageSize = json['pageSize'];
		endRow = json['endRow'];
		if (json['list'] != null) {
			xList = new List<GuideItemDataDataList>();(json['list'] as List).forEach((v) { xList.add(new GuideItemDataDataList.fromJson(v)); });
		}
		pageNum = json['pageNum'];
		navigatePages = json['navigatePages'];
		total = json['total'];
		navigateFirstPage = json['navigateFirstPage'];
		pages = json['pages'];
		size = json['size'];
		isLastPage = json['isLastPage'];
		hasPreviousPage = json['hasPreviousPage'];
		navigateLastPage = json['navigateLastPage'];
		isFirstPage = json['isFirstPage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['startRow'] = this.startRow;
		data['navigatepageNums'] = this.navigatepageNums;
		data['prePage'] = this.prePage;
		data['hasNextPage'] = this.hasNextPage;
		data['nextPage'] = this.nextPage;
		data['pageSize'] = this.pageSize;
		data['endRow'] = this.endRow;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['pageNum'] = this.pageNum;
		data['navigatePages'] = this.navigatePages;
		data['total'] = this.total;
		data['navigateFirstPage'] = this.navigateFirstPage;
		data['pages'] = this.pages;
		data['size'] = this.size;
		data['isLastPage'] = this.isLastPage;
		data['hasPreviousPage'] = this.hasPreviousPage;
		data['navigateLastPage'] = this.navigateLastPage;
		data['isFirstPage'] = this.isFirstPage;
		return data;
	}
}

class GuideItemDataDataList {
	String headImg;
	int like;
	String nickName;
	bool touristGuide;
	int follows;
	int certificateGrade;
	bool follow;
	int userId;
	bool followEachOther;
	int fans;

	GuideItemDataDataList({this.headImg, this.like, this.nickName, this.touristGuide, this.follows, this.certificateGrade, this.follow, this.userId, this.followEachOther, this.fans});

	GuideItemDataDataList.fromJson(Map<String, dynamic> json) {
		headImg = json['headImg'];
		like = json['like'];
		nickName = json['nickName'];
		touristGuide = json['touristGuide'];
		follows = json['follows'];
		certificateGrade = json['certificateGrade'];
		follow = json['follow'];
		userId = json['userId'];
		followEachOther = json['followEachOther'];
		fans = json['fans'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['headImg'] = this.headImg;
		data['like'] = this.like;
		data['nickName'] = this.nickName;
		data['touristGuide'] = this.touristGuide;
		data['follows'] = this.follows;
		data['certificateGrade'] = this.certificateGrade;
		data['follow'] = this.follow;
		data['userId'] = this.userId;
		data['followEachOther'] = this.followEachOther;
		data['fans'] = this.fans;
		return data;
	}
}
