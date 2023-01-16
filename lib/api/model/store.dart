///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class StoresMetaPagination {
/*
{
  "page": 1,
  "pageSize": 25,
  "pageCount": 1,
  "total": 1
} 
*/

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  StoresMetaPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });
  StoresMetaPagination.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    pageSize = json['pageSize']?.toInt();
    pageCount = json['pageCount']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['pageCount'] = pageCount;
    data['total'] = total;
    return data;
  }
}

class StoresMeta {
/*
{
  "pagination": {
    "page": 1,
    "pageSize": 25,
    "pageCount": 1,
    "total": 1
  }
} 
*/

  StoresMetaPagination? pagination;

  StoresMeta({
    this.pagination,
  });
  StoresMeta.fromJson(Map<String, dynamic> json) {
    pagination = (json['pagination'] != null)
        ? StoresMetaPagination.fromJson(json['pagination'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class StoresDataCoverData {
/*
{
  "id": 20,
  "name": "Xenon_Cover.jpg",
  "alternativeText": "Xenon_Cover.jpg",
  "caption": "Xenon_Cover.jpg",
  "width": 832,
  "height": 320,
  "ext": ".jpg",
  "mime": "image/jpeg",
  "size": 17.41,
  "url": "/uploads/Xenon_Cover_3d50192fb0.jpg"
} 
*/

  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  String? ext;
  String? mime;
  double? size;
  String? url;

  StoresDataCoverData({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.ext,
    this.mime,
    this.size,
    this.url,
  });
  StoresDataCoverData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    alternativeText = json['alternativeText']?.toString();
    caption = json['caption']?.toString();
    width = json['width']?.toInt();
    height = json['height']?.toInt();
    ext = json['ext']?.toString();
    mime = json['mime']?.toString();
    size = json['size']?.toDouble();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}

class StoresDataCover {
/*
{
  "data": {
    "id": 20,
    "name": "Xenon_Cover.jpg",
    "alternativeText": "Xenon_Cover.jpg",
    "caption": "Xenon_Cover.jpg",
    "width": 832,
    "height": 320,
    "ext": ".jpg",
    "mime": "image/jpeg",
    "size": 17.41,
    "url": "/uploads/Xenon_Cover_3d50192fb0.jpg"
  }
} 
*/

  StoresDataCoverData? data;

  StoresDataCover({
    this.data,
  });
  StoresDataCover.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? StoresDataCoverData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StoresDataAvatarData {
/*
{
  "id": 19,
  "name": "Xenon.jpg",
  "width": 1515,
  "height": 1516,
  "ext": ".jpg",
  "mime": "image/jpeg",
  "size": 88.89,
  "url": "/uploads/Xenon_83fc8ae3e9.jpg"
} 
*/

  int? id;
  String? name;
  int? width;
  int? height;
  String? ext;
  String? mime;
  double? size;
  String? url;

  StoresDataAvatarData({
    this.id,
    this.name,
    this.width,
    this.height,
    this.ext,
    this.mime,
    this.size,
    this.url,
  });
  StoresDataAvatarData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    width = json['width']?.toInt();
    height = json['height']?.toInt();
    ext = json['ext']?.toString();
    mime = json['mime']?.toString();
    size = json['size']?.toDouble();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['width'] = width;
    data['height'] = height;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}

class StoresDataAvatar {
/*
{
  "data": {
    "id": 19,
    "name": "Xenon.jpg",
    "width": 1515,
    "height": 1516,
    "ext": ".jpg",
    "mime": "image/jpeg",
    "size": 88.89,
    "url": "/uploads/Xenon_83fc8ae3e9.jpg"
  }
} 
*/

  StoresDataAvatarData? data;

  StoresDataAvatar({
    this.data,
  });
  StoresDataAvatar.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? StoresDataAvatarData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StoresData {
/*
{
  "id": 1,
  "name": "Xenon",
  "location": "Sana'a",
  "email": "Xenon@gmail.com",
  "phone": "777415208",
  "Description": "ok",
  "Link": "https://www.facebook.com/Xenonyemen.777415208?mibextid=ZbWKwL",
  "username": "Xenon",
  "createdAt": "2022-11-14T19:55:48.101Z",
  "avatar": {
    "data": {
      "id": 19,
      "name": "Xenon.jpg",
      "width": 1515,
      "height": 1516,
      "ext": ".jpg",
      "mime": "image/jpeg",
      "size": 88.89,
      "url": "/uploads/Xenon_83fc8ae3e9.jpg"
    }
  },
  "cover": {
    "data": {
      "id": 20,
      "name": "Xenon_Cover.jpg",
      "alternativeText": "Xenon_Cover.jpg",
      "caption": "Xenon_Cover.jpg",
      "width": 832,
      "height": 320,
      "ext": ".jpg",
      "mime": "image/jpeg",
      "size": 17.41,
      "url": "/uploads/Xenon_Cover_3d50192fb0.jpg"
    }
  }
} 
*/

  int? id;
  String? name;
  String? location;
  String? email;
  String? phone;
  String? Description;
  String? Link;
  String? username;
  String? createdAt;
  StoresDataAvatar? avatar;
  StoresDataCover? cover;

  StoresData({
    this.id,
    this.name,
    this.location,
    this.email,
    this.phone,
    this.Description,
    this.Link,
    this.username,
    this.createdAt,
    this.avatar,
    this.cover,
  });
  StoresData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    location = json['location']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    Description = json['Description']?.toString();
    Link = json['Link']?.toString();
    username = json['username']?.toString();
    createdAt = json['createdAt']?.toString();
    avatar = (json['avatar'] != null)
        ? StoresDataAvatar.fromJson(json['avatar'])
        : null;
    cover = (json['cover'] != null)
        ? StoresDataCover.fromJson(json['cover'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['email'] = email;
    data['phone'] = phone;
    data['Description'] = Description;
    data['Link'] = Link;
    data['username'] = username;
    data['createdAt'] = createdAt;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    if (cover != null) {
      data['cover'] = cover!.toJson();
    }
    return data;
  }
}

class Stores {
/*
{
  "data": [
    {
      "id": 1,
      "name": "Xenon",
      "location": "Sana'a",
      "email": "Xenon@gmail.com",
      "phone": "777415208",
      "Description": "ok",
      "Link": "https://www.facebook.com/Xenonyemen.777415208?mibextid=ZbWKwL",
      "username": "Xenon",
      "createdAt": "2022-11-14T19:55:48.101Z",
      "avatar": {
        "data": {
          "id": 19,
          "name": "Xenon.jpg",
          "width": 1515,
          "height": 1516,
          "ext": ".jpg",
          "mime": "image/jpeg",
          "size": 88.89,
          "url": "/uploads/Xenon_83fc8ae3e9.jpg"
        }
      },
      "cover": {
        "data": {
          "id": 20,
          "name": "Xenon_Cover.jpg",
          "alternativeText": "Xenon_Cover.jpg",
          "caption": "Xenon_Cover.jpg",
          "width": 832,
          "height": 320,
          "ext": ".jpg",
          "mime": "image/jpeg",
          "size": 17.41,
          "url": "/uploads/Xenon_Cover_3d50192fb0.jpg"
        }
      }
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 25,
      "pageCount": 1,
      "total": 1
    }
  }
} 
*/

  List<StoresData?>? data;
  StoresMeta? meta;

  Stores({
    this.data,
    this.meta,
  });
  Stores.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <StoresData>[];
      v.forEach((v) {
        arr0.add(StoresData.fromJson(v));
      });
      this.data = arr0;
    }
    meta = (json['meta'] != null) ? StoresMeta.fromJson(json['meta']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}
