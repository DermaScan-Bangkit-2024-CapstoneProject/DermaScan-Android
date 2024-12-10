import 'dart:convert';

Paginated paginatedFromJson(String str) => Paginated.fromJson(json.decode(str));

String paginatedToJson(Paginated data) => json.encode(data.toJson());

class Paginated<T> {
    Next next;
    Next previous;
    List<T> resultDatas;

    Paginated({
        required this.next,
        required this.previous,
        required this.resultDatas,
    });

    factory Paginated.fromJson(Map<String, dynamic> json) => Paginated(
        next: Next.fromJson(json["next"]),
        previous: Next.fromJson(json["previous"]),
        resultDatas: List<T>.from(json["resultDatas"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "next": next.toJson(),
        "previous": previous.toJson(),
        "resultDatas": List<T>.from(resultDatas.map((x) => x)),
    };
}

class Next {
    int page;
    int limit;

    Next({
        required this.page,
        required this.limit,
    });

    factory Next.fromJson(Map<String, dynamic> json) => Next(
        page: json["page"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
    };
}
