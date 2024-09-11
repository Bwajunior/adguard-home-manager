import 'dart:convert';

FilteringStatus filteringStatusFromJson(String str) => FilteringStatus.fromJson(json.decode(str));

String filteringStatusToJson(FilteringStatus data) => json.encode(data.toJson());

class FilteringStatus {
  final List<Filter> filters;
  final List<Filter> whitelistFilters;
  List<String> userRules;
  final int interval;
  final bool enabled;

  FilteringStatus({
    required this.filters,
    required this.whitelistFilters,
    required this.userRules,
    required this.interval,
    required this.enabled,
  });

  factory FilteringStatus.fromJson(Map<String, dynamic> json) => FilteringStatus(
    filters: json["filters"] != null ? List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))) : [],
    whitelistFilters: json["whitelist_filters"] != null ? List<Filter>.from(json["whitelist_filters"].map((x) => Filter.fromJson(x))) : [],
    userRules: json["user_rules"] != null ? List<String>.from(json["user_rules"].map((x) => x)) : [],
    interval: json["interval"],
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
    "whitelist_filters": List<dynamic>.from(whitelistFilters.map((x) => x.toJson())),
    "user_rules": List<dynamic>.from(userRules.map((x) => x)),
    "interval": interval,
    "enabled": enabled,
  };
}

class Filter {
  final String url;
  final String name;
  final DateTime? lastUpdated;
  final int id;
  final int rulesCount;
  final bool enabled;

  Filter({
    required this.url,
    required this.name,
    this.lastUpdated,
    required this.id,
    required this.rulesCount,
    required this.enabled,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    url: json["url"],
    name: json["name"],
    lastUpdated: json["last_updated"] != '' && json["last_updated"] != null ? DateTime.parse(json["last_updated"]) : null,
    id: json["id"],
    rulesCount: json["rules_count"],
    enabled: json["enabled"],
  );

    Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "last_updated": lastUpdated?.toIso8601String(),
        "id": id,
        "rules_count": rulesCount,
        "enabled": enabled,
    };
}
